import 'package:flutter/material.dart';
import 'package:playbook_uikit/theme/theme_provider.dart';
import 'package:playbook_uikit/widgets/misc/app_card.dart';

/// A highlighted card with a short [title] and one piece of advice, like the
/// rule of thumb that closes an article, or "When to use it" on a pattern page.
class ArticleRuleOfThumbCard extends StatelessWidget {
  const ArticleRuleOfThumbCard({
    required this.text,
    this.title = 'Rule of thumb',
    super.key,
  });

  final String text;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.of(context).theme;
    final textStyles = ThemeProvider.of(context).textStyles;

    return AppCard(
      selected: true,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: textStyles.mediumBody16),
          const SizedBox(height: 6),
          Text(
            text,
            style: textStyles.regularBody14.copyWith(
              color: theme.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
