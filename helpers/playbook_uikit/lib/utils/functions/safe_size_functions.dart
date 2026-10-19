import 'package:flutter/material.dart';

/// The padding of a scrollable screen: 16 on every side, and the bottom safe
/// area (home indicator) added below the last item.
EdgeInsets getScreenPadding(BuildContext context) => EdgeInsets.only(
  left: 16,
  top: 16,
  right: 16,
  bottom: 16 + MediaQuery.paddingOf(context).bottom,
);
