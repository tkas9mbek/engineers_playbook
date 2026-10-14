import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:playbook_polymorphism/features/cart/ui/widget/cart_discount_demo_panel.dart';
import 'package:playbook_uikit/widgets/article/pattern_layout.dart';

@RoutePage()
class CartNullObjectScreen extends StatelessWidget {
  const CartNullObjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PatternLayout(
      title: 'Null object',
      intro:
          'No promo code does not mean null. It means a discount that takes '
          'nothing off. Flip the switch: the summary never checks whether '
          'a promo code exists.',
      demo: CartDiscountDemoPanel(),
      whenToUse:
          'An optional thing makes you write "if it exists" in many places '
          '(discount, logger, callback). Give "nothing" its own object with '
          'the same interface, and the checks disappear.',
    );
  }
}
