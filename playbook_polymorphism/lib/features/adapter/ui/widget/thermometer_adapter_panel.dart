import 'package:flutter/material.dart';
import 'package:playbook_polymorphism/core/global/global_variables.dart';
import 'package:playbook_polymorphism/features/adapter/domain/thermometer.dart';
import 'package:playbook_uikit/widgets/button/app_elevated_button.dart';
import 'package:playbook_uikit/widgets/misc/app_list_tile.dart';
import 'package:playbook_uikit/widgets/misc/grouped_rows_card.dart';

/// Reads the sensor through a [Thermometer]. The panel only knows Celsius: it
/// has no idea a Fahrenheit sensor sits behind the interface.
class ThermometerAdapterPanel extends StatefulWidget {
  const ThermometerAdapterPanel({super.key});

  @override
  State<ThermometerAdapterPanel> createState() =>
      _ThermometerAdapterPanelState();
}

class _ThermometerAdapterPanelState extends State<ThermometerAdapterPanel> {
  final Thermometer _thermometer = getIt<Thermometer>();

  double? _celsius;
  int _timesRead = 0;

  void _onReadPressed() => setState(() {
    _celsius = _thermometer.readCelsius();
    _timesRead++;
  });

  @override
  Widget build(BuildContext context) {
    final celsius = _celsius;

    return Column(
      spacing: 16,
      children: [
        AppElevatedButton.big(
          context: context,
          text: 'Read the sensor',
          onPressed: _onReadPressed,
        ),
        GroupedRowsCard(
          children: [
            AppListTile(title: 'Times read', value: '$_timesRead'),
            AppListTile(
              title: 'App sees',
              value: celsius == null
                  ? 'Not read yet'
                  : '${celsius.toStringAsFixed(1)} C',
            ),
          ],
        ),
      ],
    );
  }
}
