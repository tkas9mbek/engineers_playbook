import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:playbook_polymorphism/core/router/app_router.dart';
import 'package:playbook_uikit/theme/theme_provider.dart';
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

    final items = <Widget>[
      AppTitledTilesPanel(
        title: 'Strategy over conditionals',
        description:
            'The screen behaves differently for adults and children. '
            'Both screens look the same; only the code differs.',
        tiles: [
          AppListTile(
            title: 'Strategy',
            subtitle: 'Two strategy classes, the screen has no ifs',
            onTap: () => unawaited(router.push(const TransferStrategyRoute())),
          ),
          AppListTile(
            title: 'Conditional',
            subtitle: 'One enum, a switch in every place that differs',
            onTap: () =>
                unawaited(router.push(const TransferConditionalRoute())),
          ),
          AppListTile(
            title: 'Article: strategy vs conditional',
            subtitle: 'Why the extra classes pay off as logic grows',
            onTap: () =>
                unawaited(router.push(const TransferStrategyArticleRoute())),
          ),
        ],
      ),
      AppTitledTilesPanel(
        title: 'Factory method over conditionals',
        description:
            'Backend products (an enum) shown as UI. '
            'Both screens look the same; only the code differs.',
        tiles: [
          AppListTile(
            title: 'Factory method',
            subtitle: 'ProductUiModel.from holds the only switch',
            onTap: () => unawaited(router.push(const ProductFactoryRoute())),
          ),
          AppListTile(
            title: 'Conditional',
            subtitle: 'The widget switches on the enum everywhere',
            onTap: () =>
                unawaited(router.push(const ProductConditionalRoute())),
          ),
          AppListTile(
            title: 'Article: factory method vs conditional',
            subtitle: 'One switch instead of one in every widget',
            onTap: () =>
                unawaited(router.push(const ProductFactoryArticleRoute())),
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
            onTap: () => unawaited(router.push(const RateDecoratorRoute())),
          ),
          AppListTile(
            title: 'Template method',
            subtitle: 'The base class fixes the steps, subclasses fill them',
            onTap: () => unawaited(router.push(const ReceiptTemplateRoute())),
          ),
          AppListTile(
            title: 'Null object',
            subtitle: 'No promo code is an object, not a null',
            onTap: () => unawaited(router.push(const CartNullObjectRoute())),
          ),
          AppListTile(
            title: 'Registry',
            subtitle: 'Ask for a config by its type, not a text key',
            onTap: () =>
                unawaited(router.push(const RemoteConfigRegistryRoute())),
          ),
        ],
      ),
    ];

    return Scaffold(
      backgroundColor: theme.background,
      appBar: const TitleAppBar(
        title: 'Polymorphism in Flutter',
        automaticallyImplyLeading: false,
      ),
      body: ListView.separated(
        padding: EdgeInsets.only(
          left: 16,
          top: 16,
          right: 16,
          bottom: 16 + MediaQuery.paddingOf(context).bottom,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) => items[index],
        separatorBuilder: (context, index) => const SizedBox(height: 32),
      ),
    );
  }
}
