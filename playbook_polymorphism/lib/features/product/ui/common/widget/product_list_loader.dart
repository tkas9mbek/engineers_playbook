import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playbook_polymorphism/core/global/global_variables.dart';
import 'package:playbook_polymorphism/features/product/model/product.dart';
import 'package:playbook_polymorphism/features/product/ui/common/bloc/product_list_bloc.dart';
import 'package:playbook_uikit/widgets/status/custom_circular_progress_indicator.dart';

/// Requests the products and shows a spinner until they arrive. A failure
/// is not handled here; this demo's mock backend never fails. Shared by
/// both product screens, so loading stays out of the comparison.
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
          _ => const Center(child: CustomCircularProgressIndicator()),
        },
      ),
    );
  }
}
