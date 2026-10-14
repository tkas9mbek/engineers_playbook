import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:playbook_polymorphism/features/rate/domain/rate_call_log.dart';
import 'package:playbook_polymorphism/features/rate/domain/rate_repository.dart';
import 'package:playbook_toolkit/data/exceptions/app_exception.dart';

part 'rate_details_bloc.freezed.dart';

@freezed
sealed class RateDetailsEvent with _$RateDetailsEvent {
  const factory RateDetailsEvent.requested() = _RequestedRateDetailsEvent;
}

@freezed
sealed class RateDetailsState with _$RateDetailsState {
  const RateDetailsState._();

  const factory RateDetailsState.initial() = InitialRateDetailsState;
  const factory RateDetailsState.loading() = LoadingRateDetailsState;

  /// [calls] is what the logging decorator saw while the rate was loaded.
  const factory RateDetailsState.success(double rate, List<String> calls) =
      SuccessRateDetailsState;
  const factory RateDetailsState.failure(
    AppException exception,
    List<String> calls,
  ) = FailureRateDetailsState;

  bool get isLoading => this is LoadingRateDetailsState;
}

class RateDetailsBloc extends Bloc<RateDetailsEvent, RateDetailsState> {
  RateDetailsBloc(this._repository, this._log)
    : super(const RateDetailsState.initial()) {
    on<_RequestedRateDetailsEvent>(_onRequested);
  }

  final RateRepository _repository;
  final RateCallLog _log;

  Future<void> _onRequested(
    _RequestedRateDetailsEvent event,
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
