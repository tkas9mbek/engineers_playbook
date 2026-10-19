import 'package:flutter/material.dart';
import 'package:playbook_polymorphism/core/utils/cents_format.dart';
import 'package:playbook_polymorphism/features/factory/model/product.dart';
import 'package:playbook_polymorphism/features/factory/model/product_type.dart';
import 'package:playbook_polymorphism/features/factory/ui/common/widget/product_tile.dart';
import 'package:playbook_uikit/theme/app_theme.dart';
import 'package:playbook_uikit/theme/theme_provider.dart';
import 'package:playbook_uikit/widgets/status/notification_snack_bar.dart';

/// One product row, written with a conditional: a single `switch` on
/// `product.type` returns everything the tile needs. A new product type is one
/// new branch. This is the tidy way to write it; compare it with
/// `ProductUiModel`.
class ProductConditionalTile extends StatelessWidget {
  const ProductConditionalTile({required this.product, super.key});

  final Product product;

  _ProductLook _look(AppTheme theme) => switch (product.type) {
    ProductType.debit => _ProductLook(
      icon: Icons.credit_card,
      accent: theme.accent,
      subtitle: 'Balance \$${product.balanceCents.toDollars()}',
      message: 'Opening card details',
    ),
    ProductType.deposit => _ProductLook(
      icon: Icons.savings_outlined,
      accent: theme.success,
      subtitle: 'Saved \$${product.balanceCents.toDollars()}',
      badge: switch (product.interestRate) {
        final rate? => '$rate% a year',
        null => null,
      },
      message: 'Opening deposit terms',
    ),
    ProductType.credit => _ProductLook(
      icon: Icons.account_balance_outlined,
      accent: theme.warning,
      subtitle: switch (product.creditLimitCents) {
        final limit? =>
          'Used \$${product.balanceCents.toWholeDollars()} of '
              '\$${limit.toWholeDollars()}',
        null => 'Used \$${product.balanceCents.toWholeDollars()}',
      },
      badge: 'Credit',
      message: 'Opening credit limit',
    ),
    ProductType.unknown => _ProductLook(
      icon: Icons.help_outline,
      accent: theme.textSecondary,
      subtitle: 'Balance \$${product.balanceCents.toDollars()}',
      message: 'Update the app to see this product',
    ),
  };

  void _onTap(BuildContext context, String message) =>
      NotificationSnackBar.show(
        context,
        NotificationSnackBar.information(text: message),
      );

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.of(context).theme;
    final look = _look(theme);

    return ProductTile(
      title: product.name,
      subtitle: look.subtitle,
      icon: look.icon,
      accent: look.accent,
      badge: look.badge,
      onTap: () => _onTap(context, look.message),
    );
  }
}

/// Everything the tile needs from the product type, answered in one place.
class _ProductLook {
  const _ProductLook({
    required this.icon,
    required this.accent,
    required this.subtitle,
    required this.message,
    this.badge,
  });

  final IconData icon;
  final Color accent;
  final String subtitle;
  final String? badge;

  /// What tapping the tile says.
  final String message;
}
