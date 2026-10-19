import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:playbook_polymorphism/core/global/global_variables.dart';
import 'package:playbook_polymorphism/features/factory/data/mock_product_data_source.dart';
import 'package:playbook_polymorphism/features/factory/domain/product_repository.dart';
import 'package:playbook_polymorphism/features/factory/ui/common/bloc/product_list_bloc.dart';
import 'package:playbook_polymorphism/features/factory/ui/conditional/screen/product_conditional_screen.dart';
import 'package:playbook_polymorphism/features/factory/ui/factory/screen/product_factory_screen.dart';
import 'package:playbook_toolkit/data/mock/mock_network_behavior.dart';
import 'package:playbook_toolkit/data/repository_executor/raw_repository_executor.dart';
import 'package:playbook_toolkit/data/repository_executor/repository_executor_extensions.dart';
import 'package:playbook_uikit/widgets/status/notification_snack_bar.dart';

import '../../support/pump_app.dart';

/// The factory screen and the conditional screen must look the same.
void main() {
  setUp(() {
    final repository = ProductRepository(
      const RawRepositoryExecutor().withErrorHandling(),
      const MockProductDataSource(MockNetworkBehavior.instant()),
    );

    getIt.registerFactory(() => ProductListBloc(repository));
  });

  tearDown(getIt.reset);

  testWidgets('both screens show the same texts', (tester) async {
    await tester.pumpApp(const ProductFactoryScreen());
    final factoryTexts = tester.visibleTexts();

    await tester.pumpApp(const ProductConditionalScreen());
    final conditionalTexts = tester.visibleTexts();

    expect(factoryTexts, contains('Visa Classic'));
    expect(factoryTexts, contains('Smart Deposit'));
    expect(factoryTexts, contains('Everyday Credit'));
    expect(factoryTexts, contains('Crypto Wallet'));
    expect(conditionalTexts, factoryTexts);
  });

  testWidgets('tapping each tile shows the same message', (tester) async {
    Future<List<String>> tapAll(Widget screen) async {
      await tester.pumpApp(screen);
      final messages = <String>[];

      for (final title in [
        'Visa Classic',
        'Smart Deposit',
        'Everyday Credit',
        'Crypto Wallet',
      ]) {
        await tester.tap(find.text(title).first);
        await tester.pump(const Duration(milliseconds: 400));
        messages.add(
          tester
              .widgetList<Text>(
                find.descendant(
                  of: find.byType(NotificationSnackBar),
                  matching: find.byType(Text),
                ),
              )
              .map((text) => text.data)
              .join(),
        );
        await tester.pumpAndSettle(const Duration(seconds: 3));
      }

      return messages;
    }

    final factoryMessages = await tapAll(const ProductFactoryScreen());
    final conditionalMessages = await tapAll(const ProductConditionalScreen());

    expect(factoryMessages, everyElement(isNotEmpty));
    expect(conditionalMessages, factoryMessages);
  });
}
