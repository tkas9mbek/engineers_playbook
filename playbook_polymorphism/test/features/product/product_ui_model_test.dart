import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:playbook_polymorphism/features/product/model/product.dart';
import 'package:playbook_polymorphism/features/product/model/product_type.dart';
import 'package:playbook_polymorphism/features/product/ui/factory/model/product_ui_model.dart';
import 'package:playbook_uikit/theme/app_theme.dart';

typedef _Case = ({
  Product product,
  String title,
  String subtitle,
  String? badge,
  Color color,
});

void main() {
  test('Product reads the type and snake_case fields from JSON', () {
    final product = Product.fromJson(const {
      'id': 'p2',
      'name': 'Smart Deposit',
      'type': 'deposit',
      'balance': 5000,
      'interest_rate': 8.5,
    });

    expect(product.name, 'Smart Deposit');
    expect(product.type, ProductType.deposit);
    expect(product.balance, 5000);
    expect(product.interestRate, 8.5);
  });

  test('Product turns a type it does not know into unknown', () {
    final product = Product.fromJson(const {
      'id': 'p9',
      'name': 'Future Product',
      'type': 'savings_plan',
      'balance': 1,
    });

    expect(product.type, ProductType.unknown);
  });

  group('ProductUiModel.from', () {
    final theme = AppTheme.light();

    final cases = <_Case>[
      (
        product: const Product(
          id: '1',
          name: 'Visa Classic',
          type: ProductType.debit,
          balance: 10.5,
        ),
        title: 'Visa Classic',
        subtitle: r'Balance $10.50',
        badge: null,
        color: theme.accent,
      ),
      (
        product: const Product(
          id: '2',
          name: 'Smart Deposit',
          type: ProductType.deposit,
          balance: 100,
          interestRate: 8.5,
        ),
        title: 'Smart Deposit',
        subtitle: r'Saved $100.00',
        badge: '8.5% a year',
        color: theme.success,
      ),
      (
        product: const Product(
          id: '3',
          name: 'Everyday Credit',
          type: ProductType.credit,
          balance: 300,
          creditLimit: 2000,
        ),
        title: 'Everyday Credit',
        subtitle: r'Used $300 of $2000',
        badge: 'Credit',
        color: theme.warning,
      ),
      (
        product: const Product(
          id: '4',
          name: 'Future Product',
          type: ProductType.unknown,
          balance: 5,
        ),
        title: 'Future Product',
        subtitle: r'Balance $5.00',
        badge: null,
        color: theme.textSecondary,
      ),
    ];

    for (final testCase in cases) {
      test('${testCase.product.type.name} maps to its UI model', () {
        final model = ProductUiModel.from(testCase.product);

        expect(model.title, testCase.title);
        expect(model.subtitle, testCase.subtitle);
        expect(model.badge, testCase.badge);
        expect(model.accent(theme), testCase.color);
      });
    }
  });
}
