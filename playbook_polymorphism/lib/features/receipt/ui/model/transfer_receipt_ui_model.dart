import 'package:playbook_polymorphism/features/receipt/ui/model/receipt_row_ui_model.dart';
import 'package:playbook_polymorphism/features/receipt/ui/model/receipt_ui_model.dart';

/// Money sent to a person. It charges a fee.
class TransferReceiptUiModel extends ReceiptUiModel {
  const TransferReceiptUiModel({
    required super.amount,
    required this.recipient,
  });

  final String recipient;

  @override
  String get title => 'Money transfer';

  @override
  List<ReceiptRowUiModel> get details => [
    ReceiptRowUiModel('To', recipient),
    const ReceiptRowUiModel('Via', 'Instant transfer'),
  ];

  @override
  int get fee => 2;
}
