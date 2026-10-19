import 'package:auto_route/auto_route.dart';
import 'package:playbook_polymorphism/features/adapter/ui/screen/thermometer_adapter_screen.dart';
import 'package:playbook_polymorphism/features/application/home/ui/screen/home_screen.dart';
import 'package:playbook_polymorphism/features/decorator/ui/screen/rate_decorator_screen.dart';
import 'package:playbook_polymorphism/features/factory/ui/common/screen/product_factory_article_screen.dart';
import 'package:playbook_polymorphism/features/factory/ui/conditional/screen/product_conditional_screen.dart';
import 'package:playbook_polymorphism/features/factory/ui/factory/screen/product_factory_screen.dart';
import 'package:playbook_polymorphism/features/null_object/ui/screen/cart_null_object_screen.dart';
import 'package:playbook_polymorphism/features/prod_code_entry/ui/screen/code_entry_screen.dart';
import 'package:playbook_polymorphism/features/prod_payment/ui/screen/payment_flow_screen.dart';
import 'package:playbook_polymorphism/features/prod_product_actions/ui/screen/product_actions_screen.dart';
import 'package:playbook_polymorphism/features/registry/ui/screen/remote_config_registry_screen.dart';
import 'package:playbook_polymorphism/features/strategy/ui/common/screen/delivery_strategy_article_screen.dart';
import 'package:playbook_polymorphism/features/strategy/ui/conditional/screen/delivery_conditional_screen.dart';
import 'package:playbook_polymorphism/features/strategy/ui/strategy/screen/delivery_strategy_screen.dart';
import 'package:playbook_polymorphism/features/template_method/ui/screen/receipt_template_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: HomeRoute.page, initial: true),
    AutoRoute(page: DeliveryStrategyRoute.page, path: '/delivery/strategy'),
    AutoRoute(
      page: DeliveryConditionalRoute.page,
      path: '/delivery/conditional',
    ),
    AutoRoute(
      page: DeliveryStrategyArticleRoute.page,
      path: '/delivery/article',
    ),
    AutoRoute(page: ProductFactoryRoute.page, path: '/product/factory'),
    AutoRoute(page: ProductConditionalRoute.page, path: '/product/conditional'),
    AutoRoute(page: ProductFactoryArticleRoute.page, path: '/product/article'),
    AutoRoute(page: RateDecoratorRoute.page, path: '/patterns/decorator'),
    AutoRoute(page: ReceiptTemplateRoute.page, path: '/patterns/template'),
    AutoRoute(page: CartNullObjectRoute.page, path: '/patterns/null'),
    AutoRoute(page: RemoteConfigRegistryRoute.page, path: '/patterns/registry'),
    AutoRoute(page: ThermometerAdapterRoute.page, path: '/patterns/adapter'),
    AutoRoute(page: PaymentFlowRoute.page, path: '/prod/payment'),
    AutoRoute(page: CodeEntryRoute.page, path: '/prod/code'),
    AutoRoute(page: ProductActionsRoute.page, path: '/prod/products'),
  ];
}
