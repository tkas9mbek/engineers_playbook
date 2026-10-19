import 'package:flutter/material.dart';
import 'package:playbook_polymorphism/core/utils/cents_format.dart';
import 'package:playbook_polymorphism/features/registry/model/remote_limits_config.dart';
import 'package:playbook_polymorphism/features/registry/model/remote_maintenance_config.dart';
import 'package:playbook_polymorphism/features/registry/model/remote_support_config.dart';
import 'package:playbook_polymorphism/features/registry/ui/widget/remote_config_entry_tile.dart';
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
          title: 'Maintenance',
          icon: Icons.construction,
          builder: (maintenance) => AppListTile(
            title: 'Maintenance',
            subtitle: maintenance.message,
            value: maintenance.enabled ? 'On' : 'Off',
            icon: Icons.construction,
          ),
        ),
        RemoteConfigEntryTile<RemoteSupportConfig>(
          title: 'Support',
          icon: Icons.support_agent,
          builder: (support) => AppListTile(
            title: 'Support',
            subtitle: support.email,
            value: support.phone,
            icon: Icons.support_agent,
          ),
        ),
        RemoteConfigEntryTile<RemoteLimitsConfig>(
          title: 'Limits',
          icon: Icons.speed,
          builder: (limits) => AppListTile(
            title: 'Limits',
            subtitle: '\$${limits.dailyCents.toDollars()} a day',
            value: '\$${limits.perTransferCents.toDollars()} a transfer',
            icon: Icons.speed,
          ),
        ),
      ],
    );
  }
}
