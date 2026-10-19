import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:playbook_uikit/theme/theme_provider.dart';

Widget _wrapApp(Widget child) => ThemeProvider(child: MaterialApp(home: child));

extension PumpAppX on WidgetTester {
  /// Uses a tall viewport so a whole screen is on screen and tappable.
  Future<void> pumpApp(Widget child) async {
    view
      ..physicalSize = const Size(800, 2000)
      ..devicePixelRatio = 1;
    addTearDown(view.reset);

    await pumpWidget(_wrapApp(child));
    await pumpAndSettle();
  }

  /// Every text inside the screen's scroll view, in order. This is "what the user
  /// sees", used to prove two implementations render the same screen.
  List<String> visibleTexts() => widgetList<Text>(
    find.descendant(
      of: find.byType(SingleChildScrollView),
      matching: find.byType(Text),
    ),
  ).map((text) => text.data ?? '').toList();
}
