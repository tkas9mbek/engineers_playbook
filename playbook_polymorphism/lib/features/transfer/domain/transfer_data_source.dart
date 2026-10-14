abstract class TransferDataSource {
  Future<int> getBalance();

  Future<void> sendMoney(int amount);
}
