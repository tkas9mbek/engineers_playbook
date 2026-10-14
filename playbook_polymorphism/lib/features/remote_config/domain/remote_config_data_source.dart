import 'package:playbook_polymorphism/features/remote_config/model/remote_config_entry.dart';

abstract class RemoteConfigDataSource {
  /// Resolves a config by its type: `get<RemoteSupportConfig>()`.
  Future<T> get<T extends RemoteConfigEntry>();
}
