import 'package:playbook_polymorphism/features/prod_payment/domain/payment_data_source.dart';
import 'package:playbook_polymorphism/features/prod_payment/model/payment_service.dart';
import 'package:playbook_toolkit/data/exceptions/app_exception.dart';
import 'package:playbook_toolkit/data/mock/mock_network_behavior.dart';

/// Pretends to be the payments backend. Every call waits like a network call.
class MockPaymentDataSource implements PaymentDataSource {
  const MockPaymentDataSource(this._network);

  final MockNetworkBehavior _network;

  static const Map<String, PaymentService> _services = {
    'electricity': PaymentService(id: 'electricity', name: 'City Power'),
    'qr': PaymentService(id: 'qr', name: 'QR payment'),
    'coffee-bar': PaymentService(id: 'coffee-bar', name: 'Coffee Bar'),
  };

  @override
  Future<PaymentService> getService(String serviceId) async {
    await _network.simulate();

    final service = _services[serviceId];

    if (service == null) {
      throw const ServerException(statusCode: 404, message: 'No such service');
    }

    return service;
  }

  @override
  Future<String> resolveQrService(String qrCode) async {
    await _network.simulate();

    // The bank knows its own QR codes. Anything else is a 404.
    if (!qrCode.startsWith('coffee-bar-')) {
      throw const ServerException(statusCode: 404, message: 'Unknown QR code');
    }

    return 'coffee-bar';
  }

  @override
  Future<void> validate(String serviceId, int amountCents) =>
      _network.simulate();

  @override
  Future<String> createPayment(String serviceId, int amountCents) async {
    await _network.simulate();

    return '#1042';
  }
}
