import 'dart:async';

import 'package:playbook_polymorphism/core/di/app_module.dart';
import 'package:playbook_polymorphism/features/product/configs/product_module.dart';
import 'package:playbook_polymorphism/features/rate/configs/rate_module.dart';
import 'package:playbook_polymorphism/features/remote_config/configs/remote_config_module.dart';
import 'package:playbook_polymorphism/features/transfer/configs/transfer_module.dart';

/// Registers every feature module in GetIt.
///
/// This playbook app is mock-only: each module registers its mock data source
/// directly. In a real app a module would choose between a mock and an API
/// implementation here, which is also a strategy chosen in one place.
class AppConfigurator {
  static final List<AppModule> _allModules = [
    TransferModule(),
    ProductModule(),
    RateModule(),
    RemoteConfigModule(),
  ];

  static Future<void> configure() async {
    for (final module in _allModules) {
      await module.registerDependencies();
    }
  }
}
