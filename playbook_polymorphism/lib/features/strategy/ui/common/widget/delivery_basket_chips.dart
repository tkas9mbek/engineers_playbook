import 'package:flutter/material.dart';
import 'package:playbook_polymorphism/core/utils/cents_format.dart';
import 'package:playbook_uikit/theme/theme_provider.dart';
import 'package:playbook_uikit/widgets/misc/app_card.dart';

const List<int> _subtotalsCents = [2000, 4000, 6000];

/// A row of basket totals to pick from.
class DeliveryBasketChips extends StatelessWidget {
  const DeliveryBasketChips({
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
        for (final subtotalCents in _subtotalsCents)
          AppCard(
            selected: subtotalCents == selected,
            onTap: () => onSelected(subtotalCents),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            child: Text(
              '\$${subtotalCents.toDollars()}',
              style: textStyles.mediumBody16,
            ),
          ),
      ],
    );
  }
}
