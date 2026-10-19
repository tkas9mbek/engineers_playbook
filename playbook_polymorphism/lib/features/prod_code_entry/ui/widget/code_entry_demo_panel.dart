import 'package:flutter/material.dart';
import 'package:playbook_polymorphism/features/prod_code_entry/model/code_channel.dart';
import 'package:playbook_polymorphism/features/prod_code_entry/ui/strategy/code_entry_strategy.dart';
import 'package:playbook_polymorphism/features/prod_code_entry/ui/widget/code_entry_card.dart';
import 'package:playbook_uikit/widgets/misc/app_list_tile.dart';
import 'package:playbook_uikit/widgets/misc/grouped_rows_card.dart';

/// An Email / SMS / Telegram switcher and a switch that pretends the resend
/// timer is over. The card below is the same widget for every channel.
class CodeEntryDemoPanel extends StatefulWidget {
  const CodeEntryDemoPanel({super.key});

  @override
  State<CodeEntryDemoPanel> createState() => _CodeEntryDemoPanelState();
}

class _CodeEntryDemoPanelState extends State<CodeEntryDemoPanel> {
  static const int _timerSeconds = 30;

  CodeChannel _channel = CodeChannel.email;
  bool _timerFinished = false;

  void _onChannelChanged(Set<CodeChannel> selection) {
    setState(() => _channel = selection.first);
  }

  void _onTimerChanged(bool value) => setState(() => _timerFinished = value);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 16,
      children: [
        SegmentedButton<CodeChannel>(
          showSelectedIcon: false,
          segments: [
            for (final channel in CodeChannel.values)
              ButtonSegment(value: channel, label: Text(channel.label)),
          ],
          selected: {_channel},
          onSelectionChanged: _onChannelChanged,
        ),
        GroupedRowsCard(
          children: [
            AppListTile(
              title: 'Pretend 30 seconds passed',
              trailing: Switch(
                value: _timerFinished,
                onChanged: _onTimerChanged,
              ),
            ),
          ],
        ),
        CodeEntryCard(
          key: ValueKey(_channel),
          strategy: CodeEntryStrategy.from(_channel),
          secondsLeft: _timerFinished ? 0 : _timerSeconds,
        ),
      ],
    );
  }
}
