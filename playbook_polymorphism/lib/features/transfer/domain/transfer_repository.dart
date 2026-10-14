import 'package:playbook_polymorphism/features/transfer/domain/transfer_data_source.dart';
import 'package:playbook_toolkit/data/repository_executor/repository_executor.dart';

class TransferRepository {
  const TransferRepository(this._executor, this._dataSource);

  final RepositoryExecutor _executor;
  final TransferDataSource _dataSource;

  Future<int> getBalance() => _executor.execute(_dataSource.getBalance);

  Future<void> sendMoney(int amount) =>
      _executor.execute(() => _dataSource.sendMoney(amount));
}
