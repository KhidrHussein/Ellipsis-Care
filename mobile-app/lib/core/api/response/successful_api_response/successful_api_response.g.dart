// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'successful_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuccessfulApiResponse<T> _$SuccessfulApiResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    SuccessfulApiResponse<T>(
      status: json['status'] as String,
      message: json['message'] as String,
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
    );

Map<String, dynamic> _$SuccessfulApiResponseToJson<T>(
  SuccessfulApiResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
