import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:playbook_polymorphism/features/transfer/domain/transfer_repository.dart';
import 'package:playbook_toolkit/data/exceptions/app_exception.dart';

part 'transfer_balance_bloc.freezed.dart';

@freezed
sealed class TransferBalanceEvent with _$TransferBalanceEvent {
  const factory TransferBalanceEvent.requested() =
      _RequestedTransferBalanceEvent;
}

@freezed
sealed class TransferBalanceState with _$TransferBalanceState {
  const TransferBalanceState._();

  const factory TransferBalanceState.initial() = InitialTransferBalanceState;
  const factory TransferBalanceState.loading() = LoadingTransferBalanceState;
  const factory TransferBalanceState.success(int balance) =
      SuccessTransferBalanceState;
  const factory TransferBalanceState.failure(AppException exception) =
      FailureTransferBalanceState;

  bool get isLoading => this is LoadingTransferBalanceState;
}

class TransferBalanceBloc
    extends Bloc<TransferBalanceEvent, TransferBalanceState> {
  TransferBalanceBloc(this._repository)
    : super(const TransferBalanceState.initial()) {
    on<_RequestedTransferBalanceEvent>(_onRequested);
  }

  final TransferRepository _repository;

  Future<void> _onRequested(
    _RequestedTransferBalanceEvent event,
    Emitter<TransferBalanceState> emit,
  ) async {
    emit(const TransferBalanceState.loading());

    try {
      final balance = await _repository.getBalance();

      return emit(TransferBalanceState.success(balance));
    } on AppException catch (e) {
      return emit(TransferBalanceState.failure(e));
    }
  }
}
