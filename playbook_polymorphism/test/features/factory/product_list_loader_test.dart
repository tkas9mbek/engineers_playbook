import 'package:flutter_test/flutter_test.dart';
import 'package:playbook_polymorphism/core/global/global_variables.dart';
import 'package:playbook_polymorphism/features/factory/data/mock_product_data_source.dart';
import 'package:playbook_polymorphism/features/factory/domain/product_data_source.dart';
import 'package:playbook_polymorphism/features/factory/domain/product_repository.dart';
import 'package:playbook_polymorphism/features/factory/model/product.dart';
import 'package:playbook_polymorphism/features/factory/ui/common/bloc/product_list_bloc.dart';
import 'package:playbook_polymorphism/features/factory/ui/conditional/screen/product_conditional_screen.dart';
import 'package:playbook_polymorphism/features/factory/ui/factory/screen/product_factory_screen.dart';
import 'package:playbook_toolkit/data/exceptions/app_exception.dart';
import 'package:playbook_toolkit/data/mock/mock_network_behavior.dart';
import 'package:playbook_toolkit/data/repository_executor/raw_repository_executor.dart';
import 'package:playbook_toolkit/data/repository_executor/repository_executor_extensions.dart';

import '../../support/pump_app.dart';

/// Fails the first call, then works.
class _FlakyProductDataSource implements ProductDataSource {
  final _inner = const MockProductDataSource(MockNetworkBehavior.instant());

  bool _failed = false;

  @override
  Future<List<Product>> getProducts() async {
    if (!_failed) {
      _failed = true;

      throw const ServerException(
        statusCode: 503,
        message: 'Products are down',
      );
    }

    return _inner.getProducts();
  }
}

void main() {
  setUp(() {
    final repository = ProductRepository(
      const RawRepositoryExecutor().withErrorHandling(),
      _FlakyProductDataSource(),
    );

    getIt.registerFactory(() => ProductListBloc(repository));
  });

  tearDown(getIt.reset);

  for (final (name, screen) in [
    ('factory', const ProductFactoryScreen()),
    ('conditional', const ProductConditionalScreen()),
  ]) {
    testWidgets('the $name screen shows the failure, and retry loads', (
      tester,
    ) async {
      await tester.pumpApp(screen);

      expect(find.text('Products are down'), findsOneWidget);
      expect(find.text('Visa Classic'), findsNothing);

      await tester.tap(find.text('Retry'));
      await tester.pumpAndSettle();

      expect(find.text('Products are down'), findsNothing);
      expect(find.text('Visa Classic'), findsOneWidget);
    });
  }
}
