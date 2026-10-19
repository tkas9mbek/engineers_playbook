import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playbook_polymorphism/core/global/global_variables.dart';
import 'package:playbook_polymorphism/features/strategy/domain/delivery_repository.dart';
import 'package:playbook_polymorphism/features/strategy/domain/delivery_strategy.dart';
import 'package:playbook_polymorphism/features/strategy/ui/common/widget/delivery_method_scaffold.dart';
import 'package:playbook_polymorphism/features/strategy/ui/strategy/bloc/delivery_strategy_order_bloc.dart';
import 'package:playbook_polymorphism/features/strategy/ui/strategy/widget/delivery_strategy_view.dart';

@RoutePage()
class DeliveryStrategyScreen extends StatelessWidget {
  const DeliveryStrategyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DeliveryMethodScaffold(
      title: 'Strategy',
      builder: (method) {
        final strategy = DeliveryStrategy.from(
          method,
          getIt<DeliveryRepository>(),
        );

        return BlocProvider(
          create: (context) => DeliveryStrategyOrderBloc(strategy),
          child: DeliveryStrategyView(strategy: strategy),
        );
      },
    );
  }
}
