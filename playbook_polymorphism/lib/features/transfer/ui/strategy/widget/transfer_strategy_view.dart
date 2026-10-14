import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playbook_polymorphism/features/transfer/ui/common/bloc/transfer_operation_bloc.dart';
import 'package:playbook_polymorphism/features/transfer/ui/common/widget/transfer_action_tile.dart';
import 'package:playbook_polymorphism/features/transfer/ui/common/widget/transfer_amount_chips.dart';
import 'package:playbook_polymorphism/features/transfer/ui/common/widget/transfer_section.dart';
import 'package:playbook_polymorphism/features/transfer/ui/common/widget/transfer_summary_card.dart';
import 'package:playbook_polymorphism/features/transfer/ui/strategy/model/transfer_strategy.dart';
import 'package:playbook_uikit/widgets/button/app_elevated_button.dart';
import 'package:playbook_uikit/widgets/status/notification_snack_bar.dart';
import 'package:playbook_uikit/widgets/text/title_subtitle.dart';

/// The transfers screen content, written with a strategy.
///
/// Read it top to bottom: there is no `if` and no `switch` on who the
/// screen is for. Everything that differs comes from [strategy].
class TransferStrategyView extends StatefulWidget {
  const TransferStrategyView({required this.strategy, super.key});

  final TransferStrategy strategy;

  @override
  State<TransferStrategyView> createState() => _TransferStrategyViewState();
}

class _TransferStrategyViewState extends State<TransferStrategyView> {
  int _actionIndex = 0;
  int _amount = 100;

  void onSend() {
    final error = widget.strategy.validate(_amount);

    if (error != null) {
      return NotificationSnackBar.show(
        context,
        NotificationSnackBar.error(text: error),
      );
    }

    context.read<TransferOperationBloc>().add(
      TransferOperationEvent.submitted(_amount),
    );
  }

  @override
  Widget build(BuildContext context) {
    final strategy = widget.strategy;
    final actions = strategy.actions;

    final items = <Widget>[
      TitleSubtitle(
        title: strategy.title,
        subtitle: strategy.subtitle,
        textAlign: TextAlign.start,
      ),
      TransferSection(
        title: 'How to send',
        child: Column(
          spacing: 8,
          children: [
            for (var i = 0; i < actions.length; i++)
              TransferActionTile(
                action: actions[i],
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
          dailyLimit: strategy.dailyLimit,
          fee: strategy.feeFor(_amount),
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
            NotificationSnackBar.success(
              text: strategy.confirmationMessage(amount),
            ),
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
