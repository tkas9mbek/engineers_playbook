import 'package:flutter_test/flutter_test.dart';
import 'package:playbook_polymorphism/core/global/global_variables.dart';
import 'package:playbook_polymorphism/features/factory/data/mock_product_data_source.dart';
import 'package:playbook_polymorphism/features/factory/domain/product_repository.dart';
import 'package:playbook_polymorphism/features/factory/model/product.dart';
import 'package:playbook_polymorphism/features/factory/model/product_type.dart';
import 'package:playbook_polymorphism/features/factory/ui/common/bloc/product_list_bloc.dart';
import 'package:playbook_polymorphism/features/prod_product_actions/domain/product_action_data_source.dart';
import 'package:playbook_polymorphism/features/prod_product_actions/domain/product_action_repository.dart';
import 'package:playbook_polymorphism/features/prod_product_actions/domain/product_action_strategy.dart';
import 'package:playbook_polymorphism/features/prod_product_actions/domain/strategy/credit_product_action_strategy.dart';
import 'package:playbook_polymorphism/features/prod_product_actions/domain/strategy/debit_product_action_strategy.dart';
import 'package:playbook_polymorphism/features/prod_product_actions/domain/strategy/deposit_product_action_strategy.dart';
import 'package:playbook_polymorphism/features/prod_product_actions/domain/strategy/unknown_product_action_strategy.dart';
import 'package:playbook_polymorphism/features/prod_product_actions/ui/bloc/product_action_bloc.dart';
import 'package:playbook_polymorphism/features/prod_product_actions/ui/bloc/product_action_state_event.dart';
import 'package:playbook_polymorphism/features/prod_product_actions/ui/screen/product_actions_screen.dart';
import 'package:playbook_toolkit/data/exceptions/app_exception.dart';
import 'package:playbook_toolkit/data/mock/mock_network_behavior.dart';
import 'package:playbook_toolkit/data/repository_executor/raw_repository_executor.dart';
import 'package:playbook_toolkit/data/repository_executor/repository_executor_extensions.dart';

import '../../support/pump_app.dart';

/// Remembers which call was made, or refuses every call.
class _FakeProductActionDataSource implements ProductActionDataSource {
  _FakeProductActionDataSource({this.fail = false});

  final bool fail;
  final List<String> calls = [];

  Future<void> _call(String call) async {
    if (fail) {
      throw const ServerException(statusCode: 503, message: 'Bank is down');
    }

    calls.add(call);
  }

  @override
  Future<void> freezeCard(String productId) => _call('freeze $productId');

  @override
  Future<void> topUpDeposit(String productId, int amountCents) =>
      _call('top up $productId $amountCents');

  @override
  Future<void> repayCredit(String productId, int amountCents) =>
      _call('repay $productId $amountCents');
}

ProductActionRepository _buildRepository(ProductActionDataSource dataSource) =>
    ProductActionRepository(
      const RawRepositoryExecutor().withErrorHandling(),
      dataSource,
    );

const _card = Product(
  id: 'p1',
  name: 'Visa Classic',
  type: ProductType.debit,
  balanceCents: 125040,
);
const _deposit = Product(
  id: 'p2',
  name: 'Smart Deposit',
  type: ProductType.deposit,
  balanceCents: 500000,
);
const _credit = Product(
  id: 'p3',
  name: 'Everyday Credit',
  type: ProductType.credit,
  balanceCents: 30000,
  creditLimitCents: 200000,
);
const _unknown = Product(
  id: 'p5',
  name: 'Crypto Wallet',
  type: ProductType.unknown,
  balanceCents: 1250,
);

