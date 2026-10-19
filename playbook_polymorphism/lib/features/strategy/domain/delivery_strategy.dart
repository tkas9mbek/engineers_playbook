import 'package:playbook_polymorphism/features/strategy/domain/delivery_repository.dart';
import 'package:playbook_polymorphism/features/strategy/domain/strategy/express_delivery_strategy.dart';
import 'package:playbook_polymorphism/features/strategy/domain/strategy/pickup_delivery_strategy.dart';
import 'package:playbook_polymorphism/features/strategy/domain/strategy/standard_delivery_strategy.dart';
import 'package:playbook_polymorphism/features/strategy/model/delivery_method.dart';

/// Everything about one way of delivering an order: its fee, its arrival time,
/// its limits and the call that places it. One subclass per option.
///
/// The bloc runs the flow and only knows this interface. Each subclass talks
/// to the repository itself, so the bloc never learns where an order goes.
/// Pure Dart: no widgets. All money is in cents.
abstract class DeliveryStrategy {
  const DeliveryStrategy();

  /// The only place that knows every strategy. Pick the strategy once, at the
  /// edge (the screen, the route or DI), and pass it down.
  factory DeliveryStrategy.from(
    DeliveryMethod method,
    DeliveryRepository repository,
  ) => switch (method) {
    DeliveryMethod.standard => StandardDeliveryStrategy(repository),
    DeliveryMethod.express => ExpressDeliveryStrategy(repository),
    DeliveryMethod.pickup => PickupDeliveryStrategy(repository),
  };

  /// Days until the order arrives. 0 means today.
  int get days;

  /// The delivery fee for an order worth [subtotalCents].
  int feeFor(int subtotalCents);

  /// Why this delivery can't take an order worth [subtotalCents], or null if
  /// it can. The default: no limits. A strategy with a limit overrides it.
  String? unavailableReasonFor(int subtotalCents) => null;

  /// Places the order. Everything this delivery needs happens here.
  Future<void> place(int subtotalCents);
}
