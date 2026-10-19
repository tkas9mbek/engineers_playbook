import 'package:flutter/material.dart';
import 'package:playbook_uikit/theme/theme_provider.dart';

/// Inline validation message under a form control, shown only while [visible].
class FieldErrorText extends StatelessWidget {
  const FieldErrorText({required this.visible, this.errorText, super.key});

  final bool visible;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    if (!visible) {
      return const SizedBox.shrink();
    }

    final theme = ThemeProvider.of(context).theme;
    final textStyles = ThemeProvider.of(context).textStyles;

    return Padding(
      padding: const EdgeInsets.only(top: 6, left: 4, right: 4),
      child: Text(
        '* ${errorText ?? ''}',
        style: textStyles.regularBody13.copyWith(color: theme.errorText),
      ),
    );
  }
}
