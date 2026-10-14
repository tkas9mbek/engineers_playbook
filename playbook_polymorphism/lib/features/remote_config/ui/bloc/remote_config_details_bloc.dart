import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:playbook_polymorphism/features/remote_config/domain/remote_config_repository.dart';
import 'package:playbook_polymorphism/features/remote_config/model/remote_limits_config.dart';
import 'package:playbook_polymorphism/features/remote_config/model/remote_maintenance_config.dart';
import 'package:playbook_polymorphism/features/remote_config/model/remote_support_config.dart';
import 'package:playbook_toolkit/data/exceptions/app_exception.dart';

part 'remote_config_details_bloc.freezed.dart';

@freezed
sealed class RemoteConfigDetailsEvent with _$RemoteConfigDetailsEvent {
  const factory RemoteConfigDetailsEvent.requested() =
      _RequestedRemoteConfigDetailsEvent;
}

@freezed
sealed class RemoteConfigDetailsState with _$RemoteConfigDetailsState {
  const factory RemoteConfigDetailsState.initial() =
      InitialRemoteConfigDetailsState;
  const factory RemoteConfigDetailsState.loading() =
      LoadingRemoteConfigDetailsState;
  const factory RemoteConfigDetailsState.success({
    required RemoteMaintenanceConfig maintenance,
    required RemoteSupportConfig support,
    required RemoteLimitsConfig limits,
  }) = SuccessRemoteConfigDetailsState;
  const factory RemoteConfigDetailsState.failure(AppException exception) =
      FailureRemoteConfigDetailsState;
}

class RemoteConfigDetailsBloc
    extends Bloc<RemoteConfigDetailsEvent, RemoteConfigDetailsState> {
  RemoteConfigDetailsBloc(this._repository)
    : super(const RemoteConfigDetailsState.initial()) {
    on<_RequestedRemoteConfigDetailsEvent>(_onRequested);
  }

  final RemoteConfigRepository _repository;

  Future<void> _onRequested(
    _RequestedRemoteConfigDetailsEvent event,
    Emitter<RemoteConfigDetailsState> emit,
  ) async {
    emit(const RemoteConfigDetailsState.loading());

    try {
      // Same call for every config: only the type argument changes.
      final maintenance = await _repository.get<RemoteMaintenanceConfig>();
      final support = await _repository.get<RemoteSupportConfig>();
      final limits = await _repository.get<RemoteLimitsConfig>();

      return emit(
        RemoteConfigDetailsState.success(
          maintenance: maintenance,
          support: support,
          limits: limits,
        ),
      );
    } on AppException catch (e) {
      return emit(RemoteConfigDetailsState.failure(e));
    }
  }
}
