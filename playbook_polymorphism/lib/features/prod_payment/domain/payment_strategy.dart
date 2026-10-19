import 'package:meta/meta.dart';
import 'package:playbook_polymorphism/features/prod_payment/domain/payment_repository.dart';
import 'package:playbook_polymorphism/features/prod_payment/domain/strategy/qr_payment_strategy.dart';
import 'package:playbook_polymorphism/features/prod_payment/domain/strategy/standard_payment_strategy.dart';
import 'package:playbook_polymorphism/features/prod_payment/model/payment_receipt.dart';
import 'package:playbook_polymorphism/features/prod_payment/model/payment_service.dart';
import 'package:playbook_polymorphism/features/prod_payment/model/payment_type.dart';

/// One payment, start to finish. Three patterns work together here:
///
/// - **Strategy**: the bloc and the screen hold a [PaymentStrategy] and never
///   ask which kind of payment it is.
/// - **Template method**: [pay] fixes the steps and their order. It is
///   `@nonVirtual`: Dart still compiles an override, but the analyzer warns,
///   and we keep the analyzer clean. A subclass changes only the one step it
///   is allowed to, [resolveServiceId].
/// - **Factory**: [PaymentStrategy.from] is the only place that picks
///   the subclass.
abstract class PaymentStrategy {
  const PaymentStrategy(this.repository);

  /// [scannedCode] is what the camera read. Only the QR kind uses it.
  factory PaymentStrategy.from(
    PaymentType type,
    PaymentRepository repository, {
    required String scannedCode,
  }) => switch (type) {
    PaymentType.standard => StandardPaymentStrategy(repository),
    PaymentType.qr => QrPaymentStrategy(repository, scannedCode: scannedCode),
  };

  /// Subclasses use it in their own step.
  @protected
  final PaymentRepository repository;

  /// The service the screen opens with.
  String get serviceId;

  /// The template method. Every payment loads, validates and creates in this
  /// order, so no subclass can forget a step.
  @nonVirtual
  Future<PaymentReceipt> pay(int amountCents) async {
    var service = await repository.getService(serviceId);
    // Plain English trace for the demo's receipt; see [PaymentReceipt.steps].
    final steps = ['Loaded ${service.name}'];

    final resolvedId = await resolveServiceId(service);

    if (resolvedId != service.id) {
      service = await repository.getService(resolvedId);
      steps.add('Switched to ${service.name}');
    }

    await repository.validate(service.id, amountCents);
    steps.add('Checked the amount');

    final number = await repository.createPayment(service.id, amountCents);
    steps.add('Created payment $number');

    return PaymentReceipt(
      serviceName: service.name,
      amountCents: amountCents,
      steps: steps,
    );
  }

  /// The hook. A normal payment pays the service it opened with.
  Future<String> resolveServiceId(PaymentService service) async => service.id;
}
