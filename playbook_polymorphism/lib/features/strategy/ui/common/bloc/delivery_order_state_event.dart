import 'package:equatable/equatable.dart';
import 'package:playbook_toolkit/data/exceptions/app_exception.dart';

sealed class DeliveryOrderEvent {
  const DeliveryOrderEvent();

  const factory DeliveryOrderEvent.submitted(int subtotalCents) =
      SubmittedDeliveryOrderEvent;
}

final class SubmittedDeliveryOrderEvent extends DeliveryOrderEvent {
  const SubmittedDeliveryOrderEvent(this.subtotalCents);

  final int subtotalCents;
}

sealed class DeliveryOrderState extends Equatable {
  const DeliveryOrderState();

  const factory DeliveryOrderState.initial() = InitialDeliveryOrderState;
  const factory DeliveryOrderState.submitting() = SubmittingDeliveryOrderState;
  const factory DeliveryOrderState.success(int subtotalCents) =
      SuccessDeliveryOrderState;
  const factory DeliveryOrderState.failure(AppException exception) =
      FailureDeliveryOrderState;

  bool get isSubmitting => this is SubmittingDeliveryOrderState;

  @override
  List<Object?> get props => const [];
}

final class InitialDeliveryOrderState extends DeliveryOrderState {
  const InitialDeliveryOrderState();
}

final class SubmittingDeliveryOrderState extends DeliveryOrderState {
  const SubmittingDeliveryOrderState();
}

final class SuccessDeliveryOrderState extends DeliveryOrderState {
  const SuccessDeliveryOrderState(this.subtotalCents);

  final int subtotalCents;

  @override
  List<Object?> get props => [subtotalCents];
}

final class FailureDeliveryOrderState extends DeliveryOrderState {
  const FailureDeliveryOrderState(this.exception);

  final AppException exception;

  @override
  List<Object?> get props => [exception];
}
