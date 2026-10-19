import 'package:playbook_polymorphism/features/prod_payment/domain/payment_strategy.dart';
import 'package:playbook_polymorphism/features/prod_payment/model/payment_service.dart';

/// Pays whoever is behind a scanned QR code. The code opens a generic "QR
/// payment" service, so this strategy asks the bank who the real merchant is
/// and switches to it. Everything else comes from the template.
class QrPaymentStrategy extends PaymentStrategy {
  const QrPaymentStrategy(super.repository, {required this.scannedCode});

  final String scannedCode;

  @override
  String get serviceId => 'qr';

  @override
  Future<String> resolveServiceId(PaymentService service) =>
      repository.resolveQrService(scannedCode);
}
