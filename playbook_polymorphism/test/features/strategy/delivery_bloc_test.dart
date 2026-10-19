import 'package:flutter_test/flutter_test.dart';
import 'package:playbook_polymorphism/features/strategy/data/mock_delivery_data_source.dart';
import 'package:playbook_polymorphism/features/strategy/domain/delivery_repository.dart';
import 'package:playbook_polymorphism/features/strategy/domain/delivery_strategy.dart';
import 'package:playbook_polymorphism/features/strategy/domain/strategy/express_delivery_strategy.dart';
import 'package:playbook_polymorphism/features/strategy/domain/strategy/pickup_delivery_strategy.dart';
import 'package:playbook_polymorphism/features/strategy/domain/strategy/standard_delivery_strategy.dart';
import 'package:playbook_polymorphism/features/strategy/model/delivery_method.dart';
import 'package:playbook_polymorphism/features/strategy/ui/common/bloc/delivery_order_state_event.dart';
import 'package:playbook_polymorphism/features/strategy/ui/conditional/bloc/delivery_conditional_order_bloc.dart';
import 'package:playbook_polymorphism/features/strategy/ui/conditional/bloc/delivery_conditional_order_event.dart';
import 'package:playbook_polymorphism/features/strategy/ui/strategy/bloc/delivery_strategy_order_bloc.dart';
import 'package:playbook_toolkit/data/mock/mock_network_behavior.dart';
import 'package:playbook_toolkit/data/repository_executor/raw_repository_executor.dart';
import 'package:playbook_toolkit/data/repository_executor/repository_executor_extensions.dart';

import '../../support/delivery_data_source_fakes.dart';

DeliveryRepository _buildRepository() => DeliveryRepository(
  const RawRepositoryExecutor().withErrorHandling(),
  const MockDeliveryDataSource(MockNetworkBehavior.instant()),
);

DeliveryRepository _buildFailingRepository() => DeliveryRepository(
  const RawRepositoryExecutor().withErrorHandling(),
  const MockDeliveryDataSource(
    MockNetworkBehavior(wait: Duration.zero, failureRate: 1),
  ),
);

/// Holds the order open and counts how many times it was placed.
class _CountingManualDataSource extends ManualDeliveryDataSource {
  int placed = 0;

  @override
  Future<void> placeStandardOrder(int subtotalCents) {
    placed++;

    return super.placeStandardOrder(subtotalCents);
  }
}

void main() {
  group('DeliveryStrategyOrderBloc', () {
    test('ignores a second submit while the first one is running', () async {
      final backend = _CountingManualDataSource();
      final bloc = DeliveryStrategyOrderBloc(
        StandardDeliveryStrategy(
          DeliveryRepository(const RawRepositoryExecutor(), backend),
        ),
      )..add(const DeliveryOrderEvent.submitted(4000));
      await Future<void>.delayed(Duration.zero);

      bloc.add(const DeliveryOrderEvent.submitted(4000));
      await Future<void>.delayed(Duration.zero);
      backend.finish();
      await bloc.stream.firstWhere(
        (state) => state is SuccessDeliveryOrderState,
      );

      expect(backend.placed, 1);
    });

    test('goes submitting, then success', () async {
      final bloc = DeliveryStrategyOrderBloc(
        StandardDeliveryStrategy(_buildRepository()),
      )..add(const DeliveryOrderEvent.submitted(4000));

      await expectLater(
        bloc.stream,
        emitsInOrder([
          const DeliveryOrderState.submitting(),
          const DeliveryOrderState.success(4000),
        ]),
      );
    });

    test('ends in failure when the backend fails', () async {
      final bloc = DeliveryStrategyOrderBloc(
        ExpressDeliveryStrategy(_buildFailingRepository()),
      )..add(const DeliveryOrderEvent.submitted(4000));

      await expectLater(
        bloc.stream,
        emitsInOrder([
          const DeliveryOrderState.submitting(),
          isA<FailureDeliveryOrderState>(),
        ]),
      );
    });

    test('lets the strategy decide which order is placed', () async {
      final backend = RecordingDeliveryDataSource();
      final bloc = DeliveryStrategyOrderBloc(
        PickupDeliveryStrategy(
          DeliveryRepository(const RawRepositoryExecutor(), backend),
        ),
      )..add(const DeliveryOrderEvent.submitted(4000));

      await bloc.stream.firstWhere(
        (state) => state is SuccessDeliveryOrderState,
      );

      expect(backend.orders, ['pickup']);
    });
  });

  group('DeliveryConditionalOrderBloc', () {
    test('ends in failure when the backend fails', () async {
      final bloc = DeliveryConditionalOrderBloc(_buildFailingRepository())
        ..add(
          const DeliveryConditionalOrderEvent.submitted(
            subtotalCents: 4000,
            method: DeliveryMethod.express,
          ),
        );

      await expectLater(
        bloc.stream,
        emitsInOrder([
          const DeliveryOrderState.submitting(),
          isA<FailureDeliveryOrderState>(),
        ]),
      );
    });

    test('ignores a second submit while the first one is running', () async {
      final backend = _CountingManualDataSource();
      final bloc = DeliveryConditionalOrderBloc(
        DeliveryRepository(const RawRepositoryExecutor(), backend),
      );
      const event = DeliveryConditionalOrderEvent.submitted(
        subtotalCents: 4000,
        method: DeliveryMethod.standard,
      );

      bloc.add(event);
      await Future<void>.delayed(Duration.zero);
      bloc.add(event);
      await Future<void>.delayed(Duration.zero);
      backend.finish();
      await bloc.stream.firstWhere(
        (state) => state is SuccessDeliveryOrderState,
      );

      expect(backend.placed, 1);
    });

    for (final method in DeliveryMethod.values) {
      test(
        'places the order like the strategy does for ${method.label}',
        () async {
          final backend = RecordingDeliveryDataSource();
          final bloc =
              DeliveryConditionalOrderBloc(
                DeliveryRepository(const RawRepositoryExecutor(), backend),
              )..add(
                DeliveryConditionalOrderEvent.submitted(
                  subtotalCents: 4000,
                  method: method,
                ),
              );

          await bloc.stream.firstWhere(
            (state) => state is SuccessDeliveryOrderState,
          );

          final strategyBackend = RecordingDeliveryDataSource();
          final repository = DeliveryRepository(
            const RawRepositoryExecutor(),
            strategyBackend,
          );
          await DeliveryStrategy.from(method, repository).place(4000);

          expect(backend.orders, strategyBackend.orders);
        },
      );
    }
  });
}
