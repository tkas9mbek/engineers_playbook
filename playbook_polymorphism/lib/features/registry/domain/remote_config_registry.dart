import 'package:playbook_polymorphism/features/registry/domain/remote_config_descriptor.dart';
import 'package:playbook_polymorphism/features/registry/model/remote_config_entry.dart';

/// The one place that maps a config type to its descriptor. Adding a config
/// is one new descriptor in the list. The repository, the data source and the
/// bloc do not change. The screen that shows it adds a tile and a bloc
/// provider in `RemoteConfigScope`.
class RemoteConfigRegistry {
  RemoteConfigRegistry(List<RemoteConfigDescriptor> descriptors)
    : _descriptors = {
        for (final descriptor in descriptors) descriptor.type: descriptor,
      };

  final Map<Type, RemoteConfigDescriptor> _descriptors;

  RemoteConfigDescriptor<T> descriptorFor<T extends RemoteConfigEntry>() {
    final descriptor = _descriptors[T];

    if (descriptor is! RemoteConfigDescriptor<T>) {
      throw StateError('No RemoteConfigDescriptor registered for type $T');
    }

    return descriptor;
  }
}
