/// Money is kept as whole cents (an `int`), never as a `double`: `0.1 + 0.2`
/// is not `0.3` in floating point. Turn cents into text only at the edge.
extension CentsFormat on int {
  /// `125040` -> `1250.40`.
  String toDollars() {
    final cents = abs();
    final sign = this < 0 ? '-' : '';

    return '$sign${cents ~/ 100}.${(cents % 100).toString().padLeft(2, '0')}';
  }

  /// `200000` -> `2000`. Drops the cents.
  String toWholeDollars() => '${this ~/ 100}';
}
