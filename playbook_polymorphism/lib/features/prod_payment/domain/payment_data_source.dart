import 'package:playbook_polymorphism/features/prod_payment/model/payment_service.dart';

abstract class PaymentDataSource {
  Future<PaymentService> getService(String serviceId);

  /// Asks the bank which service stands behind a scanned QR code.
  Future<String> resolveQrService(String qrCode);

  Future<void> validate(String serviceId, int amountCents);

  /// Returns the number of the new payment.
  Future<String> createPayment(String serviceId, int amountCents);
}
