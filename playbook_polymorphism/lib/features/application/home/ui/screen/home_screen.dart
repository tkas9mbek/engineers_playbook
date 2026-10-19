import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:playbook_polymorphism/core/router/app_router.dart';
import 'package:playbook_uikit/theme/theme_provider.dart';
import 'package:playbook_uikit/utils/functions/safe_size_functions.dart';
import 'package:playbook_uikit/widgets/app_bar/title_app_bar.dart';
import 'package:playbook_uikit/widgets/misc/app_list_tile.dart';
import 'package:playbook_uikit/widgets/misc/app_titled_tiles_panel.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.of(context).theme;
    final router = context.router;

    return Scaffold(
      backgroundColor: theme.background,
      appBar: const TitleAppBar(
        title: 'Polymorphism in Flutter',
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: getScreenPadding(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 32,
          children: [
            AppTitledTilesPanel(
              title: 'Strategy over conditionals',
              description:
                  'Standard, express or pickup: each delivery has its own fee and '
                  'arrival time. Both screens look the same; only the code differs.',
              tiles: [
                AppListTile(
                  title: 'Strategy',
                  subtitle: 'One class per delivery, the screen has no ifs',
                  onTap: () =>
                      unawaited(router.push(const DeliveryStrategyRoute())),
                ),
                AppListTile(
                  title: 'Conditional',
                  subtitle: 'One enum, one extension, a switch per question',
                  onTap: () =>
                      unawaited(router.push(const DeliveryConditionalRoute())),
                ),
                AppListTile(
                  title: 'Article: strategy vs conditional',
                  subtitle: 'Why the extra classes pay off as logic grows',
                  onTap: () => unawaited(
                    router.push(const DeliveryStrategyArticleRoute()),
                  ),
                ),
              ],
            ),
            AppTitledTilesPanel(
              title: 'Factory over conditionals',
              description:
                  'Backend products (an enum) shown as UI. '
                  'Both screens look the same; only the code differs.',
              tiles: [
                AppListTile(
                  title: 'Factory',
                  subtitle: 'One switch builds a small class per product type',
                  onTap: () =>
                      unawaited(router.push(const ProductFactoryRoute())),
                ),
                AppListTile(
                  title: 'Conditional',
                  subtitle: 'One switch in the widget returns everything',
                  onTap: () =>
                      unawaited(router.push(const ProductConditionalRoute())),
                ),
                AppListTile(
                  title: 'Article: factory vs conditional',
                  subtitle: 'When the extra classes are worth it',
                  onTap: () => unawaited(
                    router.push(const ProductFactoryArticleRoute()),
                  ),
                ),
              ],
            ),
            AppTitledTilesPanel(
              title: 'Design patterns',
              description:
                  'More patterns I use every day. Each one is a short '
                  'page with a small demo.',
              tiles: [
                AppListTile(
                  title: 'Decorator',
                  subtitle: 'Wrap a call to add retry and logging',
                  onTap: () =>
                      unawaited(router.push(const RateDecoratorRoute())),
                ),
                AppListTile(
                  title: 'Template method',
                  subtitle:
                      'The base class fixes the steps, subclasses fill them',
                  onTap: () =>
                      unawaited(router.push(const ReceiptTemplateRoute())),
                ),
                AppListTile(
                  title: 'Null object',
                  subtitle: 'No promo code is an object, not a null',
                  onTap: () =>
                      unawaited(router.push(const CartNullObjectRoute())),
                ),
                AppListTile(
                  title: 'Registry',
                  subtitle: 'Ask for a config by its type, not a text key',
                  onTap: () =>
                      unawaited(router.push(const RemoteConfigRegistryRoute())),
                ),
                AppListTile(
                  title: 'Adapter',
                  subtitle: 'Make a class we cannot edit fit our interface',
                  onTap: () =>
                      unawaited(router.push(const ThermometerAdapterRoute())),
                ),
              ],
            ),
            AppTitledTilesPanel(
              title: 'Production examples',
              description:
                  'Real features mix patterns. Each page is a case from a '
                  'real app and shows which patterns work together.',
              tiles: [
                AppListTile(
                  title: 'Payment flow',
                  subtitle: 'Strategy, template method and factory',
                  onTap: () => unawaited(router.push(const PaymentFlowRoute())),
                ),
                AppListTile(
                  title: 'Product actions',
                  subtitle: 'A factory picks a strategy for each product',
                  onTap: () =>
                      unawaited(router.push(const ProductActionsRoute())),
                ),
                AppListTile(
                  title: 'Code screen',
                  subtitle: 'Each channel owns its input rule and masking',
                  onTap: () => unawaited(router.push(const CodeEntryRoute())),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
