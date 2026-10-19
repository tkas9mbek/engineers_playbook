import 'package:flutter/material.dart';
import 'package:playbook_uikit/widgets/article/case_pattern.dart';
import 'package:playbook_uikit/widgets/misc/app_list_tile.dart';
import 'package:playbook_uikit/widgets/misc/grouped_rows_card.dart';

/// The patterns an example combines, one row each.
class CasePatternsCard extends StatelessWidget {
  const CasePatternsCard({required this.patterns, super.key});

  final List<CasePattern> patterns;

  @override
  Widget build(BuildContext context) {
    return GroupedRowsCard(
      children: [
        for (final pattern in patterns)
          AppListTile(
            title: pattern.name,
            subtitle: pattern.role,
            icon: Icons.extension_outlined,
          ),
      ],
    );
  }
}
