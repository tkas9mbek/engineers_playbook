import 'package:playbook_polymorphism/features/factory/model/product.dart';

abstract class ProductDataSource {
  Future<List<Product>> getProducts();
}
