import 'package:playbook_polymorphism/core/utils/cents_format.dart';
import 'package:playbook_polymorphism/features/prod_product_actions/domain/product_action_strategy.dart';

/// A deposit can be topped up by $100.
class DepositProductActionStrategy extends ProductActionStrategy {
  const DepositProductActionStrategy(super.product, super.repository);

  static const int _topUpCents = 10000;

  @override
  String get label => 'Top up \$${_topUpCents.toDollars()}';

  @override
  Future<String> perform() async {
    await repository.topUpDeposit(product.id, _topUpCents);

    return 'Added \$${_topUpCents.toDollars()} to ${product.name}';
  }
}
