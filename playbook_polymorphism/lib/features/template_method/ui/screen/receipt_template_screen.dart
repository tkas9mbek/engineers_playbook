import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:playbook_polymorphism/features/template_method/ui/model/transfer_receipt_ui_model.dart';
import 'package:playbook_polymorphism/features/template_method/ui/model/utility_receipt_ui_model.dart';
import 'package:playbook_polymorphism/features/template_method/ui/widget/receipt_panel.dart';
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
          'ReceiptUiModel.buildRows. The top rows come from each subclass. '
          'Amount and Total, and Fee when there is one, always come from the '
          'base class.',
      demo: Column(
        spacing: 24,
        children: [
          ReceiptPanel(
            model: TransferReceiptUiModel(
              amountCents: 25000,
              recipient: 'Aigul K.',
            ),
          ),
          ReceiptPanel(
            model: UtilityReceiptUiModel(
              amountCents: 4800,
              provider: 'City Water',
              accountNumber: '00718254',
            ),
          ),
        ],
      ),
      whenToUse:
          'Several classes do the same steps in the same order and differ in '
          'a few of them. Fix the order once in the base class, so a '
          'subclass has no way to get it wrong (and the analyzer warns if '
          'it tries to change it).',
      whenToSkip:
          'Subclasses override almost every step, or the order itself '
          'changes from case to case. Then there is nothing to protect. '
          'Use separate classes, or a strategy.',
      tryThis:
          'write a CardReceiptUiModel with a 1% fee. Count the methods you '
          'had to override.',
    );
  }
}
