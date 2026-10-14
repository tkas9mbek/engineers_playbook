import 'package:playbook_polymorphism/core/di/app_module.dart';
import 'package:playbook_polymorphism/core/global/global_variables.dart';
import 'package:playbook_polymorphism/features/transfer/data/mock_transfer_data_source.dart';
import 'package:playbook_polymorphism/features/transfer/domain/transfer_data_source.dart';
import 'package:playbook_polymorphism/features/transfer/domain/transfer_repository.dart';
import 'package:playbook_polymorphism/features/transfer/ui/common/bloc/transfer_balance_bloc.dart';
import 'package:playbook_polymorphism/features/transfer/ui/common/bloc/transfer_operation_bloc.dart';
import 'package:playbook_toolkit/data/mock/mock_network_behavior.dart';
import 'package:playbook_toolkit/data/repository_executor/raw_repository_executor.dart';
import 'package:playbook_toolkit/data/repository_executor/repository_executor_extensions.dart';

class TransferModule extends AppModule {
  @override
  List<Unregister> get unregisterCallbacks => [
    unregisterIfRegistered<TransferOperationBloc>,
    unregisterIfRegistered<TransferBalanceBloc>,
    unregisterIfRegistered<TransferRepository>,
    unregisterIfRegistered<TransferDataSource>,
  ];

  @override
  void register() {
    getIt
      ..registerLazySingleton<TransferDataSource>(
        () => const MockTransferDataSource(
          MockNetworkBehavior(
            wait: Duration(milliseconds: 800),
            failureRate: 0,
          ),
        ),
      )
      ..registerFactory(
        () => TransferRepository(
          const RawRepositoryExecutor().withErrorHandling(),
          getIt<TransferDataSource>(),
        ),
      )
      ..registerFactory(() => TransferBalanceBloc(getIt<TransferRepository>()))
      ..registerFactory(
        () => TransferOperationBloc(getIt<TransferRepository>()),
      );
  }
}
