import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playbook_polymorphism/core/global/global_variables.dart';
import 'package:playbook_polymorphism/features/rate/ui/bloc/rate_details_bloc.dart';
import 'package:playbook_polymorphism/features/rate/ui/widget/rate_decorator_panel.dart';
import 'package:playbook_uikit/widgets/article/pattern_layout.dart';

@RoutePage()
class RateDecoratorScreen extends StatelessWidget {
  const RateDecoratorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RateDetailsBloc>(),
      child: const PatternLayout(
        title: 'Decorator',
        intro:
            'Wrap an object in another one with the same interface to add '
            'behavior. The backend here fails twice before it answers. '
            'Retry hides that, and Logging shows what happened.',
        demo: RateDecoratorPanel(),
        whenToUse:
            'Retry, logging, caching, error handling: anything that belongs '
            'around a call and not inside it. Each concern is its own small '
            'class, and you stack them in the order you need.',
      ),
    );
  }
}
