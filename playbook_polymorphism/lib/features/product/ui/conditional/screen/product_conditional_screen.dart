import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:playbook_polymorphism/features/product/ui/common/widget/product_list_loader.dart';
import 'package:playbook_polymorphism/features/product/ui/conditional/widget/product_conditional_tile.dart';
import 'package:playbook_uikit/theme/theme_provider.dart';
import 'package:playbook_uikit/widgets/app_bar/title_app_bar.dart';

/// The products screen, written with conditionals.
///
/// It looks exactly like the factory version, but the tile switches on
/// `product.type` five times. A new product type means editing every one.
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
        builder: (context, products) => ListView.separated(
          padding: EdgeInsets.only(
            left: 16,
            top: 16,
            right: 16,
            bottom: 16 + MediaQuery.paddingOf(context).bottom,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) =>
              ProductConditionalTile(product: products[index]),
          separatorBuilder: (context, index) => const SizedBox(height: 12),
        ),
      ),
    );
  }
}
