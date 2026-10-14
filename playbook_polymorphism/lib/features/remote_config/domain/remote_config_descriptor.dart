import 'package:playbook_polymorphism/features/remote_config/model/remote_config_entry.dart';

/// Everything the app must know about one config: the backend [key], how to
/// parse it, and the [defaultValue] to use when the backend has nothing.
class RemoteConfigDescriptor<T extends RemoteConfigEntry> {
  const RemoteConfigDescriptor({
    required this.key,
    required this.fromJson,
    required this.defaultValue,
  });

  final String key;
  final T Function(Map<String, dynamic> json) fromJson;
  final T defaultValue;

  Type get type => T;
}
