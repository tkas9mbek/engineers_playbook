import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:playbook_polymorphism/features/prod_product_actions/ui/widget/product_actions_panel.dart';
import 'package:playbook_uikit/widgets/article/case_pattern.dart';
import 'package:playbook_uikit/widgets/article/case_patterns_card.dart';
import 'package:playbook_uikit/widgets/article/pattern_layout.dart';

@RoutePage()
class ProductActionsScreen extends StatelessWidget {
  const ProductActionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PatternLayout(
      title: 'Product actions',
      intro:
          'The same list of products as before, but now each product can do '
          'something: freeze a card, top up a deposit, repay a credit. The '
          'look of a row and its action are two different jobs, so they are '
          'two different objects: a UI model (how it looks) and a strategy '
          '(what it does).\n\n'
          'Tap the buttons. The Crypto Wallet is a type this app version '
          'does not know, so it has no action.',
      demo: Column(
        spacing: 16,
        children: [
          CasePatternsCard(
            patterns: [
              CasePattern(
                name: 'Factory',
                role:
                    'ProductUiModel.from picks the look, ProductActionStrategy.from picks the action',
              ),
              CasePattern(
                name: 'Strategy',
                role: 'Each kind owns its action in domain/, with no ifs',
              ),
            ],
          ),
          ProductActionsPanel(),
        ],
      ),
      whenToUse:
          'A list holds items of several kinds, and each kind does its own '
          'thing. Keep the look in ui/ and the behavior in domain/, with one '
          'factory for each. The screen only asks.',
      whenToSkip:
          'The items differ only in text or an icon. A UI model with a '
          'factory is enough, and a strategy would be an empty shell.',
      tryThis:
          'set failureRate to 1 in ProductActionModule, hot restart and tap a '
          'button. Then add a loan product: how many files change?',
    );
  }
}
