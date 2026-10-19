import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:playbook_polymorphism/features/prod_payment/ui/widget/payment_demo_panel.dart';
import 'package:playbook_uikit/widgets/article/case_pattern.dart';
import 'package:playbook_uikit/widgets/article/case_patterns_card.dart';
import 'package:playbook_uikit/widgets/article/pattern_layout.dart';

@RoutePage()
class PaymentFlowScreen extends StatelessWidget {
  const PaymentFlowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PatternLayout(
      title: 'Payment flow',
      intro:
          'A banking app pays utility bills, shops and QR codes. The screen '
          'is the same for all of them. Only a few steps differ: a QR code '
          'does not say who you are paying, so the app has to ask the bank '
          'first.\n\n'
          'Three patterns share the job. Try both types and read the steps '
          'on the receipt.',
      demo: Column(
        spacing: 16,
        children: [
          CasePatternsCard(
            patterns: [
              CasePattern(
                name: 'Strategy',
                role: 'The bloc pays through a PaymentStrategy, with no ifs',
              ),
              CasePattern(
                name: 'Template method',
                role: 'pay() fixes the steps, a QR payment changes only one',
              ),
              CasePattern(
                name: 'Factory',
                role: 'PaymentStrategy.from is the one place that picks',
              ),
            ],
          ),
          PaymentDemoPanel(),
        ],
      ),
      whenToUse:
          'One flow comes in several kinds, and each kind changes a step or '
          'two. Fix the steps in a base class, let each kind override only '
          'its step, and pick the kind once, at the edge.',
      whenToSkip:
          'There is one kind of payment, or the kinds share no steps. Start '
          'with one class, and pull out the base class when the second kind '
          'really arrives.',
      tryThis:
          'pay with each type and compare the receipts. Which step is '
          'extra for QR?',
    );
  }
}
