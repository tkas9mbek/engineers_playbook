import 'package:playbook_polymorphism/features/registry/domain/remote_config_data_source.dart';
import 'package:playbook_polymorphism/features/registry/domain/remote_config_registry.dart';
import 'package:playbook_polymorphism/features/registry/model/remote_config_entry.dart';
import 'package:playbook_toolkit/data/mock/mock_network_behavior.dart';

/// Pretends to be the config backend. It finds the key through the registry,
/// so it never names a config type itself.
class MockRemoteConfigDataSource implements RemoteConfigDataSource {
  const MockRemoteConfigDataSource(this._registry, this._network);

  final RemoteConfigRegistry _registry;
  final MockNetworkBehavior _network;

  @override
  Future<T> get<T extends RemoteConfigEntry>() async {
    await _network.simulate();

    final descriptor = _registry.descriptorFor<T>();
    final json = _response[descriptor.key];

    return json == null ? descriptor.defaultValue : descriptor.fromJson(json);
  }

  /// There is no `limits` key on purpose: the descriptor's default is used.
  static const Map<String, Map<String, dynamic>> _response = {
    'maintenance': {
      'enabled': true,
      'message': 'Transfers are paused until 18:00.',
    },
    'support': {'phone': '+1 555 010 0000', 'email': 'help@example.com'},
  };
}
