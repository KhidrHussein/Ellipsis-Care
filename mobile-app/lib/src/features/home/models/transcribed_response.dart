// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'transcribed_response.g.dart';

@JsonSerializable()
class TranscribedResponse {
  const TranscribedResponse({
    required this.aiResponse,
    required this.transcription,
    required this.audio,
  });

  final List<String> aiResponse;
  final List<String> transcription;
  final String audio;

  factory TranscribedResponse.fromJson(Map<String, dynamic> json) =>
      _$TranscribedResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TranscribedResponseToJson(this);

  @override
  String toString() => 'TranscribedResponse(aiResponse: $aiResponse, transcription: $transcription, audio: $audio)';
}
