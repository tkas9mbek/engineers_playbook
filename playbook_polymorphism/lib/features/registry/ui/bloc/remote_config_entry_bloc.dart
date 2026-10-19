import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playbook_polymorphism/features/registry/domain/remote_config_repository.dart';
import 'package:playbook_polymorphism/features/registry/model/remote_config_entry.dart';
import 'package:playbook_toolkit/data/exceptions/app_exception.dart';

part 'remote_config_entry_state_event.dart';

class RemoteConfigEntryBloc<T extends RemoteConfigEntry>
    extends Bloc<RemoteConfigEntryEvent, RemoteConfigEntryState<T>> {
  RemoteConfigEntryBloc(this._repository)
    : super(RemoteConfigEntryState<T>.initial()) {
    on<RequestedRemoteConfigEntryEvent>(_onRequested, transformer: droppable());
  }

  final RemoteConfigRepository _repository;

  Future<void> _onRequested(
    RequestedRemoteConfigEntryEvent event,
    Emitter<RemoteConfigEntryState<T>> emit,
  ) async {
    emit(RemoteConfigEntryState<T>.loading());

    try {
      final config = await _repository.get<T>();

      return emit(RemoteConfigEntryState<T>.success(config));
    } on AppException catch (e) {
      return emit(RemoteConfigEntryState<T>.failure(e));
    }
  }
}
