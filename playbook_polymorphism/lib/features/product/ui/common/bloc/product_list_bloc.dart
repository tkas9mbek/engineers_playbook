import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:playbook_polymorphism/features/product/domain/product_repository.dart';
import 'package:playbook_polymorphism/features/product/model/product.dart';
import 'package:playbook_toolkit/data/exceptions/app_exception.dart';

part 'product_list_bloc.freezed.dart';

@freezed
sealed class ProductListEvent with _$ProductListEvent {
  const factory ProductListEvent.requested() = _RequestedProductListEvent;
}

@freezed
sealed class ProductListState with _$ProductListState {
  const ProductListState._();

  const factory ProductListState.initial() = InitialProductListState;
  const factory ProductListState.loading() = LoadingProductListState;
  const factory ProductListState.success(List<Product> products) =
      SuccessProductListState;
  const factory ProductListState.failure(AppException exception) =
      FailureProductListState;

  bool get isLoading => this is LoadingProductListState;
}

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  ProductListBloc(this._repository) : super(const ProductListState.initial()) {
    on<_RequestedProductListEvent>(_onRequested);
  }

  final ProductRepository _repository;

  Future<void> _onRequested(
    _RequestedProductListEvent event,
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
