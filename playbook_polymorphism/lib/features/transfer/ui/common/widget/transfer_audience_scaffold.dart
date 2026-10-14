import 'package:flutter/material.dart';
import 'package:playbook_polymorphism/features/transfer/model/transfer_audience.dart';
import 'package:playbook_uikit/theme/theme_provider.dart';
import 'package:playbook_uikit/widgets/app_bar/title_app_bar.dart';

/// Demo frame around a transfers view: an app bar with an Adult / Child
/// switcher, so you can compare both audiences on the same screen.
class TransferAudienceScaffold extends StatefulWidget {
  const TransferAudienceScaffold({
    required this.title,
    required this.builder,
    super.key,
  });

  final String title;
  final Widget Function(TransferAudience audience) builder;

  @override
  State<TransferAudienceScaffold> createState() =>
      _TransferAudienceScaffoldState();
}

class _TransferAudienceScaffoldState extends State<TransferAudienceScaffold> {
  TransferAudience _audience = TransferAudience.standard;

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.of(context).theme;

    return Scaffold(
      backgroundColor: theme.background,
      appBar: TitleAppBar(
        title: widget.title,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
            child: SegmentedButton<TransferAudience>(
              showSelectedIcon: false,
              segments: [
                for (final audience in TransferAudience.values)
                  ButtonSegment(value: audience, label: Text(audience.label)),
              ],
              selected: {_audience},
              onSelectionChanged: (selection) =>
                  setState(() => _audience = selection.first),
            ),
          ),
        ),
      ),
      // The key resets the view's own state when the audience changes.
      body: KeyedSubtree(
        key: ValueKey(_audience),
        child: widget.builder(_audience),
      ),
    );
  }
}
