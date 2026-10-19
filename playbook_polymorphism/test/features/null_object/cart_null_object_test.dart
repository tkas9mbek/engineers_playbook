import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:playbook_polymorphism/features/null_object/domain/no_cart_discount.dart';
import 'package:playbook_polymorphism/features/null_object/domain/percent_cart_discount.dart';
import 'package:playbook_polymorphism/features/null_object/ui/screen/cart_null_object_screen.dart';

import '../../support/pump_app.dart';

void main() {
  test('a percent discount takes its share off', () {
    const discount = PercentCartDiscount(code: 'SAVE10', percent: 10);

    expect(discount.apply(12000), 10800);
    expect(discount.label, 'SAVE10: 10% off');
  });

  test('the null object takes nothing off', () {
    const discount = NoCartDiscount();

    expect(discount.apply(12000), 12000);
    expect(discount.label, 'No promo code');
  });

  group('screen', () {
    testWidgets('the total is the subtotal without a promo code', (
      tester,
    ) async {
      await tester.pumpApp(const CartNullObjectScreen());

      expect(find.text('No promo code'), findsOneWidget);
      expect(find.text(r'$120.00'), findsNWidgets(2));
    });

    testWidgets('applying the promo code lowers the total', (tester) async {
      await tester.pumpApp(const CartNullObjectScreen());

      await tester.tap(find.byType(Switch));
      await tester.pumpAndSettle();

      expect(find.text('SAVE10: 10% off'), findsOneWidget);
      expect(find.text(r'$108.00'), findsOneWidget);
      expect(find.text('No promo code'), findsNothing);
    });
  });
}
