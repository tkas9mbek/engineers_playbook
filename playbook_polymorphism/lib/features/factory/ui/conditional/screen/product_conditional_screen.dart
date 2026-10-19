import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:playbook_polymorphism/features/factory/ui/common/widget/product_list_loader.dart';
import 'package:playbook_polymorphism/features/factory/ui/conditional/widget/product_conditional_tile.dart';
import 'package:playbook_uikit/theme/theme_provider.dart';
import 'package:playbook_uikit/utils/functions/safe_size_functions.dart';
import 'package:playbook_uikit/widgets/app_bar/title_app_bar.dart';

/// The products screen, written with conditionals.
///
/// It looks exactly like the factory version, but the tile has one
/// `switch` on `product.type` that returns everything it needs.
@RoutePage()
class ProductConditionalScreen extends StatelessWidget {
  const ProductConditionalScreen({super.key});

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
                ProductConditionalTile(product: product),
            ],
          ),
        ),
      ),
    );
  }
}
