import 'package:playbook_toolkit/data/exceptions/app_exception.dart';
import 'package:playbook_toolkit/data/repository_executor/repository_executor_decorator.dart';

/// Normalizes any thrown error into an [AppException].
///
/// Must sit innermost (closest to the raw executor) so outer decorators such as
/// the retry executor see already-normalized [AppException]s.
class ErrorHandlingExecutor extends RepositoryExecutorDecorator {
  const ErrorHandlingExecutor(super.wrapped);

  @override
  Future<T> execute<T>(Future<T> Function() function) async {
    try {
      return await wrapped.execute(function);
    } on AppException {
      rethrow;
    } catch (e) {
      var isDebugMode = false;
      assert(() {
        isDebugMode = true;

        return true;
      }());

      // Surface unexpected errors in debug; hide them behind a generic exception in release.
      if (isDebugMode) {
        rethrow;
      }

      throw const DevelopmentException();
    }
  }
}
