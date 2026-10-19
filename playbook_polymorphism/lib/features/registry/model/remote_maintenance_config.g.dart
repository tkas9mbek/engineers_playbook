// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_maintenance_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RemoteMaintenanceConfig _$RemoteMaintenanceConfigFromJson(
  Map<String, dynamic> json,
) => _RemoteMaintenanceConfig(
  enabled: json['enabled'] as bool,
  message: json['message'] as String,
);

Map<String, dynamic> _$RemoteMaintenanceConfigToJson(
  _RemoteMaintenanceConfig instance,
) => <String, dynamic>{
  'enabled': instance.enabled,
  'message': instance.message,
};
