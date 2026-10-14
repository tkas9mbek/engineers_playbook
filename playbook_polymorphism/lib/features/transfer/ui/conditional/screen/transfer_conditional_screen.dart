import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playbook_polymorphism/core/global/global_variables.dart';
import 'package:playbook_polymorphism/features/transfer/ui/common/bloc/transfer_balance_bloc.dart';
import 'package:playbook_polymorphism/features/transfer/ui/common/bloc/transfer_operation_bloc.dart';
import 'package:playbook_polymorphism/features/transfer/ui/common/widget/transfer_audience_scaffold.dart';
import 'package:playbook_polymorphism/features/transfer/ui/conditional/widget/transfer_conditional_view.dart';

@RoutePage()
class TransferConditionalScreen extends StatelessWidget {
  const TransferConditionalScreen({super.key});

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
        title: 'Conditional',
        builder: (audience) => TransferConditionalView(audience: audience),
      ),
    );
  }
}
