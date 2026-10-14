import 'package:playbook_polymorphism/features/transfer/ui/common/model/transfer_action_ui_model.dart';

/// Everything about the transfers screen that depends on who is using it.
///
/// The view holds one of these and never asks which kind it got. To support a
/// new audience, add a subclass; the view does not change.
abstract class TransferStrategy {
  const TransferStrategy();

  String get title;

  String get subtitle;

  List<TransferActionUiModel> get actions;

  /// The most money that can be sent in one day.
  int get dailyLimit;

  /// Shown when an amount is above [dailyLimit].
  String get limitExceededMessage;

  /// The fee charged for sending [amount].
  int feeFor(int amount);

  /// The text shown after a successful send.
  String confirmationMessage(int amount);

  /// The message shown when [amount] cannot be sent, or null when it can.
  String? validate(int amount) =>
      amount > dailyLimit ? limitExceededMessage : null;
}
