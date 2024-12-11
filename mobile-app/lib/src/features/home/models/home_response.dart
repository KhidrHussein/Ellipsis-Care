class HomeResponse {
  const HomeResponse({
    required this.ai,
    required this.user,
    required this.createdAt,
    required this.bytes,
  });

  final List<String> ai;
  final List<String> user;
  final List<int> bytes;
  final String createdAt;

  @override
  String toString() => 'HomeResponse(ai: $ai, user: $user, bytes: $bytes)';
}
