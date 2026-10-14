import 'package:flutter/material.dart';
import 'package:playbook_polymorphism/features/remote_config/model/remote_limits_config.dart';
import 'package:playbook_polymorphism/features/remote_config/model/remote_maintenance_config.dart';
import 'package:playbook_polymorphism/features/remote_config/model/remote_support_config.dart';
import 'package:playbook_polymorphism/features/remote_config/ui/widget/remote_config_entry_tile.dart';
import 'package:playbook_uikit/widgets/misc/app_list_tile.dart';
import 'package:playbook_uikit/widgets/misc/grouped_rows_card.dart';

/// The three configs, each loaded on its own by its type.
class RemoteConfigPanel extends StatelessWidget {
  const RemoteConfigPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return GroupedRowsCard(
      children: [
        RemoteConfigEntryTile<RemoteMaintenanceConfig>(
          builder: (maintenance) => AppListTile(
            title: 'Maintenance',
            subtitle: maintenance.message,
            value: maintenance.enabled ? 'On' : 'Off',
            icon: Icons.construction,
          ),
        ),
        RemoteConfigEntryTile<RemoteSupportConfig>(
          builder: (support) => AppListTile(
            title: 'Support',
            subtitle: support.email,
            value: support.phone,
            icon: Icons.support_agent,
          ),
        ),
        RemoteConfigEntryTile<RemoteLimitsConfig>(
          builder: (limits) => AppListTile(
            title: 'Limits',
            subtitle: '\$${limits.daily} a day',
            value: '\$${limits.perTransfer} a transfer',
            icon: Icons.speed,
          ),
        ),
      ],
    );
  }
}
