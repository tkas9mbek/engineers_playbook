import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playbook_polymorphism/features/registry/model/remote_config_entry.dart';
import 'package:playbook_polymorphism/features/registry/ui/bloc/remote_config_entry_bloc.dart';
import 'package:playbook_uikit/widgets/misc/app_list_tile.dart';
import 'package:playbook_uikit/widgets/status/failure_widget.dart';

/// Shows one config. While it loads, and when it fails, the row keeps its own
/// [title] and [icon], so you can tell which config is which. A failure adds
/// the error and a retry button. It reads the [RemoteConfigEntryBloc] of its
/// own type and knows nothing about the other configs on the screen.
class RemoteConfigEntryTile<T extends RemoteConfigEntry>
    extends StatelessWidget {
  const RemoteConfigEntryTile({
    required this.title,
    required this.icon,
    required this.builder,
    super.key,
  });

  final String title;
  final IconData icon;
  final Widget Function(T config) builder;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RemoteConfigEntryBloc<T>, RemoteConfigEntryState<T>>(
      builder: (context, state) => switch (state) {
        SuccessRemoteConfigEntryState<T>(:final config) => builder(config),
        FailureRemoteConfigEntryState<T>(:final exception) => Column(
          children: [
            AppListTile(title: title, icon: icon, danger: true),
            FailureWidget(
              exception: exception,
              onRetry: () => context.read<RemoteConfigEntryBloc<T>>().add(
                const RemoteConfigEntryEvent.requested(),
              ),
            ),
          ],
        ),
        _ => AppListTile(title: title, icon: icon, loading: true),
      },
    );
  }
}
