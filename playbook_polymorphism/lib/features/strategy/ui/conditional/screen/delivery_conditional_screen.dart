import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playbook_polymorphism/core/global/global_variables.dart';
import 'package:playbook_polymorphism/features/strategy/domain/delivery_repository.dart';
import 'package:playbook_polymorphism/features/strategy/ui/common/widget/delivery_method_scaffold.dart';
import 'package:playbook_polymorphism/features/strategy/ui/conditional/bloc/delivery_conditional_order_bloc.dart';
import 'package:playbook_polymorphism/features/strategy/ui/conditional/widget/delivery_conditional_view.dart';

@RoutePage()
class DeliveryConditionalScreen extends StatelessWidget {
  const DeliveryConditionalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DeliveryMethodScaffold(
      title: 'Conditional',
      builder: (method) => BlocProvider(
        create: (context) =>
            DeliveryConditionalOrderBloc(getIt<DeliveryRepository>()),
        child: DeliveryConditionalView(method: method),
      ),
    );
  }
}
