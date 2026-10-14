import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playbook_polymorphism/features/product/domain/product_repository.dart';
import 'package:playbook_polymorphism/features/product/model/product.dart';
import 'package:playbook_toolkit/data/exceptions/app_exception.dart';

part 'product_list_state_event.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  ProductListBloc(this._repository) : super(const ProductListState.initial()) {
    on<RequestedProductListEvent>(_onRequested);
  }

  final ProductRepository _repository;

  Future<void> _onRequested(
    RequestedProductListEvent event,
    Emitter<ProductListState> emit,
  ) async {
    emit(const ProductListState.loading());

    try {
      final products = await _repository.getProducts();

      return emit(ProductListState.success(products));
    } on AppException catch (e) {
      return emit(ProductListState.failure(e));
    }
  }
}
