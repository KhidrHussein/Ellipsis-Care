// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'failed_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FailedApiResponse _$FailedApiResponseFromJson(Map<String, dynamic> json) =>
    FailedApiResponse(
      status: json['status'] as String,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$FailedApiResponseToJson(FailedApiResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
