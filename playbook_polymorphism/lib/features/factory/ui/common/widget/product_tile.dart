import 'package:flutter/material.dart';
import 'package:playbook_uikit/theme/theme_provider.dart';
import 'package:playbook_uikit/widgets/misc/app_card.dart';
import 'package:playbook_uikit/widgets/misc/status_pill.dart';

/// The look of one product row. It takes plain values and knows nothing about
/// product types, so it hides none of the difference between the two screens.
/// Without [onTap] the row is not tappable.
class ProductTile extends StatelessWidget {
  const ProductTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.accent,
    this.onTap,
    this.badge,
    super.key,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Color accent;
  final String? badge;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.of(context).theme;
    final textStyles = ThemeProvider.of(context).textStyles;

    return AppCard(
      onTap: onTap,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: accent.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Icon(icon, color: accent),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: textStyles.mediumBody16),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: textStyles.regularBody14.copyWith(
                    color: theme.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          if (badge != null) StatusPill(label: badge!, color: accent),
        ],
      ),
    );
  }
}
