import 'package:playbook_polymorphism/features/strategy/domain/delivery_repository.dart';
import 'package:playbook_polymorphism/features/strategy/domain/delivery_strategy.dart';

/// The customer collects the order today. Always free.
class PickupDeliveryStrategy extends DeliveryStrategy {
  const PickupDeliveryStrategy(this._repository);

  final DeliveryRepository _repository;

  @override
  int get days => 0;

  @override
  int feeFor(int subtotalCents) => 0;

  @override
  Future<void> place(int subtotalCents) =>
      _repository.placePickupOrder(subtotalCents);
}
