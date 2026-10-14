import 'package:flutter/material.dart';
import 'package:playbook_polymorphism/core/di/app_configurator.dart';
import 'package:playbook_polymorphism/features/application/application.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppConfigurator.configure();

  runApp(const Application());
}
