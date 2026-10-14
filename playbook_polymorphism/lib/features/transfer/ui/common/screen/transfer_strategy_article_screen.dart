import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:playbook_uikit/widgets/article/article_layout.dart';
import 'package:playbook_uikit/widgets/article/article_point.dart';
import 'package:playbook_uikit/widgets/article/article_side.dart';

@RoutePage()
class TransferStrategyArticleScreen extends StatelessWidget {
  const TransferStrategyArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ArticleLayout(
      title: 'Strategy vs conditional',
      intro:
          'Same screen, same behavior. What changes is how much it hurts '
          'when the logic grows.',
      sides: [
        ArticleSide(
          title: 'Conditional',
          tagline: 'Easy to write, primitive',
          points: [
            ArticlePoint.good('Easy to implement. Nothing new to learn.'),
            ArticlePoint.bad(
              'Logic grows, and so do the places to check. One rule '
              'ends up spread over many switches.',
            ),
            ArticlePoint.bad(
              'Change one behavior and you may change it in many places. '
              'That is how bugs sneak in.',
            ),
            ArticlePoint.bad(
              'A new behavior means editing existing code, and every edit '
              'can break something that worked. High dependency.',
            ),
          ],
        ),
        ArticleSide(
          title: 'Strategy',
          tagline: 'More classes, limited responsibility',
          points: [
            ArticlePoint.bad('Looks like more classes and more code.'),
            ArticlePoint.good(
              'Each class has one small job. You know where to look.',
            ),
            ArticlePoint.good(
              'Give two devs the same screen with two different behaviors. '
              'They work in different files, so no conflicts.',
            ),
            ArticlePoint.good(
              'Add a new behavior without wondering what you might break. '
              'Old classes stay untouched.',
            ),
          ],
        ),
      ],
      ruleOfThumb:
          'One or two tiny differences? A conditional is fine. '
          'Same switch in three places, or rules that keep growing? '
          'Time for a strategy.',
    );
  }
}
