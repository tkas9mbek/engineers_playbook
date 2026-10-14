import 'package:flutter/material.dart';
import 'package:playbook_polymorphism/features/product/model/product.dart';
import 'package:playbook_polymorphism/features/product/model/product_type.dart';
import 'package:playbook_polymorphism/features/product/ui/common/widget/product_tile.dart';
import 'package:playbook_uikit/theme/app_theme.dart';
import 'package:playbook_uikit/theme/theme_provider.dart';
import 'package:playbook_uikit/widgets/status/notification_snack_bar.dart';

/// One product row, written with conditionals: it switches on
/// `product.type` five times. A new product type means editing every one.
class ProductConditionalTile extends StatelessWidget {
  const ProductConditionalTile({required this.product, super.key});

  final Product product;

  String get title => product.name;

  // Switch 1
  IconData get icon => switch (product.type) {
    ProductType.debit => Icons.credit_card,
    ProductType.deposit => Icons.savings_outlined,
    ProductType.credit => Icons.account_balance_outlined,
    ProductType.unknown => Icons.help_outline,
  };

  // Switch 2
  Color resolveAccent(AppTheme theme) => switch (product.type) {
    ProductType.debit => theme.accent,
    ProductType.deposit => theme.success,
    ProductType.credit => theme.warning,
    ProductType.unknown => theme.textSecondary,
  };

  // Switch 3
  String get subtitle => switch (product.type) {
    ProductType.debit => 'Balance \$${product.balance.toStringAsFixed(2)}',
    ProductType.deposit => 'Saved \$${product.balance.toStringAsFixed(2)}',
    ProductType.credit =>
      'Used \$${product.balance.toStringAsFixed(0)} of '
          '\$${product.creditLimit!.toStringAsFixed(0)}',
    ProductType.unknown => 'Balance \$${product.balance.toStringAsFixed(2)}',
  };

  // Switch 4
  String? get badge => switch (product.type) {
    ProductType.debit => null,
    ProductType.deposit => '${product.interestRate}% a year',
    ProductType.credit => 'Credit',
    ProductType.unknown => null,
  };

  // Switch 5
  void onTap(BuildContext context) => switch (product.type) {
    ProductType.debit => showMessage(context, 'Opening card details'),
    ProductType.deposit => showMessage(context, 'Opening deposit terms'),
    ProductType.credit => showMessage(context, 'Opening credit limit'),
    ProductType.unknown => showMessage(
      context,
      'Update the app to see this product',
    ),
  };

  void showMessage(BuildContext context, String text) =>
      NotificationSnackBar.show(
        context,
        NotificationSnackBar.information(text: text),
      );

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.of(context).theme;

    return ProductTile(
      title: title,
      subtitle: subtitle,
      icon: icon,
      accent: resolveAccent(theme),
      badge: badge,
      onTap: () => onTap(context),
    );
  }
}
