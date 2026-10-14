import 'package:flutter/material.dart';
import 'package:playbook_uikit/theme/theme_provider.dart';
import 'package:playbook_uikit/widgets/app_bar/title_app_bar.dart';
import 'package:playbook_uikit/widgets/article/article_point.dart';
import 'package:playbook_uikit/widgets/article/article_rule_of_thumb_card.dart';
import 'package:playbook_uikit/widgets/article/article_side.dart';
import 'package:playbook_uikit/widgets/misc/app_card.dart';

/// A short comparison article: intro, one card per side, a rule of thumb.
/// The caller provides only the words.
class ArticleLayout extends StatelessWidget {
  const ArticleLayout({
    required this.title,
    required this.intro,
    required this.sides,
    required this.ruleOfThumb,
    super.key,
  });

  final String title;
  final String intro;
  final List<ArticleSide> sides;
  final String ruleOfThumb;

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.of(context).theme;
    final textStyles = ThemeProvider.of(context).textStyles;

    final items = <Widget>[
      Text(
        intro,
        style: textStyles.regularBody16.copyWith(color: theme.textSecondary),
      ),
      for (final side in sides) _ArticleSideCard(side: side),
      ArticleRuleOfThumbCard(text: ruleOfThumb),
    ];

    return Scaffold(
      backgroundColor: theme.background,
      appBar: TitleAppBar(title: title),
      body: ListView.separated(
        padding: EdgeInsets.only(
          left: 16,
          top: 16,
          right: 16,
          bottom: 16 + MediaQuery.paddingOf(context).bottom,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) => items[index],
        separatorBuilder: (context, index) => const SizedBox(height: 16),
      ),
    );
  }
}

class _ArticleSideCard extends StatelessWidget {
  const _ArticleSideCard({required this.side});

  final ArticleSide side;

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.of(context).theme;
    final textStyles = ThemeProvider.of(context).textStyles;

    return AppCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(side.title, style: textStyles.mediumTitle20),
          const SizedBox(height: 2),
          Text(
            side.tagline,
            style: textStyles.regularBody14.copyWith(
              color: theme.textSecondary,
            ),
          ),
          const SizedBox(height: 12),
          Column(
            spacing: 10,
            children: [
              for (final point in side.points) _ArticlePointRow(point: point),
            ],
          ),
        ],
      ),
    );
  }
}

class _ArticlePointRow extends StatelessWidget {
  const _ArticlePointRow({required this.point});

  final ArticlePoint point;

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.of(context).theme;
    final textStyles = ThemeProvider.of(context).textStyles;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          point.isGood
              ? Icons.check_circle_outline
              : Icons.warning_amber_rounded,
          size: 20,
          color: point.isGood ? theme.success : theme.warning,
        ),
        const SizedBox(width: 10),
        Expanded(child: Text(point.text, style: textStyles.regularBody14)),
      ],
    );
  }
}
