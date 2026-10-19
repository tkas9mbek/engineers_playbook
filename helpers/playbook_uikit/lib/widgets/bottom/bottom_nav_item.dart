import 'package:flutter/material.dart';
import 'package:playbook_uikit/theme/theme_provider.dart';
import 'package:playbook_uikit/widgets/misc/app_tap_area.dart';
import 'package:playbook_uikit/widgets/size/safe_vertical_box.dart';

/// A single bottom navigation destination showing an icon above its
/// [title], tinted with the accent color while [isActive] and the tertiary
/// text color otherwise.
class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    required this.icon,
    required this.title,
    required this.isActive,
    required this.onTap,
    super.key,
  });

  final IconData icon;
  final String title;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.of(context).theme;
    final textStyles = ThemeProvider.of(context).textStyles;
    final color = isActive ? theme.accent : theme.textTertiary;

    return Expanded(
      child: AppTapArea(
        selected: isActive,
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 8),
            Icon(icon, size: 24, color: color),
            const SizedBox(height: 4),
            Text(title, style: textStyles.mediumBody12.copyWith(color: color)),
            const SafeVerticalBox(height: 8, bottom: true),
          ],
        ),
      ),
    );
  }
}
