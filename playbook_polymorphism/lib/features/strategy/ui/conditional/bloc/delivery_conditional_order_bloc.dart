import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playbook_polymorphism/features/strategy/domain/delivery_conditional_rules.dart';
import 'package:playbook_polymorphism/features/strategy/domain/delivery_repository.dart';
import 'package:playbook_polymorphism/features/strategy/ui/common/bloc/delivery_order_state_event.dart';
import 'package:playbook_polymorphism/features/strategy/ui/conditional/bloc/delivery_conditional_order_event.dart';
import 'package:playbook_toolkit/data/exceptions/app_exception.dart';

/// Places an order with conditionals: the event carries the delivery method,
/// and the rules live in `DeliveryConditionalRules`.
class DeliveryConditionalOrderBloc
    extends Bloc<DeliveryConditionalOrderEvent, DeliveryOrderState> {
  DeliveryConditionalOrderBloc(this._repository)
    : super(const DeliveryOrderState.initial()) {
    on<SubmittedDeliveryConditionalOrderEvent>(
      _onSubmitted,
      transformer: droppable(),
    );
  }

  final DeliveryRepository _repository;

  Future<void> _onSubmitted(
    SubmittedDeliveryConditionalOrderEvent event,
    Emitter<DeliveryOrderState> emit,
  ) async {
    emit(const DeliveryOrderState.submitting());

    try {
      await event.method.place(_repository, event.subtotalCents);

      return emit(DeliveryOrderState.success(event.subtotalCents));
    } on AppException catch (e) {
      return emit(DeliveryOrderState.failure(e));
    }
  }
}
