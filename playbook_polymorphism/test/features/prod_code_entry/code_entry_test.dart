import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:playbook_polymorphism/features/prod_code_entry/model/code_channel.dart';
import 'package:playbook_polymorphism/features/prod_code_entry/ui/screen/code_entry_screen.dart';
import 'package:playbook_polymorphism/features/prod_code_entry/ui/strategy/code_entry_strategy.dart';
import 'package:playbook_polymorphism/features/prod_code_entry/ui/strategy/email_code_entry_strategy.dart';
import 'package:playbook_polymorphism/features/prod_code_entry/ui/strategy/telegram_code_entry_strategy.dart';

import '../../support/pump_app.dart';

void main() {
  group('CodeEntryStrategy', () {
    test('the factory picks a class for each channel', () {
      expect(
        CodeEntryStrategy.from(CodeChannel.email),
        isA<EmailCodeEntryStrategy>(),
      );
      expect(
        CodeEntryStrategy.from(CodeChannel.telegram),
        isA<TelegramCodeEntryStrategy>(),
      );
    });

    test('email keeps the default: resend only after the timer', () {
      final strategy = CodeEntryStrategy.from(CodeChannel.email);

      expect(strategy.subtitle, contains('a***@example.com'));
      expect(strategy.subtitle, isNot(contains('anna')));
      expect(strategy.actionLabel(30), 'Send again in 30s');
      expect(strategy.isActionEnabled(30), isFalse);
      expect(strategy.actionLabel(0), 'Send again');
      expect(strategy.isActionEnabled(0), isTrue);
    });

    test('each channel cleans typed text its own way', () {
      final email = CodeEntryStrategy.from(CodeChannel.email);
      final sms = CodeEntryStrategy.from(CodeChannel.sms);
      final telegram = CodeEntryStrategy.from(CodeChannel.telegram);

      expect(email.cleanUp('12a3 456789'), '123456');
      expect(sms.cleanUp('12a3 456789'), '1234');
      expect(telegram.cleanUp('ab-12cd9'), 'AB12C');
    });

    test('each channel knows when the code is complete', () {
      final email = CodeEntryStrategy.from(CodeChannel.email);
      final sms = CodeEntryStrategy.from(CodeChannel.sms);
      final telegram = CodeEntryStrategy.from(CodeChannel.telegram);

      expect(email.isComplete('123456'), isTrue);
      expect(email.isComplete('1234'), isFalse);
      expect(sms.isComplete('1234'), isTrue);
      expect(telegram.isComplete('AB12C'), isTrue);
    });

    test('each channel masks its own address', () {
      expect(
        CodeEntryStrategy.from(CodeChannel.email).maskedContact,
        'a***@example.com',
      );
      expect(CodeEntryStrategy.from(CodeChannel.sms).maskedContact, '*** 0123');
      expect(
        CodeEntryStrategy.from(CodeChannel.telegram).maskedContact,
        '@playbook_bot',
      );
    });

    test('telegram overrides the default and never waits', () {
      final strategy = CodeEntryStrategy.from(CodeChannel.telegram);

      expect(strategy.actionLabel(30), 'Open the Telegram bot');
      expect(strategy.isActionEnabled(30), isTrue);
    });
  });

  group('screen', () {
    testWidgets('typing is cleaned by the channel, and resets on switch', (
      tester,
    ) async {
      await tester.pumpApp(const CodeEntryScreen());

      await tester.enterText(find.byType(TextField), 'abc123456789');
      await tester.pump();

      expect(find.text('123456'), findsOneWidget);

      await tester.tap(find.text('Telegram'));
      await tester.pumpAndSettle();

      expect(find.text('123456'), findsNothing);

      await tester.enterText(find.byType(TextField), 'ab-12cd9');
      await tester.pump();

      expect(find.text('AB12C'), findsOneWidget);
    });

    testWidgets('email waits for the timer, telegram does not', (tester) async {
      await tester.pumpApp(const CodeEntryScreen());

      expect(find.text('Send again in 30s'), findsOneWidget);

      await tester.tap(find.byType(Switch));
      await tester.pumpAndSettle();

      expect(find.text('Send again'), findsOneWidget);

      await tester.tap(find.text('Telegram'));
      await tester.pumpAndSettle();

      expect(find.text('Open the Telegram bot'), findsOneWidget);
      expect(find.textContaining('@playbook_bot'), findsOneWidget);
    });
  });
}
