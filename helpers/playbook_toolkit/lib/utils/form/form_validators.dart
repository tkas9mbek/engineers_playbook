import 'package:flutter/material.dart';

/// Reusable [FormFieldValidator]s with English default messages.
class FormValidators {
  /// Returns a validator that fails when the value is null, empty, or a
  /// blank string. Empty lists are also rejected.
  static FormFieldValidator<T> required<T>({String? message}) => (value) {
    if (value == null ||
        value.toString().trim().isEmpty ||
        (value is List && value.isEmpty)) {
      return message ?? 'Required field';
    }

    return null;
  };

  /// Returns a validator that fails when the value is non-empty and does
  /// not match an `http(s)://` URL pattern. Empty values pass — combine
  /// with [required] to forbid them.
  static FormFieldValidator<T> url<T>({String? message}) => (value) {
    if (value == null || value.toString().trim().isEmpty) {
      return null;
    }

    final urlPattern = RegExp(
      r'^(http|https):\/\/[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)+([/?].*)?$',
      caseSensitive: false,
    );

    if (!urlPattern.hasMatch(value.toString())) {
      return message ?? 'Invalid URL format';
    }

    return null;
  };

  /// Returns a validator that fails when the value is non-empty and does
  /// not look like an email address. Empty values pass — combine with
  /// [required] to forbid them.
  static FormFieldValidator<String> email({String? message}) => (value) {
    if (value == null || value.trim().isEmpty) {
      return null;
    }

    final emailPattern = RegExp(r'^[\w.+-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)+$');

    if (!emailPattern.hasMatch(value.trim())) {
      return message ?? 'Invalid email format';
    }

    return null;
  };

  /// Returns a validator that fails when the value is shorter than
  /// [minLength] (backend requires at least 6 characters). Empty values
  /// pass — combine with [required] to forbid them.
  static FormFieldValidator<String> passwordMinLength({
    int minLength = 6,
    String? message,
  }) => (value) {
    if (value == null || value.isEmpty) {
      return null;
    }

    if (value.length < minLength) {
      return message ?? 'Password must be at least $minLength characters';
    }

    return null;
  };

  /// Returns a validator that strips formatting characters and fails when
  /// the remaining digits do not match [pattern] (e.g. a remote-config
  /// country rule). Empty values pass — combine with [required].
  static FormFieldValidator<String> phonePattern({
    required String pattern,
    String? message,
  }) => (value) {
    if (value == null || value.trim().isEmpty) {
      return null;
    }

    final digits = value.replaceAll(RegExp('[^0-9]'), '');

    if (!RegExp(pattern).hasMatch(digits)) {
      return message ?? 'For example, +7 (123) 456-78-90';
    }

    return null;
  };

  /// Returns a validator that fails when the value's length is outside
  /// the 10–16 character range. Empty values pass — combine with
  /// [required] to forbid them.
  static FormFieldValidator<String> phone({String? message}) => (value) {
    if (value == null || value.trim().isEmpty) {
      return null;
    }

    if (value.length < 10 || value.length > 16) {
      return message ?? 'For example, +7 (123) 456-78-90';
    }

    return null;
  };
}
