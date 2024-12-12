// ignore_for_file: public_member_api_docs, sort_constructors_first
class ReminderResponse {
  const ReminderResponse({
    required this.title,
    required this.description,
    required this.bytes,
    required this.createdAt,
  });

  final String title;
  final String description;
  final List<int> bytes;
  final String createdAt;

  @override
  String toString() {
    return 'ReminderResponse(title: $title, description: $description, bytes: $bytes, createdAt: $createdAt)';
  }
}
