import 'package:flutter/material.dart';
import 'package:playbook_polymorphism/core/utils/cents_format.dart';
import 'package:playbook_polymorphism/features/prod_payment/model/payment_receipt.dart';
import 'package:playbook_uikit/widgets/misc/app_list_tile.dart';
import 'package:playbook_uikit/widgets/misc/grouped_rows_card.dart';

/// Who was paid, how much, and every step the payment went through.
class PaymentReceiptCard extends StatelessWidget {
  const PaymentReceiptCard({required this.receipt, super.key});

  final PaymentReceipt receipt;

  @override
  Widget build(BuildContext context) {
    return GroupedRowsCard(
      children: [
        AppListTile(title: 'Paid to', value: receipt.serviceName),
        AppListTile(
          title: 'Amount',
          value: '\$${receipt.amountCents.toDollars()}',
        ),
        for (final step in receipt.steps)
          AppListTile(title: step, icon: Icons.check_circle_outline),
      ],
    );
  }
}
