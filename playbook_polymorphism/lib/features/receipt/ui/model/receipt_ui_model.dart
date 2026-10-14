import 'package:playbook_polymorphism/features/receipt/ui/model/receipt_row_ui_model.dart';

/// A receipt as the user reads it.
///
/// The order of the rows is fixed in [buildRows], the template method. A
/// subclass fills in the steps ([details], and optionally [fee] and
/// [footer]) and never touches the order.
abstract class ReceiptUiModel {
  const ReceiptUiModel({required this.amount});

  final int amount;

  String get title;

  /// Step one: the rows that belong to this kind of receipt only.
  List<ReceiptRowUiModel> get details;

  /// Step two, optional: most receipts have no fee.
  int get fee => 0;

  /// Step three, optional: the closing line.
  String get footer => 'Keep this receipt for your records.';

  List<ReceiptRowUiModel> buildRows() => [
    ...details,
    ReceiptRowUiModel('Amount', '\$$amount'),
    if (fee > 0) ReceiptRowUiModel('Fee', '\$$fee'),
    ReceiptRowUiModel('Total', '\$${amount + fee}'),
  ];
}
