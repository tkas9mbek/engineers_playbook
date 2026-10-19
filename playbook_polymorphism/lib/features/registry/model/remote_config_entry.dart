/// Marker for every remote config payload. The type itself is the lookup key:
/// `repository.get<RemoteSupportConfig>()` needs no string key.
abstract class RemoteConfigEntry {
  const RemoteConfigEntry();
}
