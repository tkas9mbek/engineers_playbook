import 'package:flutter/material.dart';
import 'package:playbook_polymorphism/features/transfer/ui/common/model/transfer_action_ui_model.dart';
import 'package:playbook_polymorphism/features/transfer/ui/strategy/model/transfer_strategy.dart';

/// Transfers for adults: more ways to send, higher limit, 1% fee.
class StandardTransferStrategy extends TransferStrategy {
  const StandardTransferStrategy();

  @override
  String get title => 'Transfers';

  @override
  String get subtitle => 'Send money to anyone';

  @override
  List<TransferActionUiModel> get actions => const [
    TransferActionUiModel(
      title: 'To a phone number',
      icon: Icons.phone_outlined,
    ),
    TransferActionUiModel(title: 'To a card', icon: Icons.credit_card_outlined),
    TransferActionUiModel(title: 'By QR code', icon: Icons.qr_code_2),
    TransferActionUiModel(title: 'Abroad (SWIFT)', icon: Icons.public),
  ];

  @override
  int get dailyLimit => 1000;

  @override
  String get limitExceededMessage => r'The daily limit is $1000';

  @override
  int feeFor(int amount) => (amount * 0.01).round();

  @override
  String confirmationMessage(int amount) =>
      'Sent \$$amount. Fee \$${feeFor(amount)}.';
}
