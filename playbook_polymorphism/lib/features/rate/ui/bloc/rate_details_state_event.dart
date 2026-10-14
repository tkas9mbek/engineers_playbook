part of 'rate_details_bloc.dart';

sealed class RateDetailsEvent {
  const RateDetailsEvent();

  const factory RateDetailsEvent.requested() = RequestedRateDetailsEvent;
}

final class RequestedRateDetailsEvent extends RateDetailsEvent {
  const RequestedRateDetailsEvent();
}

sealed class RateDetailsState extends Equatable {
  const RateDetailsState();

  const factory RateDetailsState.initial() = InitialRateDetailsState;
  const factory RateDetailsState.loading() = LoadingRateDetailsState;
  const factory RateDetailsState.success(double rate, List<String> calls) =
      SuccessRateDetailsState;
  const factory RateDetailsState.failure(
    AppException exception,
    List<String> calls,
  ) = FailureRateDetailsState;

  bool get isLoading => this is LoadingRateDetailsState;

  @override
  List<Object?> get props => const [];
}

final class InitialRateDetailsState extends RateDetailsState {
  const InitialRateDetailsState();
}

final class LoadingRateDetailsState extends RateDetailsState {
  const LoadingRateDetailsState();
}

/// [calls] is what the logging decorator saw while the rate was loaded.
final class SuccessRateDetailsState extends RateDetailsState {
  const SuccessRateDetailsState(this.rate, this.calls);

  final double rate;
  final List<String> calls;

  @override
  List<Object?> get props => [rate, calls];
}

final class FailureRateDetailsState extends RateDetailsState {
  const FailureRateDetailsState(this.exception, this.calls);

  final AppException exception;
  final List<String> calls;

  @override
  List<Object?> get props => [exception, calls];
}
