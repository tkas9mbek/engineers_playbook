import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:playbook_polymorphism/core/global/global_variables.dart';
import 'package:playbook_polymorphism/features/transfer/data/mock_transfer_data_source.dart';
import 'package:playbook_polymorphism/features/transfer/domain/transfer_repository.dart';
import 'package:playbook_polymorphism/features/transfer/model/transfer_audience.dart';
import 'package:playbook_polymorphism/features/transfer/ui/common/bloc/transfer_balance_bloc.dart';
import 'package:playbook_polymorphism/features/transfer/ui/common/bloc/transfer_operation_bloc.dart';
import 'package:playbook_polymorphism/features/transfer/ui/conditional/screen/transfer_conditional_screen.dart';
import 'package:playbook_polymorphism/features/transfer/ui/strategy/screen/transfer_strategy_screen.dart';
import 'package:playbook_toolkit/data/mock/mock_network_behavior.dart';
import 'package:playbook_toolkit/data/repository_executor/raw_repository_executor.dart';
import 'package:playbook_toolkit/data/repository_executor/repository_executor_extensions.dart';
import 'package:playbook_uikit/widgets/status/notification_snack_bar.dart';

import '../../support/pump_app.dart';

/// The strategy screen and the conditional screen must look the same: the
/// whole point of the comparison is that only the code differs.
void main() {
  setUp(() {
    final repository = TransferRepository(
      const RawRepositoryExecutor().withErrorHandling(),
      const MockTransferDataSource(MockNetworkBehavior.instant()),
    );

    getIt
      ..registerFactory(() => TransferBalanceBloc(repository))
      ..registerFactory(() => TransferOperationBloc(repository));
  });

  tearDown(getIt.reset);

  Future<void> selectAudience(
    WidgetTester tester,
    TransferAudience audience,
  ) async {
    await tester.tap(find.text(audience.label));
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

  for (final audience in TransferAudience.values) {
    group('${audience.label} audience', () {
      testWidgets('both screens show the same texts', (tester) async {
        await tester.pumpApp(const TransferStrategyScreen());
        await selectAudience(tester, audience);
        final strategyTexts = tester.visibleTexts();

        await tester.pumpApp(const TransferConditionalScreen());
        await selectAudience(tester, audience);
        final conditionalTexts = tester.visibleTexts();

        expect(strategyTexts, contains(r'$2500'));
        expect(conditionalTexts, strategyTexts);
      });

      for (final amount in [20, 100, 2000]) {
        testWidgets('sending \$$amount gives the same result', (tester) async {
          Future<String> send(Widget screen) async {
            await tester.pumpApp(screen);
            await selectAudience(tester, audience);
            await tester.tap(find.text('\$$amount'));
            await tester.pumpAndSettle();
            await tester.tap(find.text('Send \$$amount'));
            await tester.pump(const Duration(milliseconds: 400));

            return readSnackText(tester);
          }

          final strategyResult = await send(const TransferStrategyScreen());
          await tester.pumpAndSettle(const Duration(seconds: 3));
          final conditionalResult = await send(
            const TransferConditionalScreen(),
          );
          await tester.pumpAndSettle(const Duration(seconds: 3));

          expect(strategyResult, isNotEmpty);
          expect(conditionalResult, strategyResult);
        });
      }
    });
  }
}
