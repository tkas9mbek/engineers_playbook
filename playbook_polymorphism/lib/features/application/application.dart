import 'package:flutter/material.dart';
import 'package:playbook_polymorphism/core/router/app_router.dart';
import 'package:playbook_uikit/theme/app_text_styles.dart';
import 'package:playbook_uikit/theme/app_theme.dart';
import 'package:playbook_uikit/theme/theme_data_from_theme.dart';
import 'package:playbook_uikit/theme/theme_provider.dart';

final _router = AppRouter();

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = MediaQuery.platformBrightnessOf(context) == Brightness.dark;
    final theme = isDark ? AppTheme.dark() : AppTheme.light();

    return ThemeProvider(
      theme: theme,
      child: MaterialApp.router(
        title: 'Polymorphism in Flutter',
        debugShowCheckedModeBanner: false,
        theme: themeDataFromTheme(
          theme: AppTheme.light(),
          textStyles: AppTextStyles(AppTheme.light()),
        ),
        darkTheme: themeDataFromTheme(
          theme: AppTheme.dark(),
          textStyles: AppTextStyles(AppTheme.dark()),
        ),
        routerDelegate: _router.delegate(),
        routeInformationParser: _router.defaultRouteParser(),
      ),
    );
  }
}
