import 'package:playbook_polymorphism/features/prod_payment/domain/payment_strategy.dart';

/// Pays a utility bill. It changes nothing in the template.
class StandardPaymentStrategy extends PaymentStrategy {
  const StandardPaymentStrategy(super.repository);

  @override
  String get serviceId => 'electricity';
}
