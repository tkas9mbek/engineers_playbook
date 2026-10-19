import 'package:flutter/material.dart';
import 'package:playbook_toolkit/data/exceptions/app_exception.dart';
import 'package:playbook_uikit/theme/theme_provider.dart';
import 'package:playbook_uikit/utils/extensions/app_exception_ui_extension.dart';
import 'package:playbook_uikit/widgets/button/app_outlined_button.dart';

/// What a screen or a card shows when loading failed: the exception's message
/// and, if the exception can be retried and [onRetry] is set, a retry button.
class FailureWidget extends StatelessWidget {
  const FailureWidget({required this.exception, this.onRetry, super.key});

  final AppException exception;
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
          spacing: 12,
          children: [
            Icon(Icons.info_outline, size: 40, color: theme.errorText),
            Text(
              exception.message,
              style: textStyles.mediumBody16,
              textAlign: TextAlign.center,
            ),
            if (exception.canRetry && onRetry != null)
              AppOutlinedButton.medium(
                context: context,
                text: 'Retry',
                width: null,
                onPressed: onRetry,
                icon: Icon(Icons.refresh, size: 20, color: theme.accent),
              ),
          ],
        ),
      ),
    );
  }
}
