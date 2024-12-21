extension DateTimeString on String {
  DateTime toDateTime() {
    List<String> parts = split('/');
    return DateTime(
        int.parse(parts[2]), // year
        int.parse(parts[1]), // month
        int.parse(parts[0]) // day
        );
  }
}

extension DateTimeFormatter on DateTime {
  String toDateString() {
    return '$day/$month/$year';
  }
}
