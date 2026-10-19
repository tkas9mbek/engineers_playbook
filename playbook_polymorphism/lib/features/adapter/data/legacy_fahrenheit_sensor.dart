/// ADAPTEE: pretend this comes from a package you cannot edit. It has the
/// wrong method name and the wrong unit for our app, and it stays that way.
class LegacyFahrenheitSensor {
  static const List<double> _readings = [32.0, 68.0, 98.6, 212.0];

  int _next = 0;

  /// A real sensor changes over time. This one cycles through four readings.
  double readTemperatureF() => _readings[_next++ % _readings.length];
}
