import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playbook_polymorphism/features/prod_payment/domain/payment_strategy.dart';
import 'package:playbook_polymorphism/features/prod_payment/ui/bloc/payment_state_event.dart';
import 'package:playbook_toolkit/data/exceptions/app_exception.dart';

/// Pays through the strategy it was given. It does not know if the payment is
/// standard or a QR one.
class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc(this._strategy) : super(const PaymentState.initial()) {
    on<SubmittedPaymentEvent>(_onSubmitted, transformer: droppable());
  }

  final PaymentStrategy _strategy;

  Future<void> _onSubmitted(
    SubmittedPaymentEvent event,
    Emitter<PaymentState> emit,
  ) async {
    emit(const PaymentState.paying());

    try {
      final receipt = await _strategy.pay(event.amountCents);

      return emit(PaymentState.success(receipt));
    } on AppException catch (e) {
      return emit(PaymentState.failure(e));
    }
  }
}
