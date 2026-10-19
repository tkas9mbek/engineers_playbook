import 'package:flutter_test/flutter_test.dart';
import 'package:playbook_toolkit/data/exceptions/app_exception.dart';
import 'package:playbook_toolkit/data/repository_executor/error_handling_executor.dart';
import 'package:playbook_toolkit/data/repository_executor/raw_repository_executor.dart';

void main() {
  const executor = ErrorHandlingExecutor(RawRepositoryExecutor());

  test('an AppException passes through untouched', () async {
    const failure = NoInternetException();

    await expectLater(
      executor.execute<void>(() async => throw failure),
      throwsA(same(failure)),
    );
  });

  test('an unexpected error becomes an UnknownException', () async {
    final bug = StateError('boom');

    await expectLater(
      executor.execute<void>(() async => throw bug),
      throwsA(
        isA<UnknownException>().having((e) => e.error, 'error', same(bug)),
      ),
    );
  });
}
