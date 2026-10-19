/// The one exception type the data layer lets out. Pure Dart: no texts, no UI.
///
/// The UI turns it into words in one place, `AppExceptionUi` in
/// `playbook_uikit`. The switch there is exhaustive, so a new subtype will not
/// compile until it has a message.
sealed class AppException implements Exception {
  const AppException();

  /// Exception type identifier used for logging.
  String get name;

  @override
  String toString() => name;

  bool get canRetry;
}

/// No internet connection
final class NoInternetException extends AppException {
  const NoInternetException();

  @override
  String get name => 'NoInternet';

  @override
  bool get canRetry => true;
}

/// Server error with status code and optional message
final class ServerException extends AppException {
  const ServerException({required this.statusCode, this.message});

  final int? statusCode;
  final String? message;

  @override
  String get name => 'Server';

  @override
  bool get canRetry => true;

  @override
  String toString() => '$name(statusCode: $statusCode, message: $message)';
}

/// Authentication error (401)
final class UnauthorizedException extends AppException {
  const UnauthorizedException({this.message});

  final String? message;

  @override
  String get name => 'Unauthorized';

  @override
  bool get canRetry => false;

  @override
  String toString() => '$name(message: $message)';
}

/// Forbidden error (403)
final class ForbiddenException extends AppException {
  const ForbiddenException({this.message});

  final String? message;

  @override
  String get name => 'Forbidden';

  @override
  bool get canRetry => false;

  @override
  String toString() => '$name(message: $message)';
}

/// Internal server error (500)
final class InternalServerErrorException extends AppException {
  const InternalServerErrorException({this.message});

  final String? message;

  @override
  String get name => 'InternalServerError';

  @override
  bool get canRetry => true;

  @override
  String toString() => '$name(message: $message)';
}

/// Unknown/unexpected error with details
final class UnknownException extends AppException {
  const UnknownException({required this.error, required this.stackTrace});

  final Object error;
  final StackTrace stackTrace;

  @override
  String get name => 'Unknown';

  /// An unexpected error is often a bug, and retrying a bug only repeats it.
  @override
  bool get canRetry => false;

  @override
  String toString() => '$name($error)';
}

/// Development/programming error
final class DevelopmentException extends AppException {
  const DevelopmentException();

  @override
  String get name => 'Development';

  @override
  bool get canRetry => false;
}

/// URL launch failure
final class UrlLaunchFailedException extends AppException {
  const UrlLaunchFailedException();

  @override
  String get name => 'UrlLaunchFailed';

  @override
  bool get canRetry => false;
}
