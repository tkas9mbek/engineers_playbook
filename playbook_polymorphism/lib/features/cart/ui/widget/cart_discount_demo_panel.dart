import 'package:flutter/material.dart';
import 'package:playbook_polymorphism/features/cart/domain/cart_discount.dart';
import 'package:playbook_polymorphism/features/cart/domain/no_cart_discount.dart';
import 'package:playbook_polymorphism/features/cart/domain/percent_cart_discount.dart';
import 'package:playbook_polymorphism/features/cart/ui/widget/cart_summary_card.dart';
import 'package:playbook_uikit/widgets/misc/app_list_tile.dart';
import 'package:playbook_uikit/widgets/misc/grouped_rows_card.dart';

/// A small cart and a switch that applies a promo code. The summary below
/// is the same code either way.
class CartDiscountDemoPanel extends StatefulWidget {
  const CartDiscountDemoPanel({super.key});

  @override
  State<CartDiscountDemoPanel> createState() => _CartDiscountDemoPanelState();
}

class _CartDiscountDemoPanelState extends State<CartDiscountDemoPanel> {
  static const Map<String, int> _prices = {
    'Coffee machine': 80,
    'Filter pack': 30,
    'Delivery': 10,
  };

  bool _promoApplied = false;

  CartDiscount get _discount => _promoApplied
      ? const PercentCartDiscount(code: 'SAVE10', percent: 10)
      : const NoCartDiscount();

  void _onPromoChanged(bool value) => setState(() => _promoApplied = value);

  @override
  Widget build(BuildContext context) {
    final subtotal = _prices.values.fold(0, (sum, price) => sum + price);

    return Column(
      spacing: 16,
      children: [
        GroupedRowsCard(
          children: [
            for (final MapEntry(:key, :value) in _prices.entries)
              AppListTile(title: key, value: '\$$value'),
          ],
        ),
        GroupedRowsCard(
          children: [
            AppListTile(
              title: 'Use promo code SAVE10',
              trailing: Switch(
                value: _promoApplied,
                onChanged: _onPromoChanged,
              ),
            ),
          ],
        ),
        CartSummaryCard(subtotal: subtotal, discount: _discount),
      ],
    );
  }
}
