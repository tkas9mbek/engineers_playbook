import 'package:playbook_polymorphism/features/prod_code_entry/ui/strategy/code_entry_strategy.dart';

/// Six digits, the defaults. Hides the name in front of the `@`.
class EmailCodeEntryStrategy extends CodeEntryStrategy {
  const EmailCodeEntryStrategy({required this.email});

  final String email;

  @override
  String get maskedContact =>
      '${email[0]}***${email.substring(email.indexOf('@'))}';

  @override
  String get subtitle => 'We sent a code to $maskedContact';
}
