import 'package:playbook_polymorphism/features/prod_code_entry/ui/strategy/code_entry_strategy.dart';

/// Four digits. Shows only the last four digits of the phone number.
class SmsCodeEntryStrategy extends CodeEntryStrategy {
  const SmsCodeEntryStrategy({required this.phone});

  final String phone;

  @override
  int get codeLength => 4;

  @override
  String get maskedContact => '*** ${phone.substring(phone.length - 4)}';

  @override
  String get subtitle => 'We sent a text message to $maskedContact';
}
