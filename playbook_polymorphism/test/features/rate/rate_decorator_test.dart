import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:playbook_polymorphism/core/global/global_variables.dart';
import 'package:playbook_polymorphism/features/rate/data/mock_rate_data_source.dart';
import 'package:playbook_polymorphism/features/rate/data/rate_logging_executor.dart';
import 'package:playbook_polymorphism/features/rate/domain/rate_call_log.dart';
import 'package:playbook_polymorphism/features/rate/domain/rate_repository.dart';
import 'package:playbook_polymorphism/features/rate/ui/bloc/rate_details_bloc.dart';
import 'package:playbook_polymorphism/features/rate/ui/screen/rate_decorator_screen.dart';
import 'package:playbook_toolkit/data/mock/mock_network_behavior.dart';
import 'package:playbook_toolkit/data/repository_executor/error_handling_executor.dart';
import 'package:playbook_toolkit/data/repository_executor/raw_repository_executor.dart';
import 'package:playbook_toolkit/data/repository_executor/retry_executor.dart';

import '../../support/pump_app.dart';

const _failed =
    'Backend failed: Server(statusCode: 503, message: Service unavailable)';

RateRepository _repository(RateCallLog log, {int maxRetries = 3}) =>
    RateRepository(
      RetryExecutor(
        ErrorHandlingExecutor(
          RateLoggingExecutor(const RawRepositoryExecutor(), log),
        ),
        maxRetries: maxRetries,
        retryDelay: Duration.zero,
      ),
      MockRateDataSource(const MockNetworkBehavior.instant()),
    );

void main() {
  test('the retry decorator hides two failures, the logger saw them', () async {
    final log = RateCallLog();

    final rate = await _repository(log).getRate();

    expect(rate, 89.45);
    expect(log.entries, [
      'Calling the backend',
      _failed,
      'Calling the backend',
      _failed,
      'Calling the backend',
      'Backend answered',
    ]);
  });

  test('with only two attempts the failure gets through', () async {
    final log = RateCallLog();

    await expectLater(
      _repository(log, maxRetries: 2).getRate(),
      throwsA(isA<Exception>()),
    );
    expect(log.entries, hasLength(4));
  });

  test('RateDetailsBloc goes loading, then success with the calls', () async {
    final log = RateCallLog();
    final bloc = RateDetailsBloc(_repository(log), log)
      ..add(const RateDetailsEvent.requested());

    await expectLater(
      bloc.stream,
      emitsInOrder([
        const RateDetailsState.loading(),
        isA<SuccessRateDetailsState>()
            .having((state) => state.rate, 'rate', 89.45)
            .having((state) => state.calls, 'calls', hasLength(6)),
      ]),
    );
  });

  test('RateDetailsBloc ends in failure when retries run out', () async {
    final log = RateCallLog();
    final bloc = RateDetailsBloc(_repository(log, maxRetries: 2), log)
      ..add(const RateDetailsEvent.requested());

    await expectLater(
      bloc.stream,
      emitsInOrder([
        const RateDetailsState.loading(),
        isA<FailureRateDetailsState>(),
      ]),
    );
  });

  group('screen', () {
    setUp(() {
      final log = RateCallLog();
      getIt.registerFactory(() => RateDetailsBloc(_repository(log), log));
    });

    tearDown(getIt.reset);

    testWidgets('shows the rate and what the decorators did', (tester) async {
      await tester.pumpApp(const RateDecoratorScreen());

      expect(find.text('Decorator'), findsOneWidget);
      expect(find.text('USD rate'), findsNothing);

      await tester.tap(find.text('Get the USD rate'));
      await tester.pumpAndSettle();

      expect(find.text('USD rate'), findsOneWidget);
      expect(find.text('89.45 KGS'), findsOneWidget);
      expect(find.text('Backend answered'), findsOneWidget);
      expect(find.text(_failed), findsNWidgets(2));
      expect(find.byType(ListView), findsOneWidget);
    });
  });
}
