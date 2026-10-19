import 'package:flutter/material.dart';

/// Makes any [child] tappable the accessible way. It uses an [InkWell], so
/// the child can be focused with a keyboard, and it tells screen readers that
/// it is a button, with [semanticLabel] when the child has no text (an icon).
///
/// Use it instead of a bare `GestureDetector`, which a screen reader and a
/// keyboard cannot reach. It has no splash. Only a keyboard focus is drawn.
class AppTapArea extends StatelessWidget {
  const AppTapArea({
    required this.child,
    this.onTap,
    this.semanticLabel,
    this.selected,
    super.key,
  });

  final Widget child;

  /// Without it the area is not a button.
  final VoidCallback? onTap;

  /// What a screen reader says. Set it for an icon with no text.
  final String? semanticLabel;

  /// Whether this area is the chosen one of a group, like a tab.
  final bool? selected;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: onTap != null,
      label: semanticLabel,
      selected: selected,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          splashFactory: NoSplash.splashFactory,
          overlayColor: WidgetStateProperty.resolveWith(
            (states) => states.contains(WidgetState.focused)
                ? null
                : Colors.transparent,
          ),
          child: child,
        ),
      ),
    );
  }
}
