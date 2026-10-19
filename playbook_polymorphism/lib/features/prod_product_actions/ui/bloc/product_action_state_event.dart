import 'package:equatable/equatable.dart';
import 'package:playbook_toolkit/data/exceptions/app_exception.dart';

sealed class ProductActionEvent {
  const ProductActionEvent();

  const factory ProductActionEvent.performed() = PerformedProductActionEvent;
}

final class PerformedProductActionEvent extends ProductActionEvent {
  const PerformedProductActionEvent();
}

sealed class ProductActionState extends Equatable {
  const ProductActionState();

  const factory ProductActionState.initial() = InitialProductActionState;
  const factory ProductActionState.performing() = PerformingProductActionState;
  const factory ProductActionState.success(String message) =
      SuccessProductActionState;
  const factory ProductActionState.failure(AppException exception) =
      FailureProductActionState;

  bool get isPerforming => this is PerformingProductActionState;

  @override
  List<Object?> get props => const [];
}

final class InitialProductActionState extends ProductActionState {
  const InitialProductActionState();
}

final class PerformingProductActionState extends ProductActionState {
  const PerformingProductActionState();
}

final class SuccessProductActionState extends ProductActionState {
  const SuccessProductActionState(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}

final class FailureProductActionState extends ProductActionState {
  const FailureProductActionState(this.exception);

  final AppException exception;

  @override
  List<Object?> get props => [exception];
}
