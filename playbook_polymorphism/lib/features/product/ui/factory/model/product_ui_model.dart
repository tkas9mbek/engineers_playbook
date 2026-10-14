import 'package:flutter/material.dart';
import 'package:playbook_polymorphism/features/product/model/product.dart';
import 'package:playbook_polymorphism/features/product/model/product_type.dart';
import 'package:playbook_uikit/theme/app_theme.dart';
import 'package:playbook_uikit/widgets/status/notification_snack_bar.dart';

/// How a [Product] looks and behaves in the UI.
///
/// Each product type is its own small class that answers every question
/// about itself. Widgets ask the questions and never check the type.
sealed class ProductUiModel {
  const ProductUiModel(this.product);

  /// The factory method: the ONLY `switch` on [ProductType] in the UI layer.
  /// A new type is one new subclass and one new line here. Forget the line
  /// and the compiler flags this switch.
  factory ProductUiModel.from(Product product) => switch (product.type) {
    ProductType.debit => _DebitProductUiModel(product),
    ProductType.deposit => _DepositProductUiModel(product),
    ProductType.credit => _CreditProductUiModel(product),
    ProductType.unknown => _UnknownProductUiModel(product),
  };

  final Product product;

  /// The name the backend sent, e.g. "Visa Classic".
  String get title => product.name;

  IconData get icon;

  Color accent(AppTheme theme);

  /// The line under the title: the number that matters for this product.
  String get subtitle;

  /// What tapping the product does.
  void onTap(BuildContext context);

  /// A small badge next to the title, if the product has one.
  String? get badge => null;

  /// A stand-in for opening the product's screen.
  void showMessage(BuildContext context, String text) =>
      NotificationSnackBar.show(
        context,
        NotificationSnackBar.information(text: text),
      );
}

final class _DebitProductUiModel extends ProductUiModel {
  const _DebitProductUiModel(super.product);

  @override
  IconData get icon => Icons.credit_card;

  @override
  Color accent(AppTheme theme) => theme.accent;

  @override
  String get subtitle => 'Balance \$${product.balance.toStringAsFixed(2)}';

  @override
  void onTap(BuildContext context) =>
      showMessage(context, 'Opening card details');
}

final class _DepositProductUiModel extends ProductUiModel {
  const _DepositProductUiModel(super.product);

  @override
  IconData get icon => Icons.savings_outlined;

  @override
  Color accent(AppTheme theme) => theme.success;

  @override
  String get subtitle => 'Saved \$${product.balance.toStringAsFixed(2)}';

  @override
  void onTap(BuildContext context) =>
      showMessage(context, 'Opening deposit terms');

  @override
  String? get badge => '${product.interestRate}% a year';
}

final class _CreditProductUiModel extends ProductUiModel {
  const _CreditProductUiModel(super.product);

  @override
  IconData get icon => Icons.account_balance_outlined;

  @override
  Color accent(AppTheme theme) => theme.warning;

  @override
  String get subtitle =>
      'Used \$${product.balance.toStringAsFixed(0)} of '
      '\$${product.creditLimit!.toStringAsFixed(0)}';

  @override
  void onTap(BuildContext context) =>
      showMessage(context, 'Opening credit limit');

  @override
  String? get badge => 'Credit';
}

/// A type the backend added after this app shipped: neutral, no special rules.
final class _UnknownProductUiModel extends ProductUiModel {
  const _UnknownProductUiModel(super.product);

  @override
  IconData get icon => Icons.help_outline;

  @override
  Color accent(AppTheme theme) => theme.textSecondary;

  @override
  String get subtitle => 'Balance \$${product.balance.toStringAsFixed(2)}';

  @override
  void onTap(BuildContext context) =>
      showMessage(context, 'Update the app to see this product');
}
