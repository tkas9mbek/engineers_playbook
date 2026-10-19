import 'package:playbook_polymorphism/core/di/app_module.dart';
import 'package:playbook_polymorphism/core/global/global_variables.dart';
import 'package:playbook_polymorphism/features/prod_product_actions/data/mock_product_action_data_source.dart';
import 'package:playbook_polymorphism/features/prod_product_actions/domain/product_action_data_source.dart';
import 'package:playbook_polymorphism/features/prod_product_actions/domain/product_action_repository.dart';
import 'package:playbook_toolkit/data/mock/mock_network_behavior.dart';
import 'package:playbook_toolkit/data/repository_executor/raw_repository_executor.dart';
import 'package:playbook_toolkit/data/repository_executor/repository_executor_extensions.dart';

class ProductActionModule extends AppModule {
  @override
  List<Unregister> get unregisterCallbacks => [
    unregisterIfRegistered<ProductActionRepository>,
    unregisterIfRegistered<ProductActionDataSource>,
  ];

  @override
  void register() {
    getIt
      ..registerLazySingleton<ProductActionDataSource>(
        () => const MockProductActionDataSource(
          MockNetworkBehavior(
            wait: Duration(milliseconds: 600),
            failureRate: 0,
          ),
        ),
      )
      ..registerFactory(
        () => ProductActionRepository(
          const RawRepositoryExecutor().withErrorHandling(),
          getIt<ProductActionDataSource>(),
        ),
      );
  }
}
