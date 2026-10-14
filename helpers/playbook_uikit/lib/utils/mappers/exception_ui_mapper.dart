import 'package:playbook_toolkit/data/exceptions/app_exception.dart';
import 'package:playbook_uikit/models/exception_ui_model.dart';

/// Turns a domain [AppException] into the text the UI shows.
///
/// This is the one place that switches on the exception type. Widgets only
/// read the [ExceptionUiModel], so they never check which exception it was.
class ExceptionUiMapper {
  const ExceptionUiMapper();

  ExceptionUiModel map(AppException exception) => switch (exception) {
    NoInternetException() => const ExceptionUiModel(
      title: 'No connection to server',
      description:
          'Could not connect to server. This may be due to server issues '
          'or your internet connection.',
      snackbarDescription: 'No connection to server',
    ),
    ServerException(:final message) => ExceptionUiModel(
      title: 'Error while making request',
      description: message ?? 'Request failed, please try again later',
      snackbarDescription: message ?? 'Request failed, please try again later',
    ),
    UnauthorizedException(:final message) => ExceptionUiModel.noRetry(
      description: message ?? 'Please log in to continue',
    ),
    ForbiddenException(:final message) => ExceptionUiModel.noRetry(
      description: message ?? "You don't have permission to view this page.",
      snackbarDescription:
          message ?? "You don't have permission to perform this action.",
    ),
    InternalServerErrorException(:final message) => ExceptionUiModel(
      title: 'Server maintenance in progress',
      description:
          message ??
          'Sorry for the inconvenience, the server is temporarily '
              'unavailable. Please try again later.',
      snackbarDescription:
          message ??
          'Sorry for the inconvenience, the server is temporarily '
              'unavailable. Please try again later.',
    ),
    UnknownException() => const ExceptionUiModel.simple(
      description: 'Something went wrong.',
    ),
    DevelopmentException() => const ExceptionUiModel.noRetry(
      description: 'Application error! Please report to developers.',
    ),
    UrlLaunchFailedException() => const ExceptionUiModel.noRetry(
      description: 'Error opening link',
    ),
  };
}
