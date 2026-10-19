import 'package:playbook_polymorphism/features/template_method/ui/model/receipt_row_ui_model.dart';
import 'package:playbook_polymorphism/features/template_method/ui/model/receipt_ui_model.dart';

/// A utility bill. No fee, and its own closing line.
class UtilityReceiptUiModel extends ReceiptUiModel {
  const UtilityReceiptUiModel({
    required super.amountCents,
    required this.provider,
    required this.accountNumber,
  });

  final String provider;
  final String accountNumber;

  @override
  String get title => 'Utility payment';

  @override
  List<ReceiptRowUiModel> get details => [
    ReceiptRowUiModel('Provider', provider),
    ReceiptRowUiModel('Account', accountNumber),
  ];

  @override
  String get footer => 'The provider gets the payment within one business day.';
}
