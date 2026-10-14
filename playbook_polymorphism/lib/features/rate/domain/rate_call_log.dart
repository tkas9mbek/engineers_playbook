/// What happened on each call to the backend, in order. The logging
/// decorator writes to it; the screen reads it.
class RateCallLog {
  final List<String> _entries = [];

  List<String> get entries => List.unmodifiable(_entries);

  void add(String entry) => _entries.add(entry);

  void clear() => _entries.clear();
}
