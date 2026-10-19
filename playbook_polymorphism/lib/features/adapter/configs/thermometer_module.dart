import 'package:playbook_polymorphism/core/di/app_module.dart';
import 'package:playbook_polymorphism/core/global/global_variables.dart';
import 'package:playbook_polymorphism/features/adapter/data/fahrenheit_thermometer_adapter.dart';
import 'package:playbook_polymorphism/features/adapter/data/legacy_fahrenheit_sensor.dart';
import 'package:playbook_polymorphism/features/adapter/domain/thermometer.dart';

/// The one place that names the sensor and the adapter. The UI asks for a
/// [Thermometer] and never imports `data/`.
class ThermometerModule extends AppModule {
  @override
  List<Unregister> get unregisterCallbacks => [
    unregisterIfRegistered<Thermometer>,
  ];

  @override
  void register() {
    getIt.registerFactory<Thermometer>(
      () => FahrenheitThermometerAdapter(LegacyFahrenheitSensor()),
    );
  }
}
