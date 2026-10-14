import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playbook_polymorphism/features/remote_config/model/remote_config_entry.dart';
import 'package:playbook_polymorphism/features/remote_config/ui/bloc/remote_config_entry_bloc.dart';
import 'package:playbook_uikit/widgets/status/custom_circular_progress_indicator.dart';

/// Shows one config. It reads the [RemoteConfigEntryBloc] of its own type and
/// knows nothing about the other configs on the screen.
class RemoteConfigEntryTile<T extends RemoteConfigEntry>
    extends StatelessWidget {
  const RemoteConfigEntryTile({required this.builder, super.key});

  final Widget Function(T config) builder;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RemoteConfigEntryBloc<T>, RemoteConfigEntryState<T>>(
      builder: (context, state) => switch (state) {
        SuccessRemoteConfigEntryState<T>(:final config) => builder(config),
        _ => const Padding(
          padding: EdgeInsets.all(16),
          child: Center(child: CustomCircularProgressIndicator()),
        ),
      },
    );
  }
}
