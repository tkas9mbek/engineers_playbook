import 'package:playbook_toolkit/data/exceptions/app_exception.dart';

/// The one place that turns an [AppException] into words.
///
/// Widgets never check which exception it was. They show [message], or
/// [snackbarMessage] when space is tight, and ask `exception.canRetry`
/// whether to offer a retry. The switch is exhaustive, so a new exception
/// will not compile until it has a message.
extension AppExceptionUi on AppException {
  String get message => switch (this) {
    NoInternetException() =>
      'Could not connect to the server. Check your internet connection.',
    ServerException(:final message) =>
      message ?? 'Request failed, please try again later.',
    UnauthorizedException(:final message) =>
      message ?? 'Please log in to continue.',
    ForbiddenException(:final message) =>
      message ?? "You don't have permission to view this page.",
    InternalServerErrorException(:final message) =>
      message ??
          'The server is temporarily unavailable. Please try again later.',
    UnknownException() => 'Something went wrong.',
    DevelopmentException() =>
      'Application error! Please report it to the developers.',
    UrlLaunchFailedException() => 'Could not open the link.',
  };

  /// A shorter text for a snackbar. Only a few exceptions need one.
  String get snackbarMessage => switch (this) {
    NoInternetException() => 'No connection to the server',
    ForbiddenException(:final message) =>
      message ?? "You don't have permission to do this.",
    _ => message,
  };
}
