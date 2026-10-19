import 'package:playbook_polymorphism/features/decorator/domain/rate_data_source.dart';
import 'package:playbook_toolkit/data/repository_executor/repository_executor.dart';

class RateRepository {
  const RateRepository(this._executor, this._dataSource);

  final RepositoryExecutor _executor;
  final RateDataSource _dataSource;

  Future<double> getRate() => _executor.execute(_dataSource.getRate);
}
