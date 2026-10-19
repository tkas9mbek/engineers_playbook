import 'package:playbook_polymorphism/features/prod_product_actions/domain/product_action_strategy.dart';

/// A kind the backend added after this app shipped. It has no action, so an
/// old app does not crash on a new product.
class UnknownProductActionStrategy extends ProductActionStrategy {
  const UnknownProductActionStrategy(super.product, super.repository);

  @override
  String? get label => null;

  @override
  Future<String> perform() async => 'Update the app to use this product';
}
