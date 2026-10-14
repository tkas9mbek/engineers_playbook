part of 'remote_config_entry_bloc.dart';

sealed class RemoteConfigEntryEvent {
  const RemoteConfigEntryEvent();

  const factory RemoteConfigEntryEvent.requested() =
      RequestedRemoteConfigEntryEvent;
}

final class RequestedRemoteConfigEntryEvent extends RemoteConfigEntryEvent {
  const RequestedRemoteConfigEntryEvent();
}

sealed class RemoteConfigEntryState<T extends RemoteConfigEntry>
    extends Equatable {
  const RemoteConfigEntryState();

  const factory RemoteConfigEntryState.initial() =
      InitialRemoteConfigEntryState<T>;
  const factory RemoteConfigEntryState.loading() =
      LoadingRemoteConfigEntryState<T>;
  const factory RemoteConfigEntryState.success(T config) =
      SuccessRemoteConfigEntryState<T>;
  const factory RemoteConfigEntryState.failure(AppException exception) =
      FailureRemoteConfigEntryState<T>;

  @override
  List<Object?> get props => const [];
}

final class InitialRemoteConfigEntryState<T extends RemoteConfigEntry>
    extends RemoteConfigEntryState<T> {
  const InitialRemoteConfigEntryState();
}

final class LoadingRemoteConfigEntryState<T extends RemoteConfigEntry>
    extends RemoteConfigEntryState<T> {
  const LoadingRemoteConfigEntryState();
}

final class SuccessRemoteConfigEntryState<T extends RemoteConfigEntry>
    extends RemoteConfigEntryState<T> {
  const SuccessRemoteConfigEntryState(this.config);

  final T config;

  @override
  List<Object?> get props => [config];
}

final class FailureRemoteConfigEntryState<T extends RemoteConfigEntry>
    extends RemoteConfigEntryState<T> {
  const FailureRemoteConfigEntryState(this.exception);

  final AppException exception;

  @override
  List<Object?> get props => [exception];
}
