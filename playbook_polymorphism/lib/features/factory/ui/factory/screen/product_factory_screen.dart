import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:playbook_polymorphism/features/factory/ui/common/widget/product_list_loader.dart';
import 'package:playbook_polymorphism/features/factory/ui/common/widget/product_tile.dart';
import 'package:playbook_polymorphism/features/factory/ui/factory/model/product_ui_model.dart';
import 'package:playbook_uikit/theme/theme_provider.dart';
import 'package:playbook_uikit/utils/functions/safe_size_functions.dart';
import 'package:playbook_uikit/widgets/app_bar/title_app_bar.dart';

/// The products screen, written with a factory.
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
        builder: (context, products) => SingleChildScrollView(
          padding: getScreenPadding(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 12,
            children: [
              for (final product in products)
                _ProductFactoryTile(model: ProductUiModel.from(product)),
            ],
          ),
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
