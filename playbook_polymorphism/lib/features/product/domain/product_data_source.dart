import 'package:playbook_polymorphism/features/product/model/product.dart';

abstract class ProductDataSource {
  Future<List<Product>> getProducts();
}
