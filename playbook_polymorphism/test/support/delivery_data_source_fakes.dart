import 'dart:async';

import 'package:playbook_polymorphism/features/strategy/domain/delivery_data_source.dart';
import 'package:playbook_toolkit/data/exceptions/app_exception.dart';

/// A fake backend that remembers which kind of order was placed.
class RecordingDeliveryDataSource implements DeliveryDataSource {
  final List<String> orders = [];

  @override
  Future<void> placeStandardOrder(int subtotalCents) async =>
      orders.add('standard');

  @override
  Future<void> placeExpressOrder(int subtotalCents) async =>
      orders.add('express');

  @override
  Future<void> placePickupOrder(int subtotalCents) async =>
      orders.add('pickup');
}

/// A fake backend that refuses every order.
class FailingDeliveryDataSource implements DeliveryDataSource {
  static const exception = ServerException(
    statusCode: 503,
    message: 'Orders are paused',
  );

  @override
  Future<void> placeStandardOrder(int subtotalCents) async => throw exception;

  @override
  Future<void> placeExpressOrder(int subtotalCents) async => throw exception;

  @override
  Future<void> placePickupOrder(int subtotalCents) async => throw exception;
}

/// A fake backend that keeps every order open until the test calls
/// [finish], so a test can do something while an order is still being placed.
class ManualDeliveryDataSource implements DeliveryDataSource {
  final Completer<void> _completer = Completer<void>();

  void finish() => _completer.complete();

  @override
  Future<void> placeStandardOrder(int subtotalCents) => _completer.future;

  @override
  Future<void> placeExpressOrder(int subtotalCents) => _completer.future;

  @override
  Future<void> placePickupOrder(int subtotalCents) => _completer.future;
}
