import 'package:playbook_polymorphism/features/remote_config/domain/remote_config_data_source.dart';
import 'package:playbook_polymorphism/features/remote_config/model/remote_config_entry.dart';
import 'package:playbook_toolkit/data/repository_executor/repository_executor.dart';

class RemoteConfigRepository {
  const RemoteConfigRepository(this._executor, this._dataSource);

  final RepositoryExecutor _executor;
  final RemoteConfigDataSource _dataSource;

  Future<T> get<T extends RemoteConfigEntry>() =>
      _executor.execute(_dataSource.get<T>);
}
