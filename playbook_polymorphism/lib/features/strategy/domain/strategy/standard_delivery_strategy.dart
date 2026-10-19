import 'package:playbook_polymorphism/features/strategy/domain/delivery_repository.dart';
import 'package:playbook_polymorphism/features/strategy/domain/delivery_strategy.dart';

/// Arrives in 3 days. Free for orders of $50 or more, otherwise $5.
class StandardDeliveryStrategy extends DeliveryStrategy {
  const StandardDeliveryStrategy(this._repository);

  final DeliveryRepository _repository;

  @override
  int get days => 3;

  @override
  int feeFor(int subtotalCents) => subtotalCents >= 5000 ? 0 : 500;

  @override
  Future<void> place(int subtotalCents) =>
      _repository.placeStandardOrder(subtotalCents);
}
