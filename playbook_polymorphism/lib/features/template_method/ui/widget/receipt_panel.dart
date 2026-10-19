import 'package:flutter/material.dart';
import 'package:playbook_polymorphism/features/template_method/ui/model/receipt_ui_model.dart';
import 'package:playbook_uikit/theme/theme_provider.dart';
import 'package:playbook_uikit/widgets/misc/app_list_tile.dart';
import 'package:playbook_uikit/widgets/misc/grouped_rows_card.dart';

/// A receipt's title, its rows and its closing line. It only asks the model;
/// it does not know which kind of receipt it shows.
class ReceiptPanel extends StatelessWidget {
  const ReceiptPanel({required this.model, super.key});

  final ReceiptUiModel model;

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.of(context).theme;
    final textStyles = ThemeProvider.of(context).textStyles;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(model.title, style: textStyles.mediumTitle20),
        const SizedBox(height: 8),
        GroupedRowsCard(
          children: [
            for (final row in model.buildRows())
              AppListTile(title: row.label, value: row.value),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          model.footer,
          style: textStyles.regularBody14.copyWith(color: theme.textSecondary),
        ),
      ],
    );
  }
}
