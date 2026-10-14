import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:playbook_polymorphism/features/remote_config/model/remote_config_entry.dart';

part 'remote_support_config.freezed.dart';
part 'remote_support_config.g.dart';

@freezed
abstract class RemoteSupportConfig
    with _$RemoteSupportConfig
    implements RemoteConfigEntry {
  const factory RemoteSupportConfig({
    required String phone,
    required String email,
  }) = _RemoteSupportConfig;

  factory RemoteSupportConfig.fromJson(Map<String, dynamic> json) =>
      _$RemoteSupportConfigFromJson(json);
}
