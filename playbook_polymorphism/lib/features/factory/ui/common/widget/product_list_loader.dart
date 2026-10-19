import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playbook_polymorphism/core/global/global_variables.dart';
import 'package:playbook_polymorphism/features/factory/model/product.dart';
import 'package:playbook_polymorphism/features/factory/ui/common/bloc/product_list_bloc.dart';
import 'package:playbook_uikit/widgets/status/custom_circular_progress_indicator.dart';
import 'package:playbook_uikit/widgets/status/failure_widget.dart';

/// Requests the products, shows a spinner until they arrive and a failure
/// with a retry button if they don't. Shared by both product screens, so
/// loading stays out of the comparison.
class ProductListLoader extends StatelessWidget {
  const ProductListLoader({required this.builder, super.key});

  final Widget Function(BuildContext context, List<Product> products) builder;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<ProductListBloc>()..add(const ProductListEvent.requested()),
      child: BlocBuilder<ProductListBloc, ProductListState>(
        builder: (context, state) => switch (state) {
          SuccessProductListState(:final products) => builder(
            context,
            products,
          ),
          FailureProductListState(:final exception) => FailureWidget(
            exception: exception,
            onRetry: () => context.read<ProductListBloc>().add(
              const ProductListEvent.requested(),
            ),
          ),
          _ => const CustomCircularProgressIndicator(),
        },
      ),
    );
  }
}
