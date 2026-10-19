import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playbook_polymorphism/features/decorator/domain/rate_call_log.dart';
import 'package:playbook_polymorphism/features/decorator/domain/rate_repository.dart';
import 'package:playbook_toolkit/data/exceptions/app_exception.dart';

part 'rate_details_state_event.dart';

class RateDetailsBloc extends Bloc<RateDetailsEvent, RateDetailsState> {
  RateDetailsBloc(this._repository, this._log)
    : super(const RateDetailsState.initial()) {
    on<RequestedRateDetailsEvent>(_onRequested, transformer: droppable());
  }

  final RateRepository _repository;
  final RateCallLog _log;

  Future<void> _onRequested(
    RequestedRateDetailsEvent event,
    Emitter<RateDetailsState> emit,
  ) async {
    emit(const RateDetailsState.loading());
    _log.clear();

    try {
      final rate = await _repository.getRate();

      return emit(RateDetailsState.success(rate, _log.entries));
    } on AppException catch (e) {
      return emit(RateDetailsState.failure(e, _log.entries));
    }
  }
}
