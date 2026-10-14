part of 'product_list_bloc.dart';

sealed class ProductListEvent {
  const ProductListEvent();

  const factory ProductListEvent.requested() = RequestedProductListEvent;
}

final class RequestedProductListEvent extends ProductListEvent {
  const RequestedProductListEvent();
}

sealed class ProductListState extends Equatable {
  const ProductListState();

  const factory ProductListState.initial() = InitialProductListState;
  const factory ProductListState.loading() = LoadingProductListState;
  const factory ProductListState.success(List<Product> products) =
      SuccessProductListState;
  const factory ProductListState.failure(AppException exception) =
      FailureProductListState;

  bool get isLoading => this is LoadingProductListState;

  @override
  List<Object?> get props => const [];
}

final class InitialProductListState extends ProductListState {
  const InitialProductListState();
}

final class LoadingProductListState extends ProductListState {
  const LoadingProductListState();
}

final class SuccessProductListState extends ProductListState {
  const SuccessProductListState(this.products);

  final List<Product> products;

  @override
  List<Object?> get props => [products];
}

final class FailureProductListState extends ProductListState {
  const FailureProductListState(this.exception);

  final AppException exception;

  @override
  List<Object?> get props => [exception];
}
