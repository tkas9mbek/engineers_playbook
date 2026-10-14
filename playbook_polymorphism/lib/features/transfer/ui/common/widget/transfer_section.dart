import 'package:flutter/material.dart';
import 'package:playbook_uikit/theme/theme_provider.dart';

/// A small grey heading above [child].
class TransferSection extends StatelessWidget {
  const TransferSection({required this.title, required this.child, super.key});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.of(context).theme;
    final textStyles = ThemeProvider.of(context).textStyles;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          title,
          style: textStyles.mediumBody14.copyWith(color: theme.textSecondary),
        ),
        child,
      ],
    );
  }
}
