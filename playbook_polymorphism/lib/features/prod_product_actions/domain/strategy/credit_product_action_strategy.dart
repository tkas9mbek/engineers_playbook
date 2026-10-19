import 'package:playbook_polymorphism/core/utils/cents_format.dart';
import 'package:playbook_polymorphism/features/prod_product_actions/domain/product_action_strategy.dart';

/// A credit line can be repaid in full.
class CreditProductActionStrategy extends ProductActionStrategy {
  const CreditProductActionStrategy(super.product, super.repository);

  @override
  String get label => 'Repay \$${product.balanceCents.toDollars()}';

  @override
  Future<String> perform() async {
    await repository.repayCredit(product.id, product.balanceCents);

    return 'Repaid \$${product.balanceCents.toDollars()} on ${product.name}';
  }
}
