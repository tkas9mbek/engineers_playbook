import 'package:flutter/material.dart';
import 'package:playbook_polymorphism/features/cart/domain/cart_discount.dart';
import 'package:playbook_uikit/widgets/misc/app_list_tile.dart';
import 'package:playbook_uikit/widgets/misc/grouped_rows_card.dart';

/// Subtotal, promo code and total. It never asks whether there is a promo
/// code: the discount is always there, and may be a [NoCartDiscount].
class CartSummaryCard extends StatelessWidget {
  const CartSummaryCard({
    required this.subtotal,
    required this.discount,
    super.key,
  });

  final int subtotal;
  final CartDiscount discount;

  @override
  Widget build(BuildContext context) {
    return GroupedRowsCard(
      children: [
        AppListTile(title: 'Subtotal', value: '\$$subtotal'),
        AppListTile(title: 'Promo code', value: discount.label),
        AppListTile(title: 'Total', value: '\$${discount.apply(subtotal)}'),
      ],
    );
  }
}
