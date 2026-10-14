import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playbook_polymorphism/features/remote_config/ui/bloc/remote_config_details_bloc.dart';
import 'package:playbook_uikit/widgets/misc/app_list_tile.dart';
import 'package:playbook_uikit/widgets/misc/grouped_rows_card.dart';
import 'package:playbook_uikit/widgets/status/custom_circular_progress_indicator.dart';

/// The three configs, each read through the same registry-backed call.
class RemoteConfigPanel extends StatelessWidget {
  const RemoteConfigPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RemoteConfigDetailsBloc, RemoteConfigDetailsState>(
      builder: (context, state) => switch (state) {
        SuccessRemoteConfigDetailsState(
          :final maintenance,
          :final support,
          :final limits,
        ) =>
          GroupedRowsCard(
            children: [
              AppListTile(
                title: 'Maintenance',
                subtitle: maintenance.message,
                value: maintenance.enabled ? 'On' : 'Off',
                icon: Icons.construction,
              ),
              AppListTile(
                title: 'Support',
                subtitle: support.email,
                value: support.phone,
                icon: Icons.support_agent,
              ),
              AppListTile(
                title: 'Limits',
                subtitle: '\$${limits.daily} a day',
                value: '\$${limits.perTransfer} a transfer',
                icon: Icons.speed,
              ),
            ],
          ),
        _ => const Center(child: CustomCircularProgressIndicator()),
      },
    );
  }
}
