abstract class DeliveryDataSource {
  Future<void> placeStandardOrder(int subtotalCents);

  Future<void> placeExpressOrder(int subtotalCents);

  Future<void> placePickupOrder(int subtotalCents);
}
