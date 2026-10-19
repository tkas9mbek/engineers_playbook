import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playbook_polymorphism/features/prod_product_actions/domain/product_action_strategy.dart';
import 'package:playbook_polymorphism/features/prod_product_actions/ui/bloc/product_action_state_event.dart';
import 'package:playbook_toolkit/data/exceptions/app_exception.dart';

/// Runs the action of one product through the strategy it was given. It does
/// not know if the product is a card, a deposit or a credit line.
class ProductActionBloc extends Bloc<ProductActionEvent, ProductActionState> {
  ProductActionBloc(this._strategy)
    : super(const ProductActionState.initial()) {
    on<PerformedProductActionEvent>(_onPerformed, transformer: droppable());
  }

  final ProductActionStrategy _strategy;

  Future<void> _onPerformed(
    PerformedProductActionEvent event,
    Emitter<ProductActionState> emit,
  ) async {
    emit(const ProductActionState.performing());

    try {
      final message = await _strategy.perform();

      return emit(ProductActionState.success(message));
    } on AppException catch (e) {
      return emit(ProductActionState.failure(e));
    }
  }
}
