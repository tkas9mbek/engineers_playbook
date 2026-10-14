import 'package:flutter/material.dart';
import 'package:playbook_uikit/theme/theme_provider.dart';
import 'package:playbook_uikit/widgets/app_bar/title_app_bar.dart';
import 'package:playbook_uikit/widgets/article/article_rule_of_thumb_card.dart';

/// A short page about one design pattern: an intro, a live [demo] and when
/// to use it. The caller provides the words and the demo.
class PatternLayout extends StatelessWidget {
  const PatternLayout({
    required this.title,
    required this.intro,
    required this.demo,
    required this.whenToUse,
    super.key,
  });

  final String title;
  final String intro;
  final Widget demo;
  final String whenToUse;

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.of(context).theme;
    final textStyles = ThemeProvider.of(context).textStyles;

    final items = <Widget>[
      Text(
        intro,
        style: textStyles.regularBody16.copyWith(color: theme.textSecondary),
      ),
      demo,
      ArticleRuleOfThumbCard(title: 'When to use it', text: whenToUse),
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
