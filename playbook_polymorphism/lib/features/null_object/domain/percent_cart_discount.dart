import 'package:playbook_polymorphism/features/null_object/domain/cart_discount.dart';

/// A real discount: takes [percent] off, rounded down to a whole cent.
class PercentCartDiscount implements CartDiscount {
  const PercentCartDiscount({required this.code, required this.percent});

  final String code;
  final int percent;

  @override
  String get label => '$code: $percent% off';

  @override
  int apply(int subtotalCents) =>
      subtotalCents - subtotalCents * percent ~/ 100;
}
