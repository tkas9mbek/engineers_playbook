import 'package:playbook_polymorphism/features/prod_product_actions/domain/product_action_data_source.dart';
import 'package:playbook_toolkit/data/mock/mock_network_behavior.dart';

/// Pretends to be the bank backend. Every call waits like a network call.
class MockProductActionDataSource implements ProductActionDataSource {
  const MockProductActionDataSource(this._network);

  final MockNetworkBehavior _network;

  @override
  Future<void> freezeCard(String productId) => _network.simulate();

  @override
  Future<void> topUpDeposit(String productId, int amountCents) =>
      _network.simulate();

  @override
  Future<void> repayCredit(String productId, int amountCents) =>
      _network.simulate();
}
