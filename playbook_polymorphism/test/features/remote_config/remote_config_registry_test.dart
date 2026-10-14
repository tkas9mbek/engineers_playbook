import 'package:flutter_test/flutter_test.dart';
import 'package:playbook_polymorphism/core/global/global_variables.dart';
import 'package:playbook_polymorphism/features/remote_config/data/mock_remote_config_data_source.dart';
import 'package:playbook_polymorphism/features/remote_config/domain/remote_config_descriptor.dart';
import 'package:playbook_polymorphism/features/remote_config/domain/remote_config_registry.dart';
import 'package:playbook_polymorphism/features/remote_config/domain/remote_config_repository.dart';
import 'package:playbook_polymorphism/features/remote_config/model/remote_limits_config.dart';
import 'package:playbook_polymorphism/features/remote_config/model/remote_maintenance_config.dart';
import 'package:playbook_polymorphism/features/remote_config/model/remote_support_config.dart';
import 'package:playbook_polymorphism/features/remote_config/ui/bloc/remote_config_entry_bloc.dart';
import 'package:playbook_polymorphism/features/remote_config/ui/screen/remote_config_registry_screen.dart';
import 'package:playbook_toolkit/data/mock/mock_network_behavior.dart';
import 'package:playbook_toolkit/data/repository_executor/raw_repository_executor.dart';
import 'package:playbook_toolkit/data/repository_executor/repository_executor_extensions.dart';

import '../../support/pump_app.dart';

const _limitsDefault = RemoteLimitsConfig(daily: 1000, perTransfer: 300);

RemoteConfigRegistry _registry() => RemoteConfigRegistry([
  const RemoteConfigDescriptor<RemoteMaintenanceConfig>(
    key: 'maintenance',
    fromJson: RemoteMaintenanceConfig.fromJson,
    defaultValue: RemoteMaintenanceConfig(enabled: false, message: ''),
  ),
  const RemoteConfigDescriptor<RemoteSupportConfig>(
    key: 'support',
    fromJson: RemoteSupportConfig.fromJson,
    defaultValue: RemoteSupportConfig(phone: 'default', email: 'default'),
  ),
  const RemoteConfigDescriptor<RemoteLimitsConfig>(
    key: 'limits',
    fromJson: RemoteLimitsConfig.fromJson,
    defaultValue: _limitsDefault,
  ),
]);

RemoteConfigRepository _repository(RemoteConfigRegistry registry) =>
    RemoteConfigRepository(
      const RawRepositoryExecutor().withErrorHandling(),
      MockRemoteConfigDataSource(registry, const MockNetworkBehavior.instant()),
    );

void main() {
  test('the registry finds a descriptor by type', () {
    final descriptor = _registry().descriptorFor<RemoteSupportConfig>();

    expect(descriptor.key, 'support');
  });

  test('an unregistered type is a programmer error', () {
    final registry = RemoteConfigRegistry([]);

    expect(
      registry.descriptorFor<RemoteSupportConfig>,
      throwsA(isA<StateError>()),
    );
  });

  test('a config the backend has is parsed by its descriptor', () async {
    final support = await _repository(_registry()).get<RemoteSupportConfig>();

    expect(support.email, 'help@playbook.bank');
  });

  test('a config the backend lacks falls back to its default', () async {
    final limits = await _repository(_registry()).get<RemoteLimitsConfig>();

    expect(limits, _limitsDefault);
  });

  test('RemoteConfigEntryBloc loads one config by its type', () async {
    final bloc = RemoteConfigEntryBloc<RemoteLimitsConfig>(
      _repository(_registry()),
    )..add(const RemoteConfigEntryEvent.requested());

    await expectLater(
      bloc.stream,
      emitsInOrder([
        const RemoteConfigEntryState<RemoteLimitsConfig>.loading(),
        const RemoteConfigEntryState<RemoteLimitsConfig>.success(
          _limitsDefault,
        ),
      ]),
    );
  });

  group('screen', () {
    setUp(() {
      getIt.registerFactory(() => _repository(_registry()));
    });

    tearDown(getIt.reset);

    testWidgets('shows the three configs', (tester) async {
      await tester.pumpApp(const RemoteConfigRegistryScreen());

      expect(find.text('Registry'), findsOneWidget);
      expect(find.text('Maintenance'), findsOneWidget);
      expect(find.text('Transfers are paused until 18:00.'), findsOneWidget);
      expect(find.text('help@playbook.bank'), findsOneWidget);
      expect(find.text(r'$300 a transfer'), findsOneWidget);
    });
  });
}
