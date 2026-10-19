import 'package:playbook_polymorphism/features/prod_product_actions/domain/product_action_data_source.dart';
import 'package:playbook_toolkit/data/repository_executor/repository_executor.dart';

class ProductActionRepository {
  const ProductActionRepository(this._executor, this._dataSource);

  final RepositoryExecutor _executor;
  final ProductActionDataSource _dataSource;

  Future<void> freezeCard(String productId) =>
      _executor.execute(() => _dataSource.freezeCard(productId));

  Future<void> topUpDeposit(String productId, int amountCents) =>
      _executor.execute(() => _dataSource.topUpDeposit(productId, amountCents));

  Future<void> repayCredit(String productId, int amountCents) =>
      _executor.execute(() => _dataSource.repayCredit(productId, amountCents));
}
