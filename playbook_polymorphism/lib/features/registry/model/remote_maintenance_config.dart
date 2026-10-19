import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:playbook_polymorphism/features/registry/model/remote_config_entry.dart';

part 'remote_maintenance_config.freezed.dart';
part 'remote_maintenance_config.g.dart';

@freezed
abstract class RemoteMaintenanceConfig
    with _$RemoteMaintenanceConfig
    implements RemoteConfigEntry {
  const factory RemoteMaintenanceConfig({
    required bool enabled,
    required String message,
  }) = _RemoteMaintenanceConfig;

  factory RemoteMaintenanceConfig.fromJson(Map<String, dynamic> json) =>
      _$RemoteMaintenanceConfigFromJson(json);
}
