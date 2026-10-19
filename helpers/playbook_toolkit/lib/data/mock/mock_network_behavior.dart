import 'dart:math';

import 'package:playbook_toolkit/data/exceptions/app_exception.dart';

/// Latency and flakiness shared by every `Mock*DataSource`, so delays and
/// random failures reach every screen the same way.
///
/// Call [simulate] to wait and maybe fail. Call [delay] to only wait, when a
/// mock must never fail at random.
class MockNetworkBehavior {
  const MockNetworkBehavior({
    this.wait = const Duration(milliseconds: 500),
    this.failureRate = 0.05,
    this.random,
  });

  /// No wait and no random failure — for tests.
  const MockNetworkBehavior.instant()
    : this(wait: Duration.zero, failureRate: 0);

  final Duration wait;

  /// Probability (0.0 … 1.0) that [simulate] throws.
  final double failureRate;

  /// Injected for deterministic tests; a shared [Random] when null.
  final Random? random;

  static final _shared = Random();

  Future<void> delay() => Future<void>.delayed(wait);

  /// Waits, then fails with a backend-shaped error at [failureRate].
  Future<void> simulate() async {
    await delay();

    if (chance(failureRate)) {
      throw const InternalServerErrorException(
        message: 'Internal server error',
      );
    }
  }

  /// Varies a response shape (e.g. an occasional empty list).
  bool chance(double rate) => (random ?? _shared).nextDouble() < rate;
}
