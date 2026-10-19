/// How the customer gets the order. The three options of the checkout.
///
/// [label] is the title of the demo switcher. The strategy version uses the
/// enum only to pick a strategy once. The conditional version switches on it
/// in `DeliveryConditionalRules`.
enum DeliveryMethod {
  standard('Standard'),
  express('Express'),
  pickup('Pickup');

  const DeliveryMethod(this.label);

  final String label;
}
