// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class HealthTip {
  final int id;
  final String transcription;
  final String ai_response;
  final String created_at;
  
  HealthTip({
    required this.id,
    required this.transcription,
    required this.ai_response,
    required this.created_at,
  });

  HealthTip copyWith({
    int? id,
    String? transcription,
    String? ai_response,
    String? created_at,
  }) {
    return HealthTip(
      id: id ?? this.id,
      transcription: transcription ?? this.transcription,
      ai_response: ai_response ?? this.ai_response,
      created_at: created_at ?? this.created_at,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'transcription': transcription,
      'ai_response': ai_response,
      'created_at': created_at,
    };
  }

  factory HealthTip.fromMap(Map<String, dynamic> map) {
    return HealthTip(
      id: map['id'] as int,
      transcription: map['transcription'] as String,
      ai_response: map['ai_response'] as String,
      created_at: map['created_at'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory HealthTip.fromJson(String source) =>
      HealthTip.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HealthTip(id: $id, transcription: $transcription, ai_response: $ai_response, created_at: $created_at)';
  }

  @override
  bool operator ==(covariant HealthTip other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.transcription == transcription &&
        other.ai_response == ai_response &&
        other.created_at == created_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        transcription.hashCode ^
        ai_response.hashCode ^
        created_at.hashCode;
  }
}
