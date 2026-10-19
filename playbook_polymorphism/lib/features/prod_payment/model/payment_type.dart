/// The kinds of payment the screen supports. [label] is the title of the demo
/// switcher, nothing else.
enum PaymentType {
  standard('Standard'),
  qr('QR code');

  const PaymentType(this.label);

  final String label;
}
