import 'package:playbook_polymorphism/features/product/domain/product_data_source.dart';
import 'package:playbook_polymorphism/features/product/model/product.dart';
import 'package:playbook_toolkit/data/mock/mock_network_behavior.dart';

/// Pretends to be the backend: waits like a network call, then returns JSON
/// that is parsed exactly as a real response would be.
class MockProductDataSource implements ProductDataSource {
  const MockProductDataSource(this._network);

  final MockNetworkBehavior _network;

  @override
  Future<List<Product>> getProducts() async {
    await _network.simulate();

    return _response.map(Product.fromJson).toList();
  }

  static const List<Map<String, dynamic>> _response = [
    {'id': 'p1', 'name': 'Visa Classic', 'type': 'debit', 'balance': 1250.40},
    {
      'id': 'p2',
      'name': 'Smart Deposit',
      'type': 'deposit',
      'balance': 5000,
      'interest_rate': 8.5,
    },
    {
      'id': 'p3',
      'name': 'Everyday Credit',
      'type': 'credit',
      'balance': 300,
      'credit_limit': 2000,
    },
    {'id': 'p4', 'name': 'Salary Card', 'type': 'debit', 'balance': 87.15},
  ];
}
