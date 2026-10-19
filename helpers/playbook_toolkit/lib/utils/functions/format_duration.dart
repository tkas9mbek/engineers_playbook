/// Formats [duration] as "Xh Ym" text, e.g. `2 h 5 min`.
///
/// Drops the hours component when [duration] is shorter than one hour.
String formatDuration(Duration duration) {
  final hours = duration.inHours;
  final minutes = duration.inMinutes.remainder(60);

  if (hours == 0) {
    return '$minutes min';
  }

  return '$hours h $minutes min';
}
