/// TARGET: the interface our app wants to call. It is ours, small, and in
/// Celsius. Screens know only this.
abstract class Thermometer {
  double readCelsius();
}
