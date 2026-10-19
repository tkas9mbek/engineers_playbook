import 'package:playbook_polymorphism/features/strategy/model/delivery_method.dart';

sealed class DeliveryConditionalOrderEvent {
  const DeliveryConditionalOrderEvent();

  const factory DeliveryConditionalOrderEvent.submitted({
    required int subtotalCents,
    required DeliveryMethod method,
  }) = SubmittedDeliveryConditionalOrderEvent;
}

final class SubmittedDeliveryConditionalOrderEvent
    extends DeliveryConditionalOrderEvent {
  const SubmittedDeliveryConditionalOrderEvent({
    required this.subtotalCents,
    required this.method,
  });

  final int subtotalCents;
  final DeliveryMethod method;
}
