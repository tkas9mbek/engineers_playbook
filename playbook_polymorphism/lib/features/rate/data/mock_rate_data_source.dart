import 'package:playbook_polymorphism/features/rate/domain/rate_data_source.dart';
import 'package:playbook_toolkit/data/exceptions/app_exception.dart';
import 'package:playbook_toolkit/data/mock/mock_network_behavior.dart';

/// A flaky backend: two calls in a row fail with a 503, the third one works,
/// and so on. Enough to see the retry decorator do its job.
class MockRateDataSource implements RateDataSource {
  MockRateDataSource(this._network);

  final MockNetworkBehavior _network;

  int _calls = 0;

  @override
  Future<double> getRate() async {
    await _network.delay();
    _calls++;

    if (_calls % 3 != 0) {
      throw const ServerException(
        statusCode: 503,
        message: 'Service unavailable',
      );
    }

    return 89.45;
  }
}
