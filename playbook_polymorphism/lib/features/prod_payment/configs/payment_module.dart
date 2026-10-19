import 'package:playbook_polymorphism/core/di/app_module.dart';
import 'package:playbook_polymorphism/core/global/global_variables.dart';
import 'package:playbook_polymorphism/features/prod_payment/data/mock_payment_data_source.dart';
import 'package:playbook_polymorphism/features/prod_payment/domain/payment_data_source.dart';
import 'package:playbook_polymorphism/features/prod_payment/domain/payment_repository.dart';
import 'package:playbook_toolkit/data/mock/mock_network_behavior.dart';
import 'package:playbook_toolkit/data/repository_executor/raw_repository_executor.dart';
import 'package:playbook_toolkit/data/repository_executor/repository_executor_extensions.dart';

class PaymentModule extends AppModule {
  @override
  List<Unregister> get unregisterCallbacks => [
    unregisterIfRegistered<PaymentRepository>,
    unregisterIfRegistered<PaymentDataSource>,
  ];

  @override
  void register() {
    getIt
      ..registerLazySingleton<PaymentDataSource>(
        () => const MockPaymentDataSource(
          MockNetworkBehavior(
            wait: Duration(milliseconds: 400),
            failureRate: 0,
          ),
        ),
      )
      ..registerFactory(
        () => PaymentRepository(
          const RawRepositoryExecutor().withErrorHandling(),
          getIt<PaymentDataSource>(),
        ),
      );
  }
}
