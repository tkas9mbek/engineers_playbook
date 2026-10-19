import 'package:meta/meta.dart';
import 'package:playbook_polymorphism/core/utils/cents_format.dart';
import 'package:playbook_polymorphism/features/template_method/ui/model/receipt_row_ui_model.dart';

/// A receipt as the user reads it.
///
/// The order of the rows is fixed in [buildRows], the template method. It is
/// `@nonVirtual`: Dart still compiles an override, but the analyzer warns,
/// and we keep the analyzer clean. A subclass fills in the steps ([details],
/// and optionally [feeCents]) and never touches the order.
///
/// [title] and [footer] are not steps of [buildRows]. The widget reads them
/// directly; [footer] has a default that a subclass can replace.
abstract class ReceiptUiModel {
  const ReceiptUiModel({required this.amountCents});

  /// All money is in cents.
  final int amountCents;

  String get title;

  /// Step one: the rows that belong to this kind of receipt only.
  List<ReceiptRowUiModel> get details;

  /// Step two, optional: most receipts have no fee.
  int get feeCents => 0;

  /// Optional hook: the closing line under the rows.
  String get footer => 'Keep this receipt for your records.';

  @nonVirtual
  List<ReceiptRowUiModel> buildRows() => [
    ...details,
    ReceiptRowUiModel('Amount', '\$${amountCents.toDollars()}'),
    if (feeCents > 0) ReceiptRowUiModel('Fee', '\$${feeCents.toDollars()}'),
    ReceiptRowUiModel('Total', '\$${(amountCents + feeCents).toDollars()}'),
  ];
}
