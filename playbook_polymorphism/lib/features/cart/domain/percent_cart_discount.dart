import 'package:playbook_polymorphism/features/cart/domain/cart_discount.dart';

class PercentCartDiscount implements CartDiscount {
  const PercentCartDiscount({required this.code, required this.percent});

  final String code;
  final int percent;

  @override
  String get label => '$code: $percent% off';

  @override
  int apply(int subtotal) => subtotal - subtotal * percent ~/ 100;
}
