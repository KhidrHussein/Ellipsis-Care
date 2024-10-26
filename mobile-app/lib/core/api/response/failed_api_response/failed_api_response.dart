import 'package:json_annotation/json_annotation.dart';

part 'failed_api_response.g.dart';

@JsonSerializable()
class FailedApiResponse {
  const FailedApiResponse({required this.status, this.error});

  final String status;
  final String? error;

  factory FailedApiResponse.fromJson(Map<String, dynamic> json) =>
      _$FailedApiResponseFromJson(json);
}
