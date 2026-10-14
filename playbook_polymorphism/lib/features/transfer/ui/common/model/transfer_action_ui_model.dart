import 'package:flutter/widgets.dart';

/// One way to send money, e.g. "To a card", as the screen shows it.
class TransferActionUiModel {
  const TransferActionUiModel({required this.title, required this.icon});

  final String title;
  final IconData icon;
}
