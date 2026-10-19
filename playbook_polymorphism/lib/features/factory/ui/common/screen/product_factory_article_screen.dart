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
      title: 'Factory vs conditional',
      intro:
          'Same products, same tiles. What changes is how many places '
          'need to know about the product types. A factory is one place '
          'that builds the right class from a value.',
      sides: [
        ArticleSide(
          title: 'Conditional',
          tagline: 'One switch returns everything',
          points: [
            ArticlePoint.good(
              'Short and easy to read. One widget, one switch.',
            ),
            ArticlePoint.good('A new product type is one new branch.'),
            ArticlePoint.bad(
              'A second screen that needs the type gets its own switch.',
            ),
            ArticlePoint.bad(
              'Everyone edits the same switch, and a long rule has no home.',
            ),
          ],
        ),
        ArticleSide(
          title: 'Factory',
          tagline: 'One switch, one small class per type',
          points: [
            ArticlePoint.bad('More classes: a base plus one for each type.'),
            ArticlePoint.good(
              'The enum is switched on once, in ProductUiModel.from. '
              'Another screen just asks the model.',
            ),
            ArticlePoint.good(
              'A type can keep its own fields, helpers and unit tests.',
            ),
            ArticlePoint.good(
              'A new type is a new class plus one line in from. '
              'Two devs on two types do not touch the same lines.',
            ),
          ],
        ),
      ],
      ruleOfThumb:
          'One screen switching on the enum? A single switch is fine. '
          'A second place needs the same type logic? Give each type its own '
          'class and one factory.',
    );
  }
}
