import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:playbook_polymorphism/features/receipt/ui/model/transfer_receipt_ui_model.dart';
import 'package:playbook_polymorphism/features/receipt/ui/model/utility_receipt_ui_model.dart';
import 'package:playbook_polymorphism/features/receipt/ui/widget/receipt_panel.dart';
import 'package:playbook_uikit/widgets/article/pattern_layout.dart';

@RoutePage()
class ReceiptTemplateScreen extends StatelessWidget {
  const ReceiptTemplateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PatternLayout(
      title: 'Template method',
      intro:
          'The base class fixes the steps and their order. Subclasses fill '
          'in only what differs. Both receipts below come from the same '
          'ReceiptUiModel.buildRows.',
      demo: Column(
        spacing: 24,
        children: [
          ReceiptPanel(
            model: TransferReceiptUiModel(amount: 250, recipient: 'Aigul K.'),
          ),
          ReceiptPanel(
            model: UtilityReceiptUiModel(
              amount: 48,
              provider: 'City Water',
              accountNumber: '00718254',
            ),
          ),
        ],
      ),
      whenToUse:
          'Several classes do the same steps in the same order and differ in '
          'a few of them. Fix the order once in the base class, so no '
          'subclass can get it wrong.',
    );
  }
}
