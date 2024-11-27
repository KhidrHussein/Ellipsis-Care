// ignore_for_file: public_member_api_docs, sort_constructors_first
class NotificationEvent {
  final String name;
  final String content;
  final String customSoundFilePath;
  final int eventTimeInHours;
  final int eventTimeInMinutes;

  NotificationEvent({
    required this.name,
    required this.content,
    required this.customSoundFilePath,
    required this.eventTimeInHours,
    required this.eventTimeInMinutes,
  });

  @override
  String toString() {
    return 'NotificationEvent(name: $name, content: $content, customSoundFilePath: $customSoundFilePath, eventTimeInHours: $eventTimeInHours, eventTimeInMinutes: $eventTimeInMinutes)';
  }
}
