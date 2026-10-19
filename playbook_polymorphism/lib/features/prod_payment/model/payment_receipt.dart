import 'package:equatable/equatable.dart';

/// What the customer gets back: who was paid, how much, and the steps the
/// payment went through. [steps] is a plain trace the demo prints. A real app
/// would keep codes here and let the UI word them.
class PaymentReceipt extends Equatable {
  const PaymentReceipt({
    required this.serviceName,
    required this.amountCents,
    required this.steps,
  });

  final String serviceName;
  final int amountCents;
  final List<String> steps;

  @override
  List<Object?> get props => [serviceName, amountCents, steps];
}
