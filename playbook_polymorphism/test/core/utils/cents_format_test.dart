import 'package:flutter_test/flutter_test.dart';
import 'package:playbook_polymorphism/core/utils/cents_format.dart';

void main() {
  test('toDollars always shows two digits of cents', () {
    expect(125040.toDollars(), '1250.40');
    expect(5.toDollars(), '0.05');
    expect(0.toDollars(), '0.00');
    expect((-1050).toDollars(), '-10.50');
  });

  test('toWholeDollars drops the cents', () {
    expect(200000.toWholeDollars(), '2000');
    expect(199.toWholeDollars(), '1');
  });
}
