import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:playbook_polymorphism/features/remote_config/model/remote_config_entry.dart';

part 'remote_limits_config.freezed.dart';
part 'remote_limits_config.g.dart';

@freezed
abstract class RemoteLimitsConfig
    with _$RemoteLimitsConfig
    implements RemoteConfigEntry {
  const factory RemoteLimitsConfig({
    required int daily,
    @JsonKey(name: 'per_transfer') required int perTransfer,
  }) = _RemoteLimitsConfig;

  factory RemoteLimitsConfig.fromJson(Map<String, dynamic> json) =>
      _$RemoteLimitsConfigFromJson(json);
}
