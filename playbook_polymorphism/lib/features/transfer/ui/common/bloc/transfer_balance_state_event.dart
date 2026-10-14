part of 'transfer_balance_bloc.dart';

sealed class TransferBalanceEvent {
  const TransferBalanceEvent();

  const factory TransferBalanceEvent.requested() =
      RequestedTransferBalanceEvent;
}

final class RequestedTransferBalanceEvent extends TransferBalanceEvent {
  const RequestedTransferBalanceEvent();
}

sealed class TransferBalanceState extends Equatable {
  const TransferBalanceState();

  const factory TransferBalanceState.initial() = InitialTransferBalanceState;
  const factory TransferBalanceState.loading() = LoadingTransferBalanceState;
  const factory TransferBalanceState.success(int balance) =
      SuccessTransferBalanceState;
  const factory TransferBalanceState.failure(AppException exception) =
      FailureTransferBalanceState;

  bool get isLoading => this is LoadingTransferBalanceState;

  @override
  List<Object?> get props => const [];
}

final class InitialTransferBalanceState extends TransferBalanceState {
  const InitialTransferBalanceState();
}

final class LoadingTransferBalanceState extends TransferBalanceState {
  const LoadingTransferBalanceState();
}

final class SuccessTransferBalanceState extends TransferBalanceState {
  const SuccessTransferBalanceState(this.balance);

  final int balance;

  @override
  List<Object?> get props => [balance];
}

final class FailureTransferBalanceState extends TransferBalanceState {
  const FailureTransferBalanceState(this.exception);

  final AppException exception;

  @override
  List<Object?> get props => [exception];
}
