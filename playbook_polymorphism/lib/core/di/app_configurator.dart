import 'dart:async';

import 'package:playbook_polymorphism/core/di/app_module.dart';
import 'package:playbook_polymorphism/features/adapter/configs/thermometer_module.dart';
import 'package:playbook_polymorphism/features/decorator/configs/rate_module.dart';
import 'package:playbook_polymorphism/features/factory/configs/product_module.dart';
import 'package:playbook_polymorphism/features/prod_payment/configs/payment_module.dart';
import 'package:playbook_polymorphism/features/prod_product_actions/configs/product_action_module.dart';
import 'package:playbook_polymorphism/features/registry/configs/remote_config_module.dart';
import 'package:playbook_polymorphism/features/strategy/configs/delivery_module.dart';

/// Registers every feature module in GetIt.
///
/// This playbook app is mock-only: each module registers its mock data source
/// directly. In a real app a module would choose between a mock and an API
/// implementation here, which is also a strategy chosen in one place.
class AppConfigurator {
  static final List<AppModule> _allModules = [
    DeliveryModule(),
    ProductModule(),
    RateModule(),
    RemoteConfigModule(),
    PaymentModule(),
    ProductActionModule(),
    ThermometerModule(),
  ];

  static Future<void> configure() async {
    for (final module in _allModules) {
      await module.registerDependencies();
    }
  }
}
