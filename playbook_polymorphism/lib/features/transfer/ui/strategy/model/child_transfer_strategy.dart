import 'package:flutter/material.dart';
import 'package:playbook_polymorphism/features/transfer/ui/common/model/transfer_action_ui_model.dart';
import 'package:playbook_polymorphism/features/transfer/ui/strategy/model/transfer_strategy.dart';

/// Transfers for children: family only, low limit, no fee.
class ChildTransferStrategy extends TransferStrategy {
  const ChildTransferStrategy();

  @override
  String get title => 'Pocket money';

  @override
  String get subtitle => 'Send money to your family';

  @override
  List<TransferActionUiModel> get actions => const [
    TransferActionUiModel(title: 'To a parent', icon: Icons.family_restroom),
    TransferActionUiModel(
      title: "To a friend's phone",
      icon: Icons.phone_outlined,
    ),
  ];

  @override
  int get dailyLimit => 50;

  @override
  String get limitExceededMessage => r'Ask a parent to raise your $50 limit';

  @override
  int feeFor(int amount) => 0;

  @override
  String confirmationMessage(int amount) =>
      'Sent \$$amount. A parent was notified.';
}
