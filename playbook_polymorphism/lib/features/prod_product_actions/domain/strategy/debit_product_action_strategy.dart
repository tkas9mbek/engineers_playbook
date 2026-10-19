import 'package:playbook_polymorphism/features/prod_product_actions/domain/product_action_strategy.dart';

/// A card can be frozen.
class DebitProductActionStrategy extends ProductActionStrategy {
  const DebitProductActionStrategy(super.product, super.repository);

  @override
  String get label => 'Freeze card';

  @override
  Future<String> perform() async {
    await repository.freezeCard(product.id);

    return '${product.name} is frozen';
  }
}
