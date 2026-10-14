import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:playbook_polymorphism/features/transfer/domain/transfer_repository.dart';
import 'package:playbook_toolkit/data/exceptions/app_exception.dart';

part 'transfer_operation_bloc.freezed.dart';

@freezed
sealed class TransferOperationEvent with _$TransferOperationEvent {
  const factory TransferOperationEvent.submitted(int amount) =
      _SubmittedTransferOperationEvent;
}

@freezed
sealed class TransferOperationState with _$TransferOperationState {
  const TransferOperationState._();

  const factory TransferOperationState.initial() =
      InitialTransferOperationState;
  const factory TransferOperationState.submitting() =
      SubmittingTransferOperationState;
  const factory TransferOperationState.success(int amount) =
      SuccessTransferOperationState;
  const factory TransferOperationState.failure(AppException exception) =
      FailureTransferOperationState;

  bool get isSubmitting => this is SubmittingTransferOperationState;
}

class TransferOperationBloc
    extends Bloc<TransferOperationEvent, TransferOperationState> {
  TransferOperationBloc(this._repository)
    : super(const TransferOperationState.initial()) {
    on<_SubmittedTransferOperationEvent>(_onSubmitted);
  }

  final TransferRepository _repository;

  Future<void> _onSubmitted(
    _SubmittedTransferOperationEvent event,
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
