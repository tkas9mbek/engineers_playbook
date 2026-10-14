import 'package:flutter_test/flutter_test.dart';
import 'package:playbook_polymorphism/features/transfer/ui/strategy/model/child_transfer_strategy.dart';
import 'package:playbook_polymorphism/features/transfer/ui/strategy/model/standard_transfer_strategy.dart';

void main() {
  group('StandardTransferStrategy', () {
    const strategy = StandardTransferStrategy();

    test('charges a 1% fee', () {
      expect(strategy.feeFor(100), 1);
      expect(strategy.feeFor(2000), 20);
    });

    test('accepts amounts up to the limit and rejects above it', () {
      expect(strategy.validate(1000), isNull);
      expect(strategy.validate(1001), isNotNull);
    });

    test('offers four ways to send', () {
      expect(strategy.actions, hasLength(4));
    });
  });

  group('ChildTransferStrategy', () {
    const strategy = ChildTransferStrategy();

    test('is free', () {
      expect(strategy.feeFor(50), 0);
    });

    test('has a low limit', () {
      expect(strategy.validate(50), isNull);
      expect(strategy.validate(100), contains('parent'));
    });

    test('offers two ways to send', () {
      expect(strategy.actions, hasLength(2));
    });
  });
}
