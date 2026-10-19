import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playbook_polymorphism/core/utils/cents_format.dart';
import 'package:playbook_polymorphism/features/prod_payment/ui/bloc/payment_bloc.dart';
import 'package:playbook_polymorphism/features/prod_payment/ui/bloc/payment_state_event.dart';
import 'package:playbook_polymorphism/features/prod_payment/ui/widget/payment_receipt_card.dart';
import 'package:playbook_uikit/widgets/button/app_elevated_button.dart';
import 'package:playbook_uikit/widgets/misc/app_list_tile.dart';
import 'package:playbook_uikit/widgets/misc/grouped_rows_card.dart';
import 'package:playbook_uikit/widgets/status/notification_snack_bar.dart';

/// One bill and a Pay button. There is no `if` on the payment type: the bloc
/// pays through its strategy and the receipt shows what happened.
class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  /// 25 dollars, in cents.
  static const int _amountCents = 2500;

  void _onPay(BuildContext context) {
    context.read<PaymentBloc>().add(const PaymentEvent.submitted(_amountCents));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentBloc, PaymentState>(
      listener: (context, state) {
        if (state case FailurePaymentState(:final exception)) {
          NotificationSnackBar.showExceptionMessage(
            context,
            exception: exception,
          );
        }
      },
      builder: (context, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 16,
        children: [
          GroupedRowsCard(
            children: [
              AppListTile(
                title: 'Amount',
                value: '\$${_amountCents.toDollars()}',
              ),
            ],
          ),
          AppElevatedButton.big(
            context: context,
            text: 'Pay',
            loading: state.isPaying,
            onPressed: () => _onPay(context),
          ),
          if (state case SuccessPaymentState(:final receipt))
            PaymentReceiptCard(receipt: receipt),
        ],
      ),
    );
  }
}
