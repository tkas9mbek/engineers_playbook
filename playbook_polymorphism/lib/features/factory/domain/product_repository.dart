import 'package:playbook_polymorphism/features/factory/domain/product_data_source.dart';
import 'package:playbook_polymorphism/features/factory/model/product.dart';
import 'package:playbook_toolkit/data/repository_executor/repository_executor.dart';

class ProductRepository {
  const ProductRepository(this._executor, this._dataSource);

  final RepositoryExecutor _executor;
  final ProductDataSource _dataSource;

  Future<List<Product>> getProducts() =>
      _executor.execute(_dataSource.getProducts);
}
