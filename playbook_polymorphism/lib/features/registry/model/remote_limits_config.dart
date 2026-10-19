import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:playbook_polymorphism/features/registry/model/remote_config_entry.dart';

part 'remote_limits_config.freezed.dart';
part 'remote_limits_config.g.dart';

@freezed
abstract class RemoteLimitsConfig
    with _$RemoteLimitsConfig
    implements RemoteConfigEntry {
  const factory RemoteLimitsConfig({
    @JsonKey(name: 'daily_cents') required int dailyCents,
    @JsonKey(name: 'per_transfer_cents') required int perTransferCents,
  }) = _RemoteLimitsConfig;

  factory RemoteLimitsConfig.fromJson(Map<String, dynamic> json) =>
      _$RemoteLimitsConfigFromJson(json);
}
