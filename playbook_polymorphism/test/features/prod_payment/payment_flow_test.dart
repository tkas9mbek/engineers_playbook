import 'package:flutter_test/flutter_test.dart';
import 'package:playbook_polymorphism/core/global/global_variables.dart';
import 'package:playbook_polymorphism/features/prod_payment/data/mock_payment_data_source.dart';
import 'package:playbook_polymorphism/features/prod_payment/domain/payment_repository.dart';
import 'package:playbook_polymorphism/features/prod_payment/domain/payment_strategy.dart';
import 'package:playbook_polymorphism/features/prod_payment/domain/strategy/qr_payment_strategy.dart';
import 'package:playbook_polymorphism/features/prod_payment/domain/strategy/standard_payment_strategy.dart';
import 'package:playbook_polymorphism/features/prod_payment/model/payment_receipt.dart';
import 'package:playbook_polymorphism/features/prod_payment/model/payment_type.dart';
import 'package:playbook_polymorphism/features/prod_payment/ui/bloc/payment_bloc.dart';
import 'package:playbook_polymorphism/features/prod_payment/ui/bloc/payment_state_event.dart';
import 'package:playbook_polymorphism/features/prod_payment/ui/screen/payment_flow_screen.dart';
import 'package:playbook_toolkit/data/exceptions/app_exception.dart';
import 'package:playbook_toolkit/data/mock/mock_network_behavior.dart';
import 'package:playbook_toolkit/data/repository_executor/raw_repository_executor.dart';
import 'package:playbook_toolkit/data/repository_executor/repository_executor_extensions.dart';

import '../../support/pump_app.dart';

const _goodCode = 'coffee-bar-17';

PaymentRepository _buildRepository({double failureRate = 0}) =>
    PaymentRepository(
      const RawRepositoryExecutor().withErrorHandling(),
      MockPaymentDataSource(
        MockNetworkBehavior(wait: Duration.zero, failureRate: failureRate),
      ),
    );

void main() {
  group('PaymentStrategy', () {
    test('the factory picks a class for each type', () {
      final repository = _buildRepository();

      expect(
        PaymentStrategy.from(
          PaymentType.standard,
          repository,
          scannedCode: _goodCode,
        ),
        isA<StandardPaymentStrategy>(),
      );
      expect(
        PaymentStrategy.from(
          PaymentType.qr,
          repository,
          scannedCode: _goodCode,
        ),
        isA<QrPaymentStrategy>(),
      );
    });

    test('a standard payment pays the service it opened with', () async {
      final receipt = await StandardPaymentStrategy(
        _buildRepository(),
      ).pay(2500);

      expect(receipt.serviceName, 'City Power');
      expect(receipt.steps, [
        'Loaded City Power',
        'Checked the amount',
        'Created payment #1042',
      ]);
    });

    test('a QR code the bank does not know is a 404', () async {
      final strategy = PaymentStrategy.from(
        PaymentType.qr,
        _buildRepository(),
        scannedCode: 'nope',
      );

      await expectLater(strategy.pay(2500), throwsA(isA<ServerException>()));
    });

    test('a QR payment switches to the merchant behind the code', () async {
      final receipt = await PaymentStrategy.from(
        PaymentType.qr,
        _buildRepository(),
        scannedCode: _goodCode,
      ).pay(2500);

      expect(receipt.serviceName, 'Coffee Bar');
      expect(receipt.steps, [
        'Loaded QR payment',
        'Switched to Coffee Bar',
        'Checked the amount',
        'Created payment #1042',
      ]);
    });
  });

  group('PaymentBloc', () {
    test('goes paying, then success', () async {
      final bloc = PaymentBloc(StandardPaymentStrategy(_buildRepository()))
        ..add(const PaymentEvent.submitted(2500));

      await expectLater(
        bloc.stream,
        emitsInOrder([
          const PaymentState.paying(),
          isA<SuccessPaymentState>().having(
            (state) => state.receipt,
            'receipt',
            isA<PaymentReceipt>(),
          ),
        ]),
      );
    });

    test('ends in failure when the backend fails', () async {
      final bloc = PaymentBloc(
        StandardPaymentStrategy(_buildRepository(failureRate: 1)),
      )..add(const PaymentEvent.submitted(2500));

      await expectLater(
        bloc.stream,
        emitsInOrder([const PaymentState.paying(), isA<FailurePaymentState>()]),
      );
    });
  });

  group('screen', () {
    setUp(() {
      getIt.registerFactory(_buildRepository);
    });

    tearDown(getIt.reset);

    testWidgets('a standard payment shows its receipt', (tester) async {
      await tester.pumpApp(const PaymentFlowScreen());

      await tester.tap(find.text('Pay'));
      await tester.pumpAndSettle();

      expect(find.text('City Power'), findsOneWidget);
      expect(find.text('Created payment #1042'), findsOneWidget);
      expect(find.text(r'$25.00'), findsNWidgets(2));
    });

    testWidgets('a QR payment shows the switch to the merchant', (
      tester,
    ) async {
      await tester.pumpApp(const PaymentFlowScreen());

      await tester.tap(find.text('QR code'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Pay'));
      await tester.pumpAndSettle();

      expect(find.text('Switched to Coffee Bar'), findsOneWidget);
      expect(find.text('Coffee Bar'), findsOneWidget);
    });
  });
}
