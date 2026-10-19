import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:playbook_polymorphism/features/prod_code_entry/ui/widget/code_entry_demo_panel.dart';
import 'package:playbook_uikit/widgets/article/case_pattern.dart';
import 'package:playbook_uikit/widgets/article/case_patterns_card.dart';
import 'package:playbook_uikit/widgets/article/pattern_layout.dart';

@RoutePage()
class CodeEntryScreen extends StatelessWidget {
  const CodeEntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PatternLayout(
      title: 'Code screen',
      intro:
          'Log in, sign up, reset a password: each one sends a one-time '
          'code, by email, SMS or Telegram. It is one screen. Each channel '
          'has its own rule for what you may type and how its address is '
          'shown. The screen never asks which channel it is.\n\n'
          'Type letters in Email, then in Telegram. Then pretend the 30 '
          'second timer is over. Telegram never waits, because it has no '
          '"send again".',
      demo: Column(
        spacing: 16,
        children: [
          CasePatternsCard(
            patterns: [
              CasePattern(
                name: 'Strategy',
                role: 'One class per channel owns its input rule and masking',
              ),
              CasePattern(
                name: 'Default in the base class',
                role: 'Email and SMS keep "send again", Telegram overrides it',
              ),
              CasePattern(
                name: 'Factory',
                role: 'CodeEntryStrategy.from picks the class for a channel',
              ),
            ],
          ),
          CodeEntryDemoPanel(),
        ],
      ),
      whenToUse:
          'A screen is the same for every case, but each case has its own '
          'rules or steps. Put a sensible default in the base class, so a '
          'new case overrides only what is really different.',
      whenToSkip:
          'The cases differ in almost everything. Then give each its own '
          'screen, and share only the small widgets. Skip it too when the '
          'only difference is text: a map is enough.',
      tryThis:
          'type letters in Email, then in Telegram. Then open '
          'TelegramCodeEntryStrategy: which methods does it replace?',
    );
  }
}
