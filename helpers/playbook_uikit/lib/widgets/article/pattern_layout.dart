import 'package:flutter/material.dart';
import 'package:playbook_uikit/theme/theme_provider.dart';
import 'package:playbook_uikit/utils/functions/safe_size_functions.dart';
import 'package:playbook_uikit/widgets/app_bar/title_app_bar.dart';
import 'package:playbook_uikit/widgets/article/article_rule_of_thumb_card.dart';

/// A short page about one design pattern: an intro, a live [demo], when to
/// use it, when to skip it and one thing to try. The caller provides the
/// words and the demo.
class PatternLayout extends StatelessWidget {
  const PatternLayout({
    required this.title,
    required this.intro,
    required this.demo,
    required this.whenToUse,
    required this.whenToSkip,
    required this.tryThis,
    super.key,
  });

  final String title;
  final String intro;
  final Widget demo;
  final String whenToUse;
  final String whenToSkip;
  final String tryThis;

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.of(context).theme;
    final textStyles = ThemeProvider.of(context).textStyles;

    return Scaffold(
      backgroundColor: theme.background,
      appBar: TitleAppBar(title: title),
      body: SingleChildScrollView(
        padding: getScreenPadding(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 16,
          children: [
            Text(
              intro,
              style: textStyles.regularBody16.copyWith(
                color: theme.textSecondary,
              ),
            ),
            demo,
            ArticleRuleOfThumbCard(title: 'When to use it', text: whenToUse),
            ArticleRuleOfThumbCard(title: 'When to skip it', text: whenToSkip),
            Text(
              'Try this: $tryThis',
              style: textStyles.mediumBody14.copyWith(color: theme.accent),
            ),
          ],
        ),
      ),
    );
  }
}
