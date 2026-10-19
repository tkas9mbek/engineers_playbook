import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:playbook_polymorphism/core/global/global_variables.dart';
import 'package:playbook_polymorphism/core/utils/cents_format.dart';
import 'package:playbook_polymorphism/features/strategy/domain/delivery_repository.dart';
import 'package:playbook_polymorphism/features/strategy/domain/delivery_strategy.dart';
import 'package:playbook_polymorphism/features/strategy/model/delivery_method.dart';
import 'package:playbook_polymorphism/features/strategy/ui/common/widget/delivery_basket_chips.dart';
import 'package:playbook_polymorphism/features/strategy/ui/conditional/screen/delivery_conditional_screen.dart';
import 'package:playbook_polymorphism/features/strategy/ui/strategy/screen/delivery_strategy_screen.dart';
import 'package:playbook_toolkit/data/repository_executor/raw_repository_executor.dart';
import 'package:playbook_uikit/widgets/button/app_elevated_button.dart';
import 'package:playbook_uikit/widgets/status/notification_snack_bar.dart';

import '../../support/delivery_data_source_fakes.dart';
import '../../support/pump_app.dart';

/// The strategy screen and the conditional screen must look the same: the
/// whole point of the comparison is that only the code differs.
void main() {
  late RecordingDeliveryDataSource dataSource;

  setUp(() {
    dataSource = RecordingDeliveryDataSource();
    final repository = DeliveryRepository(
      const RawRepositoryExecutor(),
      dataSource,
    );

    getIt.registerFactory(() => repository);
  });

  tearDown(getIt.reset);

  Future<void> selectMethod(WidgetTester tester, DeliveryMethod method) async {
    await tester.tap(find.text(method.label));
    await tester.pumpAndSettle();
  }

  Future<void> selectBasket(WidgetTester tester, int subtotalCents) async {
    await tester.tap(
      find.descendant(
        of: find.byType(DeliveryBasketChips),
        matching: find.text('\$${subtotalCents.toDollars()}'),
      ),
    );
    await tester.pumpAndSettle();
  }

  String readSnackText(WidgetTester tester) => tester
      .widgetList<Text>(
        find.descendant(
          of: find.byType(NotificationSnackBar),
          matching: find.byType(Text),
        ),
      )
      .map((text) => text.data)
      .join();

  testWidgets('a failed order shows the same error message', (tester) async {
    await getIt.unregister<DeliveryRepository>();
    getIt.registerFactory(
      () => DeliveryRepository(
        const RawRepositoryExecutor(),
        FailingDeliveryDataSource(),
      ),
    );

    Future<String> place(Widget screen) async {
      await tester.pumpApp(screen);
      await tester.tap(find.text('Place order'));
      await tester.pump(const Duration(milliseconds: 400));
      final text = readSnackText(tester);
      await tester.pumpAndSettle(const Duration(seconds: 3));

      return text;
    }

    final strategyResult = await place(const DeliveryStrategyScreen());
    final conditionalResult = await place(const DeliveryConditionalScreen());

    expect(strategyResult, 'Orders are paused');
    expect(conditionalResult, strategyResult);
  });

  testWidgets('changing the basket mid-order does not change the result', (
    tester,
  ) async {
    Future<String> place(Widget screen) async {
      final manual = ManualDeliveryDataSource();
      await getIt.unregister<DeliveryRepository>();
      getIt.registerFactory(
        () => DeliveryRepository(const RawRepositoryExecutor(), manual),
      );

      await tester.pumpApp(screen);
      await tester.tap(find.text('Place order'));
      await tester.pump();

      // The basket changes while the order is still open.
      await tester.tap(
        find.descendant(
          of: find.byType(DeliveryBasketChips),
          matching: find.text(r'$60.00'),
        ),
      );
      await tester.pump();

      manual.finish();
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 400));
      final text = readSnackText(tester);
      await tester.pumpAndSettle(const Duration(seconds: 3));

      return text;
    }

    final strategyResult = await place(const DeliveryStrategyScreen());
    final conditionalResult = await place(const DeliveryConditionalScreen());

    // The order was placed for $40 + $5 fee, whatever the basket says now.
    expect(strategyResult, r'Order placed. Total $45.00.');
    expect(conditionalResult, strategyResult);
  });

  testWidgets('Express over its limit looks the same and can not be placed', (
    tester,
  ) async {
    Future<List<String>> read(Widget screen) async {
      await tester.pumpApp(screen);
      await selectMethod(tester, DeliveryMethod.express);
      await selectBasket(tester, 6000);

      final button = tester.widget<AppElevatedButton>(
        find.byType(AppElevatedButton),
      );
      expect(button.enabled, isFalse);

      return tester.visibleTexts();
    }

    final strategyTexts = await read(const DeliveryStrategyScreen());
    final conditionalTexts = await read(const DeliveryConditionalScreen());

    expect(strategyTexts, contains('Note'));
    expect(strategyTexts, contains(r'Express takes baskets up to $50.00'));
    expect(conditionalTexts, strategyTexts);
    expect(dataSource.orders, isEmpty);
  });

  for (final method in DeliveryMethod.values) {
    group('${method.label} delivery', () {
      for (final subtotalCents in [2000, 4000, 6000]) {
        final dollars = subtotalCents.toDollars();

        testWidgets('both screens show the same texts for \$$dollars', (
          tester,
        ) async {
          Future<List<String>> read(Widget screen) async {
            await tester.pumpApp(screen);
            await selectMethod(tester, method);
            await selectBasket(tester, subtotalCents);

            return tester.visibleTexts();
          }

          final strategyTexts = await read(const DeliveryStrategyScreen());
          final conditionalTexts = await read(
            const DeliveryConditionalScreen(),
          );

          expect(strategyTexts, contains('Total'));
          expect(conditionalTexts, strategyTexts);
        });

        final reason = DeliveryStrategy.from(
          method,
          DeliveryRepository(
            const RawRepositoryExecutor(),
            RecordingDeliveryDataSource(),
          ),
        ).unavailableReasonFor(subtotalCents);

        // A delivery that can't take the basket has a disabled button, so
        // there is no order to place. That case has its own test above.
        if (reason == null) {
          testWidgets('placing a \$$dollars order gives the same result', (
            tester,
          ) async {
            Future<String> place(Widget screen) async {
              await tester.pumpApp(screen);
              await selectMethod(tester, method);
              await selectBasket(tester, subtotalCents);
              await tester.tap(find.text('Place order'));
              await tester.pump(const Duration(milliseconds: 400));

              return readSnackText(tester);
            }

            final strategyResult = await place(const DeliveryStrategyScreen());
            await tester.pumpAndSettle(const Duration(seconds: 3));
            final conditionalResult = await place(
              const DeliveryConditionalScreen(),
            );
            await tester.pumpAndSettle(const Duration(seconds: 3));

            expect(strategyResult, startsWith('Order placed'));
            expect(conditionalResult, strategyResult);
            expect(dataSource.orders, hasLength(2));
            expect(dataSource.orders.first, dataSource.orders.last);
          });
        }
      }
    });
  }
}
