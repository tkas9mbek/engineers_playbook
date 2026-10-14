import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playbook_polymorphism/features/transfer/ui/common/bloc/transfer_balance_bloc.dart';
import 'package:playbook_uikit/widgets/misc/app_list_tile.dart';
import 'package:playbook_uikit/widgets/misc/grouped_rows_card.dart';

/// The balance (loaded from the backend), the daily limit and the fee for
/// the chosen amount.
class TransferSummaryCard extends StatelessWidget {
  const TransferSummaryCard({
    required this.dailyLimit,
    required this.fee,
    super.key,
  });

  final int dailyLimit;
  final int fee;

  @override
  Widget build(BuildContext context) {
    return GroupedRowsCard(
      children: [
        BlocBuilder<TransferBalanceBloc, TransferBalanceState>(
          builder: (context, state) => AppListTile(
            title: 'Balance',
            value: switch (state) {
              SuccessTransferBalanceState(:final balance) => '\$$balance',
              _ => null,
            },
            loading: state is! SuccessTransferBalanceState,
          ),
        ),
        AppListTile(title: 'Daily limit', value: '\$$dailyLimit'),
        AppListTile(title: 'Fee', value: fee == 0 ? 'Free' : '\$$fee'),
      ],
    );
  }
}
