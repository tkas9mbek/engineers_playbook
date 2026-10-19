import 'package:playbook_polymorphism/features/prod_code_entry/ui/strategy/code_entry_strategy.dart';

/// Telegram codes are five letters or digits, upper case. It has no "send
/// again": the bot delivers the code when you open it. So it replaces the
/// default action, and it is never blocked by the timer.
class TelegramCodeEntryStrategy extends CodeEntryStrategy {
  const TelegramCodeEntryStrategy({required this.bot});

  final String bot;

  /// A bot name is public, so there is nothing to hide.
  @override
  String get maskedContact => bot;

  @override
  String get subtitle => 'Open $bot in Telegram and tap Start to get the code';

  @override
  int get codeLength => 5;

  @override
  String get hint => '5 letters or digits';

  @override
  String cleanUp(String typed) {
    final clean = typed.replaceAll(RegExp('[^A-Za-z0-9]'), '').toUpperCase();

    return clean.length > codeLength ? clean.substring(0, codeLength) : clean;
  }

  @override
  String actionLabel(int secondsLeft) => 'Open the Telegram bot';

  @override
  bool isActionEnabled(int secondsLeft) => true;
}
