import 'package:flutter_test/flutter_test.dart';
import 'package:playbook_polymorphism/features/strategy/domain/delivery_conditional_rules.dart';
import 'package:playbook_polymorphism/features/strategy/domain/delivery_repository.dart';
import 'package:playbook_polymorphism/features/strategy/domain/delivery_strategy.dart';
import 'package:playbook_polymorphism/features/strategy/model/delivery_method.dart';
import 'package:playbook_toolkit/data/repository_executor/raw_repository_executor.dart';

import '../../support/delivery_data_source_fakes.dart';

/// The conditional rules and the strategies are two ways to write the SAME
/// rules. This guard test fails if they ever drift apart.
void main() {
  for (final method in DeliveryMethod.values) {
    group(method.label, () {
      late RecordingDeliveryDataSource strategyBackend;
      late DeliveryStrategy strategy;

      setUp(() {
        strategyBackend = RecordingDeliveryDataSource();
        strategy = DeliveryStrategy.from(
          method,
          DeliveryRepository(const RawRepositoryExecutor(), strategyBackend),
        );
      });

      test('arrives when the strategy says', () {
        expect(method.days, strategy.days);
      });

      for (final subtotalCents in [2000, 4000, 5000, 5001, 6000]) {
        test('fee and limit match for $subtotalCents cents', () {
          expect(method.feeFor(subtotalCents), strategy.feeFor(subtotalCents));
          expect(
            method.unavailableReasonFor(subtotalCents),
            strategy.unavailableReasonFor(subtotalCents),
          );
        });
      }

      test('places the same order', () async {
        final backend = RecordingDeliveryDataSource();

        await method.place(
          DeliveryRepository(const RawRepositoryExecutor(), backend),
          4000,
        );
        await strategy.place(4000);

        expect(backend.orders, strategyBackend.orders);
      });
    });
  }
}
