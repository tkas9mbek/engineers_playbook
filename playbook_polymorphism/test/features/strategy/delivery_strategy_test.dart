import 'package:flutter_test/flutter_test.dart';
import 'package:playbook_polymorphism/features/strategy/domain/delivery_repository.dart';
import 'package:playbook_polymorphism/features/strategy/domain/delivery_strategy.dart';
import 'package:playbook_polymorphism/features/strategy/domain/strategy/express_delivery_strategy.dart';
import 'package:playbook_polymorphism/features/strategy/domain/strategy/pickup_delivery_strategy.dart';
import 'package:playbook_polymorphism/features/strategy/domain/strategy/standard_delivery_strategy.dart';
import 'package:playbook_polymorphism/features/strategy/model/delivery_method.dart';
import 'package:playbook_toolkit/data/repository_executor/raw_repository_executor.dart';

import '../../support/delivery_data_source_fakes.dart';

/// The strategies are plain Dart: no widgets, no pump, only a fake backend.
void main() {
  late RecordingDeliveryDataSource backend;
  late DeliveryRepository repository;

  setUp(() {
    backend = RecordingDeliveryDataSource();
    repository = DeliveryRepository(const RawRepositoryExecutor(), backend);
  });

  group('DeliveryStrategy.from', () {
    test('builds the strategy of each delivery method', () {
      expect(
        DeliveryStrategy.from(DeliveryMethod.standard, repository),
        isA<StandardDeliveryStrategy>(),
      );
      expect(
        DeliveryStrategy.from(DeliveryMethod.express, repository),
        isA<ExpressDeliveryStrategy>(),
      );
      expect(
        DeliveryStrategy.from(DeliveryMethod.pickup, repository),
        isA<PickupDeliveryStrategy>(),
      );
    });
  });

  group('StandardDeliveryStrategy', () {
    late StandardDeliveryStrategy strategy;

    setUp(() => strategy = StandardDeliveryStrategy(repository));

    test('arrives in 3 days', () {
      expect(strategy.days, 3);
    });

    test('costs 5, and is free from 50', () {
      expect(strategy.feeFor(4900), 500);
      expect(strategy.feeFor(5000), 0);
    });

    test('takes any basket', () {
      expect(strategy.unavailableReasonFor(100000), isNull);
    });

    test('places a standard order', () async {
      await strategy.place(4000);

      expect(backend.orders, ['standard']);
    });
  });

  group('ExpressDeliveryStrategy', () {
    late ExpressDeliveryStrategy strategy;

    setUp(() => strategy = ExpressDeliveryStrategy(repository));

    test('arrives tomorrow', () {
      expect(strategy.days, 1);
    });

    test('always costs 15', () {
      expect(strategy.feeFor(2000), 1500);
      expect(strategy.feeFor(5000), 1500);
    });

    test('takes baskets up to 50 and says why not above', () {
      expect(strategy.unavailableReasonFor(5000), isNull);
      expect(
        strategy.unavailableReasonFor(5001),
        r'Express takes baskets up to $50.00',
      );
    });

    test('places an express order', () async {
      await strategy.place(4000);

      expect(backend.orders, ['express']);
    });
  });

  group('PickupDeliveryStrategy', () {
    late PickupDeliveryStrategy strategy;

    setUp(() => strategy = PickupDeliveryStrategy(repository));

    test('is ready today', () {
      expect(strategy.days, 0);
    });

    test('is always free', () {
      expect(strategy.feeFor(2000), 0);
    });

    test('places a pickup order', () async {
      await strategy.place(4000);

      expect(backend.orders, ['pickup']);
    });
  });
}
