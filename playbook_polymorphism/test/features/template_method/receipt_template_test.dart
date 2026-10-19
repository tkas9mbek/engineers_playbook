import 'package:flutter_test/flutter_test.dart';
import 'package:playbook_polymorphism/features/template_method/ui/model/receipt_row_ui_model.dart';
import 'package:playbook_polymorphism/features/template_method/ui/model/transfer_receipt_ui_model.dart';
import 'package:playbook_polymorphism/features/template_method/ui/model/utility_receipt_ui_model.dart';
import 'package:playbook_polymorphism/features/template_method/ui/screen/receipt_template_screen.dart';

import '../../support/pump_app.dart';

void main() {
  const transfer = TransferReceiptUiModel(
    amountCents: 25000,
    recipient: 'Aigul K.',
  );
  const utility = UtilityReceiptUiModel(
    amountCents: 4800,
    provider: 'City Water',
    accountNumber: '00718254',
  );

  List<String> labels(List<ReceiptRowUiModel> rows) =>
      rows.map((row) => row.label).toList();

  test('a receipt with a fee has a Fee row before the total', () {
    expect(labels(transfer.buildRows()), [
      'To',
      'Via',
      'Amount',
      'Fee',
      'Total',
    ]);
    expect(transfer.buildRows().last.value, r'$252.00');
  });

  test('a receipt without a fee skips the Fee row', () {
    expect(labels(utility.buildRows()), [
      'Provider',
      'Account',
      'Amount',
      'Total',
    ]);
    expect(utility.buildRows().last.value, r'$48.00');
  });

  test('footer is a default that a subclass can override', () {
    expect(transfer.footer, 'Keep this receipt for your records.');
    expect(utility.footer, contains('one business day'));
  });

  testWidgets('screen shows both receipts', (tester) async {
    await tester.pumpApp(const ReceiptTemplateScreen());

    expect(find.text('Template method'), findsOneWidget);
    expect(find.text('Money transfer'), findsOneWidget);
    expect(find.text('Utility payment'), findsOneWidget);
    expect(find.text('Total'), findsNWidgets(2));
    expect(find.text('Fee'), findsOneWidget);
  });
}
