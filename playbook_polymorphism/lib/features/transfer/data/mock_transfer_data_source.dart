import 'package:playbook_polymorphism/features/transfer/domain/transfer_data_source.dart';
import 'package:playbook_toolkit/data/mock/mock_network_behavior.dart';

/// Pretends to be the backend: every call waits like a network call.
class MockTransferDataSource implements TransferDataSource {
  const MockTransferDataSource(this._network);

  final MockNetworkBehavior _network;

  @override
  Future<int> getBalance() async {
    await _network.simulate();

    return 2500;
  }

  @override
  Future<void> sendMoney(int amount) => _network.simulate();
}
