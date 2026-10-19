import 'package:playbook_polymorphism/features/adapter/data/legacy_fahrenheit_sensor.dart';
import 'package:playbook_polymorphism/features/adapter/domain/thermometer.dart';

/// ADAPTER: speaks [Thermometer] to the app, and "legacy sensor" to the
/// sensor. It converts Fahrenheit to Celsius in one place. Neither side
/// changes.
class FahrenheitThermometerAdapter implements Thermometer {
  FahrenheitThermometerAdapter(this._sensor);

  final LegacyFahrenheitSensor _sensor;

  @override
  double readCelsius() => (_sensor.readTemperatureF() - 32) * 5 / 9;
}
