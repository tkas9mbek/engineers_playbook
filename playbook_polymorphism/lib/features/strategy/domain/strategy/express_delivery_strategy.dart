import 'package:playbook_polymorphism/core/utils/cents_format.dart';
import 'package:playbook_polymorphism/features/strategy/domain/delivery_repository.dart';
import 'package:playbook_polymorphism/features/strategy/domain/delivery_strategy.dart';

/// Arrives tomorrow. Always costs $15. Only takes baskets up to $50: the
/// courier bike is small. Read this one file and you know all of Express.
class ExpressDeliveryStrategy extends DeliveryStrategy {
  const ExpressDeliveryStrategy(this._repository);

  static const int _maxSubtotalCents = 5000;

  final DeliveryRepository _repository;

  @override
  int get days => 1;

  @override
  int feeFor(int subtotalCents) => 1500;

  @override
  String? unavailableReasonFor(int subtotalCents) =>
      subtotalCents > _maxSubtotalCents
      ? 'Express takes baskets up to \$${_maxSubtotalCents.toDollars()}'
      : null;

  @override
  Future<void> place(int subtotalCents) =>
      _repository.placeExpressOrder(subtotalCents);
}
