import 'package:playbook_polymorphism/core/di/app_module.dart';
import 'package:playbook_polymorphism/core/global/global_variables.dart';
import 'package:playbook_polymorphism/features/rate/data/mock_rate_data_source.dart';
import 'package:playbook_polymorphism/features/rate/data/rate_logging_executor.dart';
import 'package:playbook_polymorphism/features/rate/domain/rate_call_log.dart';
import 'package:playbook_polymorphism/features/rate/domain/rate_data_source.dart';
import 'package:playbook_polymorphism/features/rate/domain/rate_repository.dart';
import 'package:playbook_polymorphism/features/rate/ui/bloc/rate_details_bloc.dart';
import 'package:playbook_toolkit/data/mock/mock_network_behavior.dart';
import 'package:playbook_toolkit/data/repository_executor/error_handling_executor.dart';
import 'package:playbook_toolkit/data/repository_executor/raw_repository_executor.dart';
import 'package:playbook_toolkit/data/repository_executor/retry_executor.dart';

class RateModule extends AppModule {
  @override
  List<Unregister> get unregisterCallbacks => [
    unregisterIfRegistered<RateDetailsBloc>,
    unregisterIfRegistered<RateRepository>,
    unregisterIfRegistered<RateDataSource>,
    unregisterIfRegistered<RateCallLog>,
  ];

  @override
  void register() {
    getIt
      ..registerLazySingleton(RateCallLog.new)
      ..registerLazySingleton<RateDataSource>(
        () => MockRateDataSource(
          const MockNetworkBehavior(
            wait: Duration(milliseconds: 300),
            failureRate: 0,
          ),
        ),
      )
      ..registerFactory(
        () => RateRepository(
          // Read it inside out: the raw call is logged, its errors are
          // normalized, and a retryable error is tried again.
          RetryExecutor(
            ErrorHandlingExecutor(
              RateLoggingExecutor(
                const RawRepositoryExecutor(),
                getIt<RateCallLog>(),
              ),
            ),
            retryDelay: const Duration(milliseconds: 400),
          ),
          getIt<RateDataSource>(),
        ),
      )
      ..registerFactory(
        () => RateDetailsBloc(getIt<RateRepository>(), getIt<RateCallLog>()),
      );
  }
}
