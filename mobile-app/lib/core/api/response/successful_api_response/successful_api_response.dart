import 'package:json_annotation/json_annotation.dart';

part 'successful_api_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class SuccessfulApiResponse<T> {
  const SuccessfulApiResponse({
    required this.status,
    required this.message,
    this.data,
  });

  final String status;
  final String message;
  final T? data;

  factory SuccessfulApiResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$SuccessfulApiResponseFromJson(json, fromJsonT);
}
