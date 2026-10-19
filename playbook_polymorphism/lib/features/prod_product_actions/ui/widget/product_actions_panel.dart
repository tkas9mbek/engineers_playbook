import 'package:flutter/material.dart';
import 'package:playbook_polymorphism/core/global/global_variables.dart';
import 'package:playbook_polymorphism/features/factory/ui/common/widget/product_list_loader.dart';
import 'package:playbook_polymorphism/features/factory/ui/factory/model/product_ui_model.dart';
import 'package:playbook_polymorphism/features/prod_product_actions/domain/product_action_repository.dart';
import 'package:playbook_polymorphism/features/prod_product_actions/domain/product_action_strategy.dart';
import 'package:playbook_polymorphism/features/prod_product_actions/ui/widget/product_action_tile.dart';

/// Loads the products and shows one tile per product. Two factories are called
/// once per row: one builds the look, the other builds the action.
class ProductActionsPanel extends StatelessWidget {
  const ProductActionsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return ProductListLoader(
      builder: (context, products) {
        final repository = getIt<ProductActionRepository>();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 16,
          children: [
            for (final product in products)
              ProductActionTile(
                model: ProductUiModel.from(product),
                strategy: ProductActionStrategy.from(product, repository),
              ),
          ],
        );
      },
    );
  }
}
