// ignore_for_file: public_member_api_docs, sort_constructors_first
class Event {
  final String name;
  final String content;
  final int timeInHours;
  final int timeInMinutes;
  final int day;
  final int month;
  final int year;

  Event({
    required this.name,
    required this.content,
    required this.timeInHours,
    required this.timeInMinutes,
    required this.day,
    required this.month,
    required this.year,
  });

  Event copyWith({
    String? name,
    String? content,
    int? timeInHours,
    int? timeInMinutes,
    int? day,
    int? month,
    int? year,
  }) {
    return Event(
      name: name ?? this.name,
      content: content ?? this.content,
      timeInHours: timeInHours ?? this.timeInHours,
      timeInMinutes: timeInMinutes ?? this.timeInMinutes,
      day: day ?? this.day,
      month: month ?? this.month,
      year: year ?? this.year,
    );
  }

  @override
  String toString() {
    return 'Event(name: $name, content: $content, timeInHours: $timeInHours, timeInMinutes: $timeInMinutes, day: $day, month: $month, year: $year)';
  }
}
