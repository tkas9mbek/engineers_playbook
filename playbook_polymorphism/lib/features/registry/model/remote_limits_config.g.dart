// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_limits_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RemoteLimitsConfig _$RemoteLimitsConfigFromJson(Map<String, dynamic> json) =>
    _RemoteLimitsConfig(
      dailyCents: (json['daily_cents'] as num).toInt(),
      perTransferCents: (json['per_transfer_cents'] as num).toInt(),
    );

Map<String, dynamic> _$RemoteLimitsConfigToJson(_RemoteLimitsConfig instance) =>
    <String, dynamic>{
      'daily_cents': instance.dailyCents,
      'per_transfer_cents': instance.perTransferCents,
    };
