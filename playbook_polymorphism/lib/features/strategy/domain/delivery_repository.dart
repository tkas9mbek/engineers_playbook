import 'package:playbook_polymorphism/features/strategy/domain/delivery_data_source.dart';
import 'package:playbook_toolkit/data/repository_executor/repository_executor.dart';

class DeliveryRepository {
  const DeliveryRepository(this._executor, this._dataSource);

  final RepositoryExecutor _executor;
  final DeliveryDataSource _dataSource;

  Future<void> placeStandardOrder(int subtotalCents) =>
      _executor.execute(() => _dataSource.placeStandardOrder(subtotalCents));

  Future<void> placeExpressOrder(int subtotalCents) =>
      _executor.execute(() => _dataSource.placeExpressOrder(subtotalCents));

  Future<void> placePickupOrder(int subtotalCents) =>
      _executor.execute(() => _dataSource.placePickupOrder(subtotalCents));
}
