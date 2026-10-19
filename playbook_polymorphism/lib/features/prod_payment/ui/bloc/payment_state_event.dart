import 'package:equatable/equatable.dart';
import 'package:playbook_polymorphism/features/prod_payment/model/payment_receipt.dart';
import 'package:playbook_toolkit/data/exceptions/app_exception.dart';

sealed class PaymentEvent {
  const PaymentEvent();

  const factory PaymentEvent.submitted(int amountCents) = SubmittedPaymentEvent;
}

final class SubmittedPaymentEvent extends PaymentEvent {
  const SubmittedPaymentEvent(this.amountCents);

  final int amountCents;
}

sealed class PaymentState extends Equatable {
  const PaymentState();

  const factory PaymentState.initial() = InitialPaymentState;
  const factory PaymentState.paying() = PayingPaymentState;
  const factory PaymentState.success(PaymentReceipt receipt) =
      SuccessPaymentState;
  const factory PaymentState.failure(AppException exception) =
      FailurePaymentState;

  bool get isPaying => this is PayingPaymentState;

  @override
  List<Object?> get props => const [];
}

final class InitialPaymentState extends PaymentState {
  const InitialPaymentState();
}

final class PayingPaymentState extends PaymentState {
  const PayingPaymentState();
}

final class SuccessPaymentState extends PaymentState {
  const SuccessPaymentState(this.receipt);

  final PaymentReceipt receipt;

  @override
  List<Object?> get props => [receipt];
}

final class FailurePaymentState extends PaymentState {
  const FailurePaymentState(this.exception);

  final AppException exception;

  @override
  List<Object?> get props => [exception];
}
