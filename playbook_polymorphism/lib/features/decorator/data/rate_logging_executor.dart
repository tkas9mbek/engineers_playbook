import 'package:playbook_polymorphism/features/decorator/domain/rate_call_log.dart';
import 'package:playbook_toolkit/data/repository_executor/repository_executor_decorator.dart';

/// A decorator written for this demo: it writes every call to a [RateCallLog]
/// and changes nothing else. Wrapping it needs no change in the other
/// executors or in the repository.
///
/// The log lines are plain English so the screen can print them as they are.
/// A real logger would write to a file or a service.
class RateLoggingExecutor extends RepositoryExecutorDecorator {
  const RateLoggingExecutor(super.wrapped, this._log);

  final RateCallLog _log;

  @override
  Future<T> execute<T>(Future<T> Function() function) async {
    _log.add('Calling the backend');

    try {
      final result = await wrapped.execute(function);
      _log.add('Backend answered');

      return result;
    } on Exception catch (e) {
      _log.add('Backend failed: $e');
      rethrow;
    }
  }
}
