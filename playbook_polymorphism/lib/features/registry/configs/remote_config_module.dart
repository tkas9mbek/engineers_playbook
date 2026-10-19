import 'package:playbook_polymorphism/core/di/app_module.dart';
import 'package:playbook_polymorphism/core/global/global_variables.dart';
import 'package:playbook_polymorphism/features/registry/data/mock_remote_config_data_source.dart';
import 'package:playbook_polymorphism/features/registry/domain/remote_config_data_source.dart';
import 'package:playbook_polymorphism/features/registry/domain/remote_config_descriptor.dart';
import 'package:playbook_polymorphism/features/registry/domain/remote_config_registry.dart';
import 'package:playbook_polymorphism/features/registry/domain/remote_config_repository.dart';
import 'package:playbook_polymorphism/features/registry/model/remote_limits_config.dart';
import 'package:playbook_polymorphism/features/registry/model/remote_maintenance_config.dart';
import 'package:playbook_polymorphism/features/registry/model/remote_support_config.dart';
import 'package:playbook_toolkit/data/mock/mock_network_behavior.dart';
import 'package:playbook_toolkit/data/repository_executor/raw_repository_executor.dart';
import 'package:playbook_toolkit/data/repository_executor/repository_executor_extensions.dart';

class RemoteConfigModule extends AppModule {
  @override
  List<Unregister> get unregisterCallbacks => [
    unregisterIfRegistered<RemoteConfigRepository>,
    unregisterIfRegistered<RemoteConfigDataSource>,
    unregisterIfRegistered<RemoteConfigRegistry>,
  ];

  @override
  void register() {
    getIt
      ..registerLazySingleton(
        () => RemoteConfigRegistry([
          const RemoteConfigDescriptor<RemoteMaintenanceConfig>(
            key: 'maintenance',
            fromJson: RemoteMaintenanceConfig.fromJson,
            defaultValue: RemoteMaintenanceConfig(enabled: false, message: ''),
          ),
          const RemoteConfigDescriptor<RemoteSupportConfig>(
            key: 'support',
            fromJson: RemoteSupportConfig.fromJson,
            defaultValue: RemoteSupportConfig(
              phone: '+1 555 010 0111',
              email: 'support@example.com',
            ),
          ),
          const RemoteConfigDescriptor<RemoteLimitsConfig>(
            key: 'limits',
            fromJson: RemoteLimitsConfig.fromJson,
            defaultValue: RemoteLimitsConfig(
              dailyCents: 100000,
              perTransferCents: 30000,
            ),
          ),
        ]),
      )
      ..registerLazySingleton<RemoteConfigDataSource>(
        () => MockRemoteConfigDataSource(
          getIt<RemoteConfigRegistry>(),
          const MockNetworkBehavior(
            wait: Duration(milliseconds: 300),
            failureRate: 0,
          ),
        ),
      )
      ..registerFactory(
        () => RemoteConfigRepository(
          const RawRepositoryExecutor().withErrorHandling(),
          getIt<RemoteConfigDataSource>(),
        ),
      );
  }
}
