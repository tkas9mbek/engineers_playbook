import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:playbook_uikit/widgets/article/article_layout.dart';
import 'package:playbook_uikit/widgets/article/article_point.dart';
import 'package:playbook_uikit/widgets/article/article_side.dart';

@RoutePage()
class ProductFactoryArticleScreen extends StatelessWidget {
  const ProductFactoryArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ArticleLayout(
      title: 'Factory method vs conditional',
      intro:
          'Same products, same tiles. What changes is how many places '
          'need to know about the product types.',
      sides: [
        ArticleSide(
          title: 'Conditional',
          tagline: 'Switch on the enum wherever you need it',
          points: [
            ArticlePoint.good('Easy to implement. One widget, one enum.'),
            ArticlePoint.bad(
              'Every detail has its own switch: icon, color, subtitle, '
              'badge, action. Five of them already.',
            ),
            ArticlePoint.bad(
              'A new product type means finding every switch. Miss one and '
              'that tile looks wrong, with no warning.',
            ),
            ArticlePoint.bad(
              'Everyone edits the same widget. Two devs on two product '
              'types means merge conflicts.',
            ),
          ],
        ),
        ArticleSide(
          title: 'Factory method',
          tagline: 'One switch, one small class per type',
          points: [
            ArticlePoint.bad('More classes: a base plus one for each type.'),
            ArticlePoint.good(
              'The enum is switched on once, in ProductUiModel.from. '
              'Nowhere else.',
            ),
            ArticlePoint.good(
              'How a type looks and behaves lives in its own class. '
              'Easy to find, easy to change.',
            ),
            ArticlePoint.good(
              'A new type is a new class plus one line in from. '
              'The widget does not change.',
            ),
          ],
        ),
      ],
      ruleOfThumb:
          'The enum matters in one or two places? A switch is fine. '
          'Same enum switched in three places? Give it a UI model with '
          'a factory method.',
    );
  }
}
