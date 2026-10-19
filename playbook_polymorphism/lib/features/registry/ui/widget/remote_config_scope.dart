import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playbook_polymorphism/core/global/global_variables.dart';
import 'package:playbook_polymorphism/features/registry/domain/remote_config_repository.dart';
import 'package:playbook_polymorphism/features/registry/model/remote_config_entry.dart';
import 'package:playbook_polymorphism/features/registry/model/remote_limits_config.dart';
import 'package:playbook_polymorphism/features/registry/model/remote_maintenance_config.dart';
import 'package:playbook_polymorphism/features/registry/model/remote_support_config.dart';
import 'package:playbook_polymorphism/features/registry/ui/bloc/remote_config_entry_bloc.dart';

/// Loads the three configs, one bloc each, for the [child] below.
class RemoteConfigScope extends StatelessWidget {
  const RemoteConfigScope({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => _createEntryBloc<RemoteMaintenanceConfig>(),
        ),
        BlocProvider(
          create: (context) => _createEntryBloc<RemoteSupportConfig>(),
        ),
        BlocProvider(
          create: (context) => _createEntryBloc<RemoteLimitsConfig>(),
        ),
      ],
      child: child,
    );
  }
}

RemoteConfigEntryBloc<T> _createEntryBloc<T extends RemoteConfigEntry>() =>
    RemoteConfigEntryBloc<T>(getIt<RemoteConfigRepository>())
      ..add(const RemoteConfigEntryEvent.requested());
