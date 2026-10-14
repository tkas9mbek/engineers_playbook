part of 'transfer_operation_bloc.dart';

sealed class TransferOperationEvent {
  const TransferOperationEvent();

  const factory TransferOperationEvent.submitted(int amount) =
      SubmittedTransferOperationEvent;
}

final class SubmittedTransferOperationEvent extends TransferOperationEvent {
  const SubmittedTransferOperationEvent(this.amount);

  final int amount;
}

sealed class TransferOperationState extends Equatable {
  const TransferOperationState();

  const factory TransferOperationState.initial() =
      InitialTransferOperationState;
  const factory TransferOperationState.submitting() =
      SubmittingTransferOperationState;
  const factory TransferOperationState.success(int amount) =
      SuccessTransferOperationState;
  const factory TransferOperationState.failure(AppException exception) =
      FailureTransferOperationState;

  bool get isSubmitting => this is SubmittingTransferOperationState;

  @override
  List<Object?> get props => const [];
}

final class InitialTransferOperationState extends TransferOperationState {
  const InitialTransferOperationState();
}

final class SubmittingTransferOperationState extends TransferOperationState {
  const SubmittingTransferOperationState();
}

final class SuccessTransferOperationState extends TransferOperationState {
  const SuccessTransferOperationState(this.amount);

  final int amount;

  @override
  List<Object?> get props => [amount];
}

final class FailureTransferOperationState extends TransferOperationState {
  const FailureTransferOperationState(this.exception);

  final AppException exception;

  @override
  List<Object?> get props => [exception];
}
