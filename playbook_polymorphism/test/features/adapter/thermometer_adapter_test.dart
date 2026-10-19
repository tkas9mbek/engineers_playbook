import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:playbook_polymorphism/core/global/global_variables.dart';
import 'package:playbook_polymorphism/features/adapter/configs/thermometer_module.dart';
import 'package:playbook_polymorphism/features/adapter/data/fahrenheit_thermometer_adapter.dart';
import 'package:playbook_polymorphism/features/adapter/data/legacy_fahrenheit_sensor.dart';
import 'package:playbook_polymorphism/features/adapter/domain/thermometer.dart';
import 'package:playbook_polymorphism/features/adapter/ui/screen/thermometer_adapter_screen.dart';

import '../../support/pump_app.dart';

void main() {
  group('FahrenheitThermometerAdapter', () {
    test('is a Thermometer', () {
      expect(
        FahrenheitThermometerAdapter(LegacyFahrenheitSensor()),
        isA<Thermometer>(),
      );
    });

    test('turns the four sensor readings into Celsius', () {
      final thermometer = FahrenheitThermometerAdapter(
        LegacyFahrenheitSensor(),
      );

      expect(thermometer.readCelsius(), closeTo(0, 0.001));
      expect(thermometer.readCelsius(), closeTo(20, 0.001));
      expect(thermometer.readCelsius(), closeTo(37, 0.001));
      expect(thermometer.readCelsius(), closeTo(100, 0.001));
    });

    test('starts over after the last reading', () {
      final thermometer = FahrenheitThermometerAdapter(
        LegacyFahrenheitSensor(),
      );

      for (var i = 0; i < 4; i++) {
        thermometer.readCelsius();
      }

      expect(thermometer.readCelsius(), closeTo(0, 0.001));
    });
  });

  group('screen', () {
    setUp(() => ThermometerModule().registerDependencies());

    tearDown(getIt.reset);

    testWidgets('shows what the app sees, in Celsius', (tester) async {
      await tester.pumpApp(const ThermometerAdapterScreen());

      expect(find.text('Not read yet'), findsOneWidget);

      await tester.tap(find.text('Read the sensor'));
      await tester.pumpAndSettle();

      expect(find.text('0.0 C'), findsOneWidget);

      await tester.tap(find.text('Read the sensor'));
      await tester.pumpAndSettle();

      expect(find.text('20.0 C'), findsOneWidget);
      expect(find.text('2'), findsOneWidget);
      expect(find.byType(SingleChildScrollView), findsOneWidget);
    });
  });
}
