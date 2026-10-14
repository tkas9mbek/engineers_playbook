import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playbook_polymorphism/core/global/global_variables.dart';
import 'package:playbook_polymorphism/features/remote_config/domain/remote_config_repository.dart';
import 'package:playbook_polymorphism/features/remote_config/model/remote_config_entry.dart';
import 'package:playbook_polymorphism/features/remote_config/model/remote_limits_config.dart';
import 'package:playbook_polymorphism/features/remote_config/model/remote_maintenance_config.dart';
import 'package:playbook_polymorphism/features/remote_config/model/remote_support_config.dart';
import 'package:playbook_polymorphism/features/remote_config/ui/bloc/remote_config_entry_bloc.dart';
import 'package:playbook_polymorphism/features/remote_config/ui/widget/remote_config_panel.dart';
import 'package:playbook_uikit/widgets/article/pattern_layout.dart';

@RoutePage()
class RemoteConfigRegistryScreen extends StatelessWidget {
  const RemoteConfigRegistryScreen({super.key});

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
      child: const PatternLayout(
        title: 'Registry',
        intro:
            'A registry is a lookup table. You ask it for something, and it '
            'knows where to find it. The server stores configs under text '
            'keys like "support". The registry knows those keys, so your '
            'code just asks for the type it wants: '
            'get<RemoteSupportConfig>().\n\n'
            'The server has no "limits" entry, so you get the default value '
            'instead.',
        demo: RemoteConfigPanel(),
        whenToUse:
            'You have many things of one kind (configs, screens, plugins) and '
            'you do not want every caller to know how to find each one. Adding '
            'one more is a new class and one line in the registry.',
      ),
    );
  }
}

RemoteConfigEntryBloc<T> _createEntryBloc<T extends RemoteConfigEntry>() =>
    RemoteConfigEntryBloc<T>(getIt<RemoteConfigRepository>())
      ..add(const RemoteConfigEntryEvent.requested());
