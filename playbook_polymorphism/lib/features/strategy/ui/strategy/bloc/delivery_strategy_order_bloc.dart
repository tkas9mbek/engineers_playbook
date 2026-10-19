import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playbook_polymorphism/features/strategy/domain/delivery_strategy.dart';
import 'package:playbook_polymorphism/features/strategy/ui/common/bloc/delivery_order_state_event.dart';
import 'package:playbook_toolkit/data/exceptions/app_exception.dart';

/// Places an order through the strategy it was given. It does not know if the
/// delivery is standard, express or pickup, and it has no `if` that asks.
class DeliveryStrategyOrderBloc
    extends Bloc<DeliveryOrderEvent, DeliveryOrderState> {
  DeliveryStrategyOrderBloc(this._strategy)
    : super(const DeliveryOrderState.initial()) {
    on<SubmittedDeliveryOrderEvent>(_onSubmitted, transformer: droppable());
  }

  final DeliveryStrategy _strategy;

  Future<void> _onSubmitted(
    SubmittedDeliveryOrderEvent event,
    Emitter<DeliveryOrderState> emit,
  ) async {
    emit(const DeliveryOrderState.submitting());

    try {
      await _strategy.place(event.subtotalCents);

      return emit(DeliveryOrderState.success(event.subtotalCents));
    } on AppException catch (e) {
      return emit(DeliveryOrderState.failure(e));
    }
  }
}
