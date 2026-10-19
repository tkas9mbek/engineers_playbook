import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:playbook_polymorphism/features/adapter/ui/widget/thermometer_adapter_panel.dart';
import 'package:playbook_uikit/widgets/article/pattern_layout.dart';

@RoutePage()
class ThermometerAdapterScreen extends StatelessWidget {
  const ThermometerAdapterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PatternLayout(
      title: 'Adapter',
      intro:
          'An adapter makes a class you cannot change fit the interface your '
          'app expects. Here the sensor reports Fahrenheit through '
          'readTemperatureF(), for example 68.0. The app wants readCelsius(), which is 20.0 for that reading. One '
          'small class converts, so no screen does the math. It converts, it '
          'does not choose.',
      demo: ThermometerAdapterPanel(),
      whenToUse:
          'You must use a class you cannot edit (a package, an old SDK, '
          'generated code), and its methods or units do not match what your '
          'code expects. Write one adapter. Everything else talks to your '
          'interface.',
      whenToSkip:
          'You own both sides. Change one of them and skip the adapter. Also '
          'skip it for a one-off call in one file: one line of conversion is '
          'fine there.',
      tryThis:
          'open FahrenheitThermometerAdapter and change the formula. No '
          'screen changes. Then write a second adapter for a sensor that '
          'reports Kelvin.',
    );
  }
}
