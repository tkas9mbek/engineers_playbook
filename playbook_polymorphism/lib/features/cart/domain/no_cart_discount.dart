import 'package:playbook_polymorphism/features/cart/domain/cart_discount.dart';

/// The null object: a discount that takes nothing off. Use it instead of a
/// `CartDiscount?` so no one has to write `discount?.apply(total) ?? total`.
class NoCartDiscount implements CartDiscount {
  const NoCartDiscount();

  @override
  String get label => 'No promo code';

  @override
  int apply(int subtotal) => subtotal;
}
