import 'package:intl/intl.dart';

class MoneyConverters {
  static NumberFormat numberFormat({required String? symbol}) =>
      NumberFormat.currency(
        customPattern: '###,### ${symbol ?? ''}',
        symbol: symbol,
        decimalDigits: 0,
      );

  static String amountToString(
    num amount, {
    bool showSymbol = true,
    bool showSign = false,
    String? symbol,
  }) {
    final formattedValue = numberFormat(
      symbol: showSymbol ? symbol ?? r'$' : null,
    ).format(amount);

    if (showSign && amount > 0) {
      return '+$formattedValue';
    }

    return formattedValue;
  }
}
