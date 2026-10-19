/// One line of a receipt: a label and its value. Plain values, so the widget
/// can draw a row without knowing which receipt it belongs to.
class ReceiptRowUiModel {
  const ReceiptRowUiModel(this.label, this.value);

  final String label;
  final String value;
}
