import 'package:meta/meta.dart';
import 'package:playbook_polymorphism/features/factory/model/product.dart';
import 'package:playbook_polymorphism/features/factory/model/product_type.dart';
import 'package:playbook_polymorphism/features/prod_product_actions/domain/product_action_repository.dart';
import 'package:playbook_polymorphism/features/prod_product_actions/domain/strategy/credit_product_action_strategy.dart';
import 'package:playbook_polymorphism/features/prod_product_actions/domain/strategy/debit_product_action_strategy.dart';
import 'package:playbook_polymorphism/features/prod_product_actions/domain/strategy/deposit_product_action_strategy.dart';
import 'package:playbook_polymorphism/features/prod_product_actions/domain/strategy/unknown_product_action_strategy.dart';

/// What one kind of product can do: its action and the call behind it. Pure
/// Dart, so it has no icons or colors. How a product looks is the job of
/// `ProductUiModel`, in `ui/`.
///
/// Two patterns work together: [ProductActionStrategy.from] is the factory
/// that picks the strategy for a product, and each subclass is a strategy that
/// owns its own action. The tile and the bloc never ask which kind it is.
///
/// [label] and the message from [perform] are plain English in `domain/`, a
/// known shortcut of this demo. A real app would return codes and word them in
/// `ui/`.
abstract class ProductActionStrategy {
  const ProductActionStrategy(this.product, this.repository);

  factory ProductActionStrategy.from(
    Product product,
    ProductActionRepository repository,
  ) => switch (product.type) {
    ProductType.debit => DebitProductActionStrategy(product, repository),
    ProductType.deposit => DepositProductActionStrategy(product, repository),
    ProductType.credit => CreditProductActionStrategy(product, repository),
    ProductType.unknown => UnknownProductActionStrategy(product, repository),
  };

  final Product product;

  /// Subclasses use it in their own action.
  @protected
  final ProductActionRepository repository;

  /// The text of the action button, or null if this kind has no action.
  String? get label;

  /// Runs the action and returns the message to show when it worked. If the
  /// backend fails, it throws an `AppException`.
  Future<String> perform();
}
