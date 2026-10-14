import 'package:flutter/material.dart';
import 'package:playbook_uikit/theme/theme_provider.dart';

/// Lays out the inner content shared by most app bars: a centered [title]
/// with optional [subtitle], trailing [actions], and a back chevron implied
/// automatically when the route can pop.
class AppBarContent extends StatelessWidget {
  const AppBarContent({
    required this.title,
    this.automaticallyImplyLeading = true,
    this.subtitle,
    this.actions,
    super.key,
  });

  final String title;
  final Widget? subtitle;
  final List<Widget>? actions;
  final bool automaticallyImplyLeading;

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.of(context).theme;
    final textStyles = ThemeProvider.of(context).textStyles;

    return Stack(
      fit: StackFit.expand,
      children: [
        if (automaticallyImplyLeading && Navigator.canPop(context)) ...[
          Align(
            alignment: Alignment.topLeft,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => Navigator.pop(context),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 12,
                  top: 17,
                  right: 16,
                  bottom: 12,
                ),
                child: Icon(Icons.arrow_back, color: theme.textPrimary),
              ),
            ),
          ),
        ],
        Align(
          alignment: Alignment.centerRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [...?actions],
          ),
        ),
        if (subtitle == null) ...[
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 12),
                Text(title, style: textStyles.mediumTitle20),
              ],
            ),
          ),
        ] else ...[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(flex: 1),
                Text(title, style: textStyles.mediumTitle20),
                const SizedBox(height: 2),
                subtitle!,
                const Spacer(flex: 3),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
