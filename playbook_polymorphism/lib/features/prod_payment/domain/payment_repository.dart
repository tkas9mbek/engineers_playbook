import 'package:playbook_polymorphism/features/prod_payment/domain/payment_data_source.dart';
import 'package:playbook_polymorphism/features/prod_payment/model/payment_service.dart';
import 'package:playbook_toolkit/data/repository_executor/repository_executor.dart';

class PaymentRepository {
  const PaymentRepository(this._executor, this._dataSource);

  final RepositoryExecutor _executor;
  final PaymentDataSource _dataSource;

  Future<PaymentService> getService(String serviceId) =>
      _executor.execute(() => _dataSource.getService(serviceId));

  Future<String> resolveQrService(String qrCode) =>
      _executor.execute(() => _dataSource.resolveQrService(qrCode));

  Future<void> validate(String serviceId, int amountCents) =>
      _executor.execute(() => _dataSource.validate(serviceId, amountCents));

  Future<String> createPayment(String serviceId, int amountCents) => _executor
      .execute(() => _dataSource.createPayment(serviceId, amountCents));
}
