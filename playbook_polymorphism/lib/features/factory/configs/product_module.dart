import 'package:playbook_polymorphism/core/di/app_module.dart';
import 'package:playbook_polymorphism/core/global/global_variables.dart';
import 'package:playbook_polymorphism/features/factory/data/mock_product_data_source.dart';
import 'package:playbook_polymorphism/features/factory/domain/product_data_source.dart';
import 'package:playbook_polymorphism/features/factory/domain/product_repository.dart';
import 'package:playbook_polymorphism/features/factory/ui/common/bloc/product_list_bloc.dart';
import 'package:playbook_toolkit/data/mock/mock_network_behavior.dart';
import 'package:playbook_toolkit/data/repository_executor/raw_repository_executor.dart';
import 'package:playbook_toolkit/data/repository_executor/repository_executor_extensions.dart';

class ProductModule extends AppModule {
  @override
  List<Unregister> get unregisterCallbacks => [
    unregisterIfRegistered<ProductListBloc>,
    unregisterIfRegistered<ProductRepository>,
    unregisterIfRegistered<ProductDataSource>,
  ];

  @override
  void register() {
    getIt
      ..registerLazySingleton<ProductDataSource>(
        () => const MockProductDataSource(
          MockNetworkBehavior(wait: Duration(seconds: 1), failureRate: 0),
        ),
      )
      ..registerFactory(
        () => ProductRepository(
          const RawRepositoryExecutor().withErrorHandling(),
          getIt<ProductDataSource>(),
        ),
      )
      ..registerFactory(() => ProductListBloc(getIt<ProductRepository>()));
  }
}
