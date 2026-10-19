import 'package:flutter/material.dart';
import 'package:playbook_polymorphism/core/utils/cents_format.dart';
import 'package:playbook_uikit/widgets/misc/app_list_tile.dart';
import 'package:playbook_uikit/widgets/misc/grouped_rows_card.dart';

/// The basket, the delivery fee, when it arrives and the total.
class DeliverySummaryCard extends StatelessWidget {
  const DeliverySummaryCard({
    required this.subtotalCents,
    required this.fee,
    required this.days,
    this.unavailableReason,
    super.key,
  });

  final int subtotalCents;
  final int fee;
  final int days;

  /// Why this delivery can't take the basket. Null when it can.
  final String? unavailableReason;

  String get _arrival => switch (days) {
    0 => 'Today',
    1 => 'Tomorrow',
    _ => 'In $days days',
  };

  @override
  Widget build(BuildContext context) {
    return GroupedRowsCard(
      children: [
        AppListTile(title: 'Basket', value: '\$${subtotalCents.toDollars()}'),
        AppListTile(
          title: 'Delivery fee',
          value: fee == 0 ? 'Free' : '\$${fee.toDollars()}',
        ),
        AppListTile(title: 'Arrives', value: _arrival),
        AppListTile(
          title: 'Total',
          value: '\$${(subtotalCents + fee).toDollars()}',
        ),
        if (unavailableReason case final reason?)
          AppListTile(title: 'Note', subtitle: reason),
      ],
    );
  }
}
