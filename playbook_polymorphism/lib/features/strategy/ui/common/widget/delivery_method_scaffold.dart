import 'package:flutter/material.dart';
import 'package:playbook_polymorphism/features/strategy/model/delivery_method.dart';
import 'package:playbook_uikit/theme/theme_provider.dart';
import 'package:playbook_uikit/widgets/app_bar/title_app_bar.dart';

/// Demo frame around a checkout view: an app bar with a Standard / Express /
/// Pickup switcher, so you can compare every delivery on the same screen.
class DeliveryMethodScaffold extends StatefulWidget {
  const DeliveryMethodScaffold({
    required this.title,
    required this.builder,
    super.key,
  });

  final String title;
  final Widget Function(DeliveryMethod method) builder;

  @override
  State<DeliveryMethodScaffold> createState() => _DeliveryMethodScaffoldState();
}

class _DeliveryMethodScaffoldState extends State<DeliveryMethodScaffold> {
  DeliveryMethod _method = DeliveryMethod.standard;

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
            child: SegmentedButton<DeliveryMethod>(
              showSelectedIcon: false,
              segments: [
                for (final method in DeliveryMethod.values)
                  ButtonSegment(value: method, label: Text(method.label)),
              ],
              selected: {_method},
              onSelectionChanged: (selection) =>
                  setState(() => _method = selection.first),
            ),
          ),
        ),
      ),
      // The key resets the view's own state when the method changes.
      body: KeyedSubtree(
        key: ValueKey(_method),
        child: widget.builder(_method),
      ),
    );
  }
}
