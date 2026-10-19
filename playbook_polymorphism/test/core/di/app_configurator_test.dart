import 'package:flutter_test/flutter_test.dart';
import 'package:playbook_polymorphism/core/di/app_configurator.dart';
import 'package:playbook_polymorphism/core/global/global_variables.dart';
import 'package:playbook_polymorphism/features/adapter/domain/thermometer.dart';
import 'package:playbook_polymorphism/features/decorator/ui/bloc/rate_details_bloc.dart';
import 'package:playbook_polymorphism/features/factory/ui/common/bloc/product_list_bloc.dart';
import 'package:playbook_polymorphism/features/prod_payment/domain/payment_repository.dart';
import 'package:playbook_polymorphism/features/prod_product_actions/domain/product_action_repository.dart';
import 'package:playbook_polymorphism/features/registry/domain/remote_config_repository.dart';
import 'package:playbook_polymorphism/features/strategy/domain/delivery_repository.dart';

void main() {
  tearDown(getIt.reset);

  test('the whole DI graph can be built', () async {
    await AppConfigurator.configure();

    expect(getIt<DeliveryRepository>(), isA<DeliveryRepository>());
    expect(getIt<ProductListBloc>(), isA<ProductListBloc>());
    expect(getIt<RateDetailsBloc>(), isA<RateDetailsBloc>());
    expect(getIt<RemoteConfigRepository>(), isA<RemoteConfigRepository>());
    expect(getIt<PaymentRepository>(), isA<PaymentRepository>());
    expect(getIt<Thermometer>(), isA<Thermometer>());
    expect(getIt<ProductActionRepository>(), isA<ProductActionRepository>());
  });

  test('configuring twice does not fail', () async {
    await AppConfigurator.configure();
    await AppConfigurator.configure();

    expect(getIt.isRegistered<DeliveryRepository>(), isTrue);
  });
}
