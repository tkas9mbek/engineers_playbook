import 'package:flutter/material.dart';
import 'package:playbook_polymorphism/features/transfer/ui/common/model/transfer_action_ui_model.dart';
import 'package:playbook_uikit/theme/theme_provider.dart';
import 'package:playbook_uikit/widgets/misc/app_card.dart';

/// A selectable card for one [TransferActionUiModel].
class TransferActionTile extends StatelessWidget {
  const TransferActionTile({
    required this.action,
    required this.selected,
    required this.onTap,
    super.key,
  });

  final TransferActionUiModel action;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.of(context).theme;
    final textStyles = ThemeProvider.of(context).textStyles;

    return AppCard(
      selected: selected,
      onTap: onTap,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Icon(action.icon, color: theme.accent),
          const SizedBox(width: 14),
          Text(action.title, style: textStyles.mediumBody16),
        ],
      ),
    );
  }
}
