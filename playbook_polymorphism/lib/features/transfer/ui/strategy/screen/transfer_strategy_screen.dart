import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playbook_polymorphism/core/global/global_variables.dart';
import 'package:playbook_polymorphism/features/transfer/model/transfer_audience.dart';
import 'package:playbook_polymorphism/features/transfer/ui/common/bloc/transfer_balance_bloc.dart';
import 'package:playbook_polymorphism/features/transfer/ui/common/bloc/transfer_operation_bloc.dart';
import 'package:playbook_polymorphism/features/transfer/ui/common/widget/transfer_audience_scaffold.dart';
import 'package:playbook_polymorphism/features/transfer/ui/strategy/model/child_transfer_strategy.dart';
import 'package:playbook_polymorphism/features/transfer/ui/strategy/model/standard_transfer_strategy.dart';
import 'package:playbook_polymorphism/features/transfer/ui/strategy/model/transfer_strategy.dart';
import 'package:playbook_polymorphism/features/transfer/ui/strategy/widget/transfer_strategy_view.dart';

@RoutePage()
class TransferStrategyScreen extends StatelessWidget {
  const TransferStrategyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<TransferBalanceBloc>()
                ..add(const TransferBalanceEvent.requested()),
        ),
        BlocProvider(create: (context) => getIt<TransferOperationBloc>()),
      ],
      child: TransferAudienceScaffold(
        title: 'Strategy',
        builder: (audience) =>
            TransferStrategyView(strategy: _resolveStrategy(audience)),
      ),
    );
  }

  // The only place that knows both strategies. In a real app the route or
  // the DI module makes this choice once, never the view.
  TransferStrategy _resolveStrategy(TransferAudience audience) =>
      switch (audience) {
        TransferAudience.standard => const StandardTransferStrategy(),
        TransferAudience.child => const ChildTransferStrategy(),
      };
}
