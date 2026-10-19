import 'package:playbook_polymorphism/features/factory/domain/product_data_source.dart';
import 'package:playbook_polymorphism/features/factory/model/product.dart';
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
    {
      'id': 'p1',
      'name': 'Visa Classic',
      'type': 'debit',
      'balance_cents': 125040,
    },
    {
      'id': 'p2',
      'name': 'Smart Deposit',
      'type': 'deposit',
      'balance_cents': 500000,
      'interest_rate': 8.5,
    },
    {
      'id': 'p3',
      'name': 'Everyday Credit',
      'type': 'credit',
      'balance_cents': 30000,
      'credit_limit_cents': 200000,
    },
    {'id': 'p4', 'name': 'Salary Card', 'type': 'debit', 'balance_cents': 8715},
    // A type this app version doesn't know: it becomes `ProductType.unknown`.
    {
      'id': 'p5',
      'name': 'Crypto Wallet',
      'type': 'crypto',
      'balance_cents': 1250,
    },
  ];
}
