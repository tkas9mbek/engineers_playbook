import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playbook_polymorphism/features/transfer/model/transfer_audience.dart';
import 'package:playbook_polymorphism/features/transfer/ui/common/bloc/transfer_operation_bloc.dart';
import 'package:playbook_polymorphism/features/transfer/ui/common/model/transfer_action_ui_model.dart';
import 'package:playbook_polymorphism/features/transfer/ui/common/widget/transfer_action_tile.dart';
import 'package:playbook_polymorphism/features/transfer/ui/common/widget/transfer_amount_chips.dart';
import 'package:playbook_polymorphism/features/transfer/ui/common/widget/transfer_section.dart';
import 'package:playbook_polymorphism/features/transfer/ui/common/widget/transfer_summary_card.dart';
import 'package:playbook_uikit/widgets/button/app_elevated_button.dart';
import 'package:playbook_uikit/widgets/status/notification_snack_bar.dart';
import 'package:playbook_uikit/widgets/text/title_subtitle.dart';

/// The transfers screen content, written with conditionals.
///
/// It looks exactly like the strategy version, but every difference between
/// audiences is a `switch` on [audience] inside the view. Count them: a new
/// audience means editing every one.
class TransferConditionalView extends StatefulWidget {
  const TransferConditionalView({required this.audience, super.key});

  final TransferAudience audience;

  @override
  State<TransferConditionalView> createState() =>
      _TransferConditionalViewState();
}

class _TransferConditionalViewState extends State<TransferConditionalView> {
  int _actionIndex = 0;
  int _amount = 100;

  // Switch 1
  String get title => switch (widget.audience) {
    TransferAudience.standard => 'Transfers',
    TransferAudience.child => 'Pocket money',
  };

  // Switch 2
  String get subtitle => switch (widget.audience) {
    TransferAudience.standard => 'Send money to anyone',
    TransferAudience.child => 'Send money to your family',
  };

  // Switch 3
  List<TransferActionUiModel> get actions => switch (widget.audience) {
    TransferAudience.standard => const [
      TransferActionUiModel(
        title: 'To a phone number',
        icon: Icons.phone_outlined,
      ),
      TransferActionUiModel(
        title: 'To a card',
        icon: Icons.credit_card_outlined,
      ),
      TransferActionUiModel(title: 'By QR code', icon: Icons.qr_code_2),
      TransferActionUiModel(title: 'Abroad (SWIFT)', icon: Icons.public),
    ],
    TransferAudience.child => const [
      TransferActionUiModel(title: 'To a parent', icon: Icons.family_restroom),
      TransferActionUiModel(
        title: "To a friend's phone",
        icon: Icons.phone_outlined,
      ),
    ],
  };

  // Switch 4
  int get dailyLimit => switch (widget.audience) {
    TransferAudience.standard => 1000,
    TransferAudience.child => 50,
  };

  // Switch 5
  String get limitExceededMessage => switch (widget.audience) {
    TransferAudience.standard => r'The daily limit is $1000',
    TransferAudience.child => r'Ask a parent to raise your $50 limit',
  };

  // Switch 6
  int calculateFee(int amount) => switch (widget.audience) {
    TransferAudience.standard => (amount * 0.01).round(),
    TransferAudience.child => 0,
  };

  // Switch 7
  String buildConfirmation(int amount) => switch (widget.audience) {
    TransferAudience.standard =>
      'Sent \$$amount. Fee \$${calculateFee(amount)}.',
    TransferAudience.child => 'Sent \$$amount. A parent was notified.',
  };

  void onSend() {
    if (_amount > dailyLimit) {
      return NotificationSnackBar.show(
        context,
        NotificationSnackBar.error(text: limitExceededMessage),
      );
    }

    context.read<TransferOperationBloc>().add(
      TransferOperationEvent.submitted(_amount),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentActions = actions;

    final items = <Widget>[
      TitleSubtitle(
        title: title,
        subtitle: subtitle,
        textAlign: TextAlign.start,
      ),
      TransferSection(
        title: 'How to send',
        child: Column(
          spacing: 8,
          children: [
            for (var i = 0; i < currentActions.length; i++)
              TransferActionTile(
                action: currentActions[i],
                selected: i == _actionIndex,
                onTap: () => setState(() => _actionIndex = i),
              ),
          ],
        ),
      ),
      TransferSection(
        title: 'Amount',
        child: TransferAmountChips(
          selected: _amount,
          onSelected: (amount) => setState(() => _amount = amount),
        ),
      ),
      TransferSection(
        title: 'Summary',
        child: TransferSummaryCard(
          dailyLimit: dailyLimit,
          fee: calculateFee(_amount),
        ),
      ),
      BlocBuilder<TransferOperationBloc, TransferOperationState>(
        builder: (context, state) => AppElevatedButton.big(
          context: context,
          text: 'Send \$$_amount',
          loading: state.isSubmitting,
          onPressed: onSend,
        ),
      ),
    ];

    return BlocListener<TransferOperationBloc, TransferOperationState>(
      listener: (context, state) {
        if (state case SuccessTransferOperationState(:final amount)) {
          NotificationSnackBar.show(
            context,
            NotificationSnackBar.success(text: buildConfirmation(amount)),
          );
        }
      },
      child: ListView.separated(
        padding: EdgeInsets.only(
          left: 16,
          top: 16,
          right: 16,
          bottom: 16 + MediaQuery.paddingOf(context).bottom,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) => items[index],
        separatorBuilder: (context, index) => const SizedBox(height: 24),
      ),
    );
  }
}
