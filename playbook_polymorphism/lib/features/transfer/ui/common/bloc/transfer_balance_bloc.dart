import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playbook_polymorphism/features/transfer/domain/transfer_repository.dart';
import 'package:playbook_toolkit/data/exceptions/app_exception.dart';

part 'transfer_balance_state_event.dart';

class TransferBalanceBloc
    extends Bloc<TransferBalanceEvent, TransferBalanceState> {
  TransferBalanceBloc(this._repository)
    : super(const TransferBalanceState.initial()) {
    on<RequestedTransferBalanceEvent>(_onRequested);
  }

  final TransferRepository _repository;

  Future<void> _onRequested(
    RequestedTransferBalanceEvent event,
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
