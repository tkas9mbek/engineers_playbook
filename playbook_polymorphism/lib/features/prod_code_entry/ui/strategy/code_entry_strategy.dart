import 'package:playbook_polymorphism/features/prod_code_entry/model/code_channel.dart';
import 'package:playbook_polymorphism/features/prod_code_entry/ui/strategy/email_code_entry_strategy.dart';
import 'package:playbook_polymorphism/features/prod_code_entry/ui/strategy/sms_code_entry_strategy.dart';
import 'package:playbook_polymorphism/features/prod_code_entry/ui/strategy/telegram_code_entry_strategy.dart';

/// What a "type the code" screen says and does for one channel. One screen
/// serves every channel, and each channel is one subclass.
///
/// A channel owns two real behaviors: what the user may type ([cleanUp],
/// [codeLength]) and how its address is hidden ([maskedContact]). The base
/// class holds the defaults: six digits, and "send again" once the timer
/// ends. A channel overrides only what is different.
///
/// A strategy holds only what really varies. Anything the same for every
/// channel, like sending the code to the server, does not belong here.
///
/// It lives in `ui/` because it holds words for the user.
abstract class CodeEntryStrategy {
  const CodeEntryStrategy();

  factory CodeEntryStrategy.from(CodeChannel channel) => switch (channel) {
    CodeChannel.email => EmailCodeEntryStrategy(email: channel.contact),
    CodeChannel.sms => SmsCodeEntryStrategy(phone: channel.contact),
    CodeChannel.telegram => TelegramCodeEntryStrategy(bot: channel.contact),
  };

  /// The address with the private part hidden, safe to show on screen.
  String get maskedContact;

  String get subtitle;

  /// How many characters the code has.
  int get codeLength => 6;

  /// Shown in the empty field.
  String get hint => '$codeLength digits';

  /// Runs on every keystroke. Returns only what this channel allows.
  /// The default keeps digits.
  String cleanUp(String typed) {
    final digits = typed.replaceAll(RegExp(r'\D'), '');

    return digits.length > codeLength
        ? digits.substring(0, codeLength)
        : digits;
  }

  bool isComplete(String code) => code.length == codeLength;

  String actionLabel(int secondsLeft) =>
      secondsLeft > 0 ? 'Send again in ${secondsLeft}s' : 'Send again';

  bool isActionEnabled(int secondsLeft) => secondsLeft <= 0;
}