void main() {
  late _FakeProductActionDataSource dataSource;
  late ProductActionRepository repository;

  setUp(() {
    dataSource = _FakeProductActionDataSource();
    repository = _buildRepository(dataSource);
  });

  group('ProductActionStrategy.from', () {
    test('builds the strategy of each product type', () {
      expect(
        ProductActionStrategy.from(_card, repository),
        isA<DebitProductActionStrategy>(),
      );
      expect(
        ProductActionStrategy.from(_deposit, repository),
        isA<DepositProductActionStrategy>(),
      );
      expect(
        ProductActionStrategy.from(_credit, repository),
        isA<CreditProductActionStrategy>(),
      );
      expect(
        ProductActionStrategy.from(_unknown, repository),
        isA<UnknownProductActionStrategy>(),
      );
    });
  });

  group('strategies', () {
    test('a card freezes', () async {
      final strategy = ProductActionStrategy.from(_card, repository);

      expect(strategy.label, 'Freeze card');
      expect(await strategy.perform(), 'Visa Classic is frozen');
      expect(dataSource.calls, ['freeze p1']);
    });

    test('a deposit tops up by 100 dollars', () async {
      final strategy = ProductActionStrategy.from(_deposit, repository);

      expect(strategy.label, r'Top up $100.00');
      expect(await strategy.perform(), r'Added $100.00 to Smart Deposit');
      expect(dataSource.calls, ['top up p2 10000']);
    });

    test('a credit repays what is used', () async {
      final strategy = ProductActionStrategy.from(_credit, repository);

      expect(strategy.label, r'Repay $300.00');
      expect(await strategy.perform(), r'Repaid $300.00 on Everyday Credit');
      expect(dataSource.calls, ['repay p3 30000']);
    });

    test('an unknown product has no action and calls nothing', () {
      final strategy = ProductActionStrategy.from(_unknown, repository);

      expect(strategy.label, isNull);
      expect(dataSource.calls, isEmpty);
    });
  });

  group('ProductActionBloc', () {
    test('goes performing, then success with the message', () async {
      final bloc = ProductActionBloc(
        ProductActionStrategy.from(_card, repository),
      )..add(const ProductActionEvent.performed());

      await expectLater(
        bloc.stream,
        emitsInOrder([
          const ProductActionState.performing(),
          const ProductActionState.success('Visa Classic is frozen'),
        ]),
      );
    });

    test('ends in failure when the backend fails', () async {
      final bloc = ProductActionBloc(
        ProductActionStrategy.from(
          _card,
          _buildRepository(_FakeProductActionDataSource(fail: true)),
        ),
      )..add(const ProductActionEvent.performed());

      await expectLater(
        bloc.stream,
        emitsInOrder([
          const ProductActionState.performing(),
          isA<FailureProductActionState>(),
        ]),
      );
    });
  });

  group('screen', () {
    void register(ProductActionDataSource actionDataSource) {
      getIt
        ..registerFactory(
          () => ProductListBloc(
            ProductRepository(
              const RawRepositoryExecutor().withErrorHandling(),
              const MockProductDataSource(MockNetworkBehavior.instant()),
            ),
          ),
        )
        ..registerFactory(() => _buildRepository(actionDataSource));
    }

    tearDown(getIt.reset);

    testWidgets('each product gets the action of its own kind', (tester) async {
      register(dataSource);

      await tester.pumpApp(const ProductActionsScreen());

      expect(find.text('Freeze card'), findsNWidgets(2));
      expect(find.text(r'Top up $100.00'), findsOneWidget);
      expect(find.text(r'Repay $300.00'), findsOneWidget);
      expect(find.text('Crypto Wallet'), findsOneWidget);

      await tester.tap(find.text(r'Top up $100.00'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 400));

      expect(find.text(r'Added $100.00 to Smart Deposit'), findsOneWidget);

      await tester.pumpAndSettle(const Duration(seconds: 3));

      expect(dataSource.calls, ['top up p2 10000']);
    });

    testWidgets('a failed action shows the error', (tester) async {
      register(_FakeProductActionDataSource(fail: true));

      await tester.pumpApp(const ProductActionsScreen());
      await tester.tap(find.text(r'Repay $300.00'));
      await tester.pump(const Duration(milliseconds: 400));

      expect(find.text('Bank is down'), findsOneWidget);

      await tester.pumpAndSettle(const Duration(seconds: 3));
    });
  });
}
