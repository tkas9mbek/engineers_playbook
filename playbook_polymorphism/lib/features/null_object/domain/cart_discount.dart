/// What a cart does with a promo code. The cart always has one, even when the
/// user typed no code: see [NoCartDiscount].
abstract class CartDiscount {
  /// The words the summary shows. Kept in `domain/` to keep this demo small;
  /// a bigger app would word it in `ui/`.
  String get label;

  /// The price to pay, in cents, for a cart worth [subtotalCents].
  int apply(int subtotalCents);
}
