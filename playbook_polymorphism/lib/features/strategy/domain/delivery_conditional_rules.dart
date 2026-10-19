import 'package:playbook_polymorphism/core/utils/cents_format.dart';
import 'package:playbook_polymorphism/features/strategy/domain/delivery_repository.dart';
import 'package:playbook_polymorphism/features/strategy/model/delivery_method.dart';

/// The same delivery rules as `DeliveryStrategy`, written the conditional way:
/// one `switch` per question, all in one place. A real app would put these
/// members in the enum itself; they sit here so the strategy version can share
/// `DeliveryMethod`.
///
/// This is tidy code. Compare it with the strategy classes: here the code is
/// grouped by question (days, fee, limit, place). There it is grouped by
/// option (standard, express, pickup).
///
/// None of the switches has a `_` arm, so the compiler lists every missing
/// case when you add a method. All money is in cents.
extension DeliveryConditionalRules on DeliveryMethod {
  int get days => switch (this) {
    DeliveryMethod.standard => 3,
    DeliveryMethod.express => 1,
    DeliveryMethod.pickup => 0,
  };

  int feeFor(int subtotalCents) => switch (this) {
    DeliveryMethod.standard => subtotalCents >= 5000 ? 0 : 500,
    DeliveryMethod.express => 1500,
    DeliveryMethod.pickup => 0,
  };

  String? unavailableReasonFor(int subtotalCents) => switch (this) {
    DeliveryMethod.standard => null,
    DeliveryMethod.express =>
      subtotalCents > 5000
          ? 'Express takes baskets up to \$${5000.toDollars()}'
          : null,
    DeliveryMethod.pickup => null,
  };

  /// Takes the repository as an argument: an enum can't hold one.
  Future<void> place(DeliveryRepository repository, int subtotalCents) =>
      switch (this) {
        DeliveryMethod.standard => repository.placeStandardOrder(subtotalCents),
        DeliveryMethod.express => repository.placeExpressOrder(subtotalCents),
        DeliveryMethod.pickup => repository.placePickupOrder(subtotalCents),
      };
}
