import 'package:flutter/material.dart';
import 'package:playbook_uikit/theme/theme_provider.dart';
import 'package:playbook_uikit/widgets/misc/app_list_tile.dart';
import 'package:playbook_uikit/widgets/misc/grouped_rows_card.dart';

/// A heading with a short description, followed by [tiles] grouped in one card.
class AppTitledTilesPanel extends StatelessWidget {
  const AppTitledTilesPanel({
    required this.title,
    required this.description,
    required this.tiles,
    super.key,
  });

  final String title;
  final String description;
  final List<AppListTile> tiles;

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.of(context).theme;
    final textStyles = ThemeProvider.of(context).textStyles;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: textStyles.mediumTitle20),
        const SizedBox(height: 4),
        Text(
          description,
          style: textStyles.regularBody14.copyWith(color: theme.textSecondary),
        ),
        const SizedBox(height: 12),
        GroupedRowsCard(children: tiles),
      ],
    );
  }
}
