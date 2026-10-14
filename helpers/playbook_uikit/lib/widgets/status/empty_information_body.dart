import 'package:flutter/material.dart';
import 'package:playbook_uikit/theme/theme_provider.dart';
import 'package:playbook_uikit/widgets/button/app_outlined_button.dart';

/// Centered empty state: a muted icon, a message ("No data available" by
/// default) and an optional outlined retry button.
class EmptyInformationBody extends StatelessWidget {
  const EmptyInformationBody({this.icon, this.text, this.onRetry, super.key});

  final IconData? icon;
  final String? text;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.of(context).theme;
    final textStyles = ThemeProvider.of(context).textStyles;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon ?? Icons.inbox_outlined,
              size: 56,
              color: theme.textTertiary,
            ),
            const SizedBox(height: 16),
            Text(
              text ?? 'No data available',
              style: textStyles.regularBody16.copyWith(
                color: theme.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 24),
              AppOutlinedButton.medium(
                context: context,
                text: 'Retry',
                onPressed: onRetry,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
