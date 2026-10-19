import 'package:flutter_test/flutter_test.dart';
import 'package:playbook_polymorphism/features/factory/data/mock_product_data_source.dart';
import 'package:playbook_polymorphism/features/factory/domain/product_repository.dart';
import 'package:playbook_polymorphism/features/factory/ui/common/bloc/product_list_bloc.dart';
import 'package:playbook_toolkit/data/mock/mock_network_behavior.dart';
import 'package:playbook_toolkit/data/repository_executor/raw_repository_executor.dart';
import 'package:playbook_toolkit/data/repository_executor/repository_executor_extensions.dart';

void main() {
  test(
    'ProductListBloc goes loading, then success with the products',
    () async {
      final bloc = ProductListBloc(
        ProductRepository(
          const RawRepositoryExecutor().withErrorHandling(),
          const MockProductDataSource(MockNetworkBehavior.instant()),
        ),
      );

      bloc.add(const ProductListEvent.requested());

      await expectLater(
        bloc.stream,
        emitsInOrder([
          const ProductListState.loading(),
          isA<SuccessProductListState>().having(
            (state) => state.products,
            'products',
            hasLength(5),
          ),
        ]),
      );
    },
  );

  test('ProductListBloc ends in failure when the backend fails', () async {
    final bloc = ProductListBloc(
      ProductRepository(
        const RawRepositoryExecutor().withErrorHandling(),
        const MockProductDataSource(
          MockNetworkBehavior(wait: Duration.zero, failureRate: 1),
        ),
      ),
    )..add(const ProductListEvent.requested());

    await expectLater(
      bloc.stream,
      emitsInOrder([
        const ProductListState.loading(),
        isA<FailureProductListState>(),
      ]),
    );
  });
}
