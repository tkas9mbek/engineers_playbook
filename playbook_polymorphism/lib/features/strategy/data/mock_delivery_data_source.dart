import 'package:playbook_polymorphism/features/strategy/domain/delivery_data_source.dart';
import 'package:playbook_toolkit/data/mock/mock_network_behavior.dart';

/// Pretends to be the backend: every call waits like a network call. A real
/// data source would call `/api/orders/standard`, `/express` and `/pickup`.
class MockDeliveryDataSource implements DeliveryDataSource {
  const MockDeliveryDataSource(this._network);

  final MockNetworkBehavior _network;

  @override
  Future<void> placeStandardOrder(int subtotalCents) => _network.simulate();

  @override
  Future<void> placeExpressOrder(int subtotalCents) => _network.simulate();

  @override
  Future<void> placePickupOrder(int subtotalCents) => _network.simulate();
}
