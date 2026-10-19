import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:playbook_uikit/widgets/article/article_layout.dart';
import 'package:playbook_uikit/widgets/article/article_point.dart';
import 'package:playbook_uikit/widgets/article/article_side.dart';

@RoutePage()
class DeliveryStrategyArticleScreen extends StatelessWidget {
  const DeliveryStrategyArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ArticleLayout(
      title: 'Strategy vs conditional',
      intro:
          'Same screen, same behavior, and both written tidily. The code is '
          'grouped differently: by question in the conditional, by option in '
          'the strategy.',
      sides: [
        ArticleSide(
          title: 'Conditional',
          tagline: 'Short, until the options pile up',
          points: [
            ArticlePoint.good(
              'Easy to write. Switches in one file read like a table.',
            ),
            ArticlePoint.good('A new question is one new switch.'),
            ArticlePoint.bad(
              'A new option means a branch in every switch. The compiler '
              'lists them, but you still edit old code.',
            ),
            ArticlePoint.bad(
              'The rules of one option are scattered over the switches. A long '
              'rule or a helper has no home.',
            ),
          ],
        ),
        ArticleSide(
          title: 'Strategy',
          tagline: 'One class per option',
          points: [
            ArticlePoint.bad(
              'More files. For tiny rules that is more to read.',
            ),
            ArticlePoint.bad('A new question means touching every class.'),
            ArticlePoint.good(
              r'All of Express, its $50 limit included, is in one file.',
            ),
            ArticlePoint.good(
              'A new option is a new file. Two devs adding two options do '
              'not touch the same lines.',
            ),
            ArticlePoint.good('An option can keep its own fields and helpers.'),
          ],
        ),
      ],
      ruleOfThumb:
          'A few options with one-line rules? One tidy switch is fine. '
          'Options keep arriving, or each one grows its own rules? '
          'Time for a strategy.',
    );
  }
}
