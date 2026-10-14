/// What a cart does with a promo code. The cart always has one, even when the
/// user typed no code: see [NoCartDiscount].
abstract class CartDiscount {
  String get label;

  /// The price to pay for a cart worth [subtotal].
  int apply(int subtotal);
}
