import 'dart:developer';

import 'package:playbook_toolkit/data/exceptions/app_exception.dart';
import 'package:playbook_toolkit/data/repository_executor/repository_executor_decorator.dart';

/// Normalizes any thrown error into an [AppException].
///
/// In a real app the data source maps Dio and socket errors to [AppException].
/// Here the mocks throw [AppException] directly. Anything else is a surprise:
/// it is logged with its stack trace and wrapped in an [UnknownException], so
/// the UI always gets something it can show and a loader never spins forever.
///
/// Wrap it inside the retry executor, so retry only ever sees
/// [AppException]s. Decorators that only watch the call (like logging) can sit
/// inside it.
class ErrorHandlingExecutor extends RepositoryExecutorDecorator {
  const ErrorHandlingExecutor(super.wrapped);

  @override
  Future<T> execute<T>(Future<T> Function() function) async {
    try {
      return await wrapped.execute(function);
    } on AppException {
      rethrow;
    } catch (error, stackTrace) {
      log('Unexpected error', error: error, stackTrace: stackTrace);

      throw UnknownException(error: error, stackTrace: stackTrace);
    }
  }
}
