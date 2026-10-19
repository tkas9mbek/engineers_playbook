/// What the bank backend can do with a product. One call per kind of product.
abstract class ProductActionDataSource {
  Future<void> freezeCard(String productId);

  Future<void> topUpDeposit(String productId, int amountCents);

  Future<void> repayCredit(String productId, int amountCents);
}
