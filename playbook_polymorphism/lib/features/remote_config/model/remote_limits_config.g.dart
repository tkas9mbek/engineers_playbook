// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_limits_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RemoteLimitsConfig _$RemoteLimitsConfigFromJson(Map<String, dynamic> json) =>
    _RemoteLimitsConfig(
      daily: (json['daily'] as num).toInt(),
      perTransfer: (json['per_transfer'] as num).toInt(),
    );

Map<String, dynamic> _$RemoteLimitsConfigToJson(_RemoteLimitsConfig instance) =>
    <String, dynamic>{
      'daily': instance.daily,
      'per_transfer': instance.perTransfer,
    };
