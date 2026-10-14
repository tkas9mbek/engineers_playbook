import 'package:flutter/material.dart';
import 'package:playbook_uikit/theme/theme_provider.dart';
import 'package:playbook_uikit/widgets/misc/app_card.dart';

const List<int> _amounts = [20, 100, 500, 2000];

/// A row of amounts to pick from.
class TransferAmountChips extends StatelessWidget {
  const TransferAmountChips({
    required this.selected,
    required this.onSelected,
    super.key,
  });

  final int selected;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    final textStyles = ThemeProvider.of(context).textStyles;

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final amount in _amounts)
          AppCard(
            selected: amount == selected,
            onTap: () => onSelected(amount),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            child: Text('\$$amount', style: textStyles.mediumBody16),
          ),
      ],
    );
  }
}
