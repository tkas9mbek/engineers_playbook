import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:playbook_polymorphism/features/prod_code_entry/ui/strategy/code_entry_strategy.dart';
import 'package:playbook_uikit/theme/theme_provider.dart';
import 'package:playbook_uikit/widgets/button/app_outlined_button.dart';
import 'package:playbook_uikit/widgets/misc/app_card.dart';
import 'package:playbook_uikit/widgets/status/notification_snack_bar.dart';

/// The "type the code" card. What you may type, the hint and the text come
/// from [strategy]. Give it a new key when the strategy changes, so the field
/// starts empty.
class CodeEntryCard extends StatefulWidget {
  const CodeEntryCard({
    required this.strategy,
    required this.secondsLeft,
    super.key,
  });

  final CodeEntryStrategy strategy;
  final int secondsLeft;

  @override
  State<CodeEntryCard> createState() => _CodeEntryCardState();
}

class _CodeEntryCardState extends State<CodeEntryCard> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Lets the strategy clean every edit before it reaches the field, and
  /// keeps the caret where the user is typing.
  TextEditingValue _clean(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final strategy = widget.strategy;
    final text = strategy.cleanUp(newValue.text);
    final caret = newValue.selection.isValid
        ? newValue.selection.baseOffset.clamp(0, newValue.text.length)
        : newValue.text.length;
    final offset = strategy.cleanUp(newValue.text.substring(0, caret)).length;

    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: offset.clamp(0, text.length)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.of(context).theme;
    final textStyles = ThemeProvider.of(context).textStyles;
    final strategy = widget.strategy;
    final label = strategy.actionLabel(widget.secondsLeft);
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: theme.border),
    );

    return AppCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 16,
        children: [
          Text('Enter the code', style: textStyles.mediumTitle20),
          Text(
            strategy.subtitle,
            style: textStyles.regularBody14.copyWith(
              color: theme.textSecondary,
            ),
          ),
          TextField(
            controller: _controller,
            inputFormatters: [TextInputFormatter.withFunction(_clean)],
            onChanged: (_) => setState(() {}),
            textAlign: TextAlign.center,
            style: textStyles.mediumTitle20,
            decoration: InputDecoration(
              hintText: strategy.hint,
              border: border,
              enabledBorder: border,
              focusedBorder: border.copyWith(
                borderSide: BorderSide(color: theme.accent),
              ),
              suffixIcon: strategy.isComplete(_controller.text)
                  ? Icon(Icons.check_circle_outline, color: theme.success)
                  : null,
            ),
          ),
          AppOutlinedButton.medium(
            context: context,
            text: label,
            enabled: strategy.isActionEnabled(widget.secondsLeft),
            onPressed: () => NotificationSnackBar.show(
              context,
              NotificationSnackBar.information(text: '$label: tapped'),
            ),
          ),
        ],
      ),
    );
  }
}
