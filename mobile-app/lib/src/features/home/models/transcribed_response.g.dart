// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transcribed_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TranscribedResponse _$TranscribedResponseFromJson(Map<String, dynamic> json) =>
    TranscribedResponse(
      aiResponse: (json['aiResponse'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      transcription: (json['transcription'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      audio: json['audio'] as String,
    );

Map<String, dynamic> _$TranscribedResponseToJson(
        TranscribedResponse instance) =>
    <String, dynamic>{
      'aiResponse': instance.aiResponse,
      'transcription': instance.transcription,
      'audio': instance.audio,
    };
