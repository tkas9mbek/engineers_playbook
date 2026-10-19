import 'package:playbook_polymorphism/features/registry/model/remote_config_entry.dart';

abstract class RemoteConfigDataSource {
  /// Resolves a config by its type: `get<RemoteSupportConfig>()`.
  Future<T> get<T extends RemoteConfigEntry>();
}
