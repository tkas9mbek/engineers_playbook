import 'package:playbook_polymorphism/core/di/app_module.dart';
import 'package:playbook_polymorphism/core/global/global_variables.dart';
import 'package:playbook_polymorphism/features/strategy/data/mock_delivery_data_source.dart';
import 'package:playbook_polymorphism/features/strategy/domain/delivery_data_source.dart';
import 'package:playbook_polymorphism/features/strategy/domain/delivery_repository.dart';
import 'package:playbook_toolkit/data/mock/mock_network_behavior.dart';
import 'package:playbook_toolkit/data/repository_executor/raw_repository_executor.dart';
import 'package:playbook_toolkit/data/repository_executor/repository_executor_extensions.dart';

class DeliveryModule extends AppModule {
  @override
  List<Unregister> get unregisterCallbacks => [
    unregisterIfRegistered<DeliveryRepository>,
    unregisterIfRegistered<DeliveryDataSource>,
  ];

  @override
  void register() {
    getIt
      ..registerLazySingleton<DeliveryDataSource>(
        () => const MockDeliveryDataSource(
          MockNetworkBehavior(
            wait: Duration(milliseconds: 800),
            failureRate: 0,
          ),
        ),
      )
      ..registerFactory(
        () => DeliveryRepository(
          const RawRepositoryExecutor().withErrorHandling(),
          getIt<DeliveryDataSource>(),
        ),
      );
  }
}
