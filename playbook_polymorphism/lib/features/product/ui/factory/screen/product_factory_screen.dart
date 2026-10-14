import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:playbook_polymorphism/features/product/ui/common/widget/product_list_loader.dart';
import 'package:playbook_polymorphism/features/product/ui/common/widget/product_tile.dart';
import 'package:playbook_polymorphism/features/product/ui/factory/model/product_ui_model.dart';
import 'package:playbook_uikit/theme/theme_provider.dart';
import 'package:playbook_uikit/widgets/app_bar/title_app_bar.dart';

/// The products screen, written with a factory method.
///
/// There is no `switch` on the product type here. Each tile asks its
/// [ProductUiModel], which `ProductUiModel.from` created once.
@RoutePage()
class ProductFactoryScreen extends StatelessWidget {
  const ProductFactoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.of(context).theme;

    return Scaffold(
      backgroundColor: theme.background,
      appBar: const TitleAppBar(title: 'My products'),
      body: ProductListLoader(
        builder: (context, products) => ListView.separated(
          padding: EdgeInsets.only(
            left: 16,
            top: 16,
            right: 16,
            bottom: 16 + MediaQuery.paddingOf(context).bottom,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) =>
              _ProductFactoryTile(model: ProductUiModel.from(products[index])),
          separatorBuilder: (context, index) => const SizedBox(height: 12),
        ),
      ),
    );
  }
}

class _ProductFactoryTile extends StatelessWidget {
  const _ProductFactoryTile({required this.model});

  final ProductUiModel model;

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.of(context).theme;

    return ProductTile(
      title: model.title,
      subtitle: model.subtitle,
      icon: model.icon,
      accent: model.accent(theme),
      badge: model.badge,
      onTap: () => model.onTap(context),
    );
  }
}
