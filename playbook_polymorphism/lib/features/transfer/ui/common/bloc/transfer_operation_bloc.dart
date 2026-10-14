import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playbook_polymorphism/features/transfer/domain/transfer_repository.dart';
import 'package:playbook_toolkit/data/exceptions/app_exception.dart';

part 'transfer_operation_state_event.dart';

class TransferOperationBloc
    extends Bloc<TransferOperationEvent, TransferOperationState> {
  TransferOperationBloc(this._repository)
    : super(const TransferOperationState.initial()) {
    on<SubmittedTransferOperationEvent>(_onSubmitted);
  }

  final TransferRepository _repository;

  Future<void> _onSubmitted(
    SubmittedTransferOperationEvent event,
    Emitter<TransferOperationState> emit,
  ) async {
    emit(const TransferOperationState.submitting());

    try {
      await _repository.sendMoney(event.amount);

      return emit(TransferOperationState.success(event.amount));
    } on AppException catch (e) {
      return emit(TransferOperationState.failure(e));
    }
  }
}
