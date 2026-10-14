import 'package:auto_route/auto_route.dart';
import 'package:playbook_polymorphism/features/application/home/screen/home_screen.dart';
import 'package:playbook_polymorphism/features/cart/ui/screen/cart_null_object_screen.dart';
import 'package:playbook_polymorphism/features/product/ui/common/screen/product_factory_article_screen.dart';
import 'package:playbook_polymorphism/features/product/ui/conditional/screen/product_conditional_screen.dart';
import 'package:playbook_polymorphism/features/product/ui/factory/screen/product_factory_screen.dart';
import 'package:playbook_polymorphism/features/rate/ui/screen/rate_decorator_screen.dart';
import 'package:playbook_polymorphism/features/receipt/ui/screen/receipt_template_screen.dart';
import 'package:playbook_polymorphism/features/remote_config/ui/screen/remote_config_registry_screen.dart';
import 'package:playbook_polymorphism/features/transfer/ui/common/screen/transfer_strategy_article_screen.dart';
import 'package:playbook_polymorphism/features/transfer/ui/conditional/screen/transfer_conditional_screen.dart';
import 'package:playbook_polymorphism/features/transfer/ui/strategy/screen/transfer_strategy_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: HomeRoute.page, initial: true),
    AutoRoute(page: TransferStrategyRoute.page, path: '/transfer/strategy'),
    AutoRoute(
      page: TransferConditionalRoute.page,
      path: '/transfer/conditional',
    ),
    AutoRoute(
      page: TransferStrategyArticleRoute.page,
      path: '/transfer/article',
    ),
    AutoRoute(page: ProductFactoryRoute.page, path: '/product/factory'),
    AutoRoute(page: ProductConditionalRoute.page, path: '/product/conditional'),
    AutoRoute(page: ProductFactoryArticleRoute.page, path: '/product/article'),
    AutoRoute(page: RateDecoratorRoute.page, path: '/patterns/decorator'),
    AutoRoute(page: ReceiptTemplateRoute.page, path: '/patterns/template'),
    AutoRoute(page: CartNullObjectRoute.page, path: '/patterns/null'),
    AutoRoute(page: RemoteConfigRegistryRoute.page, path: '/patterns/registry'),
  ];
}
