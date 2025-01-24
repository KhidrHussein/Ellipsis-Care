import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response.freezed.dart';
part 'api_response.g.dart';

@Freezed(genericArgumentFactories: true)
class ApiResponse<T> with _$ApiResponse<T> {
  const factory ApiResponse({
    required String status,
    required String message,
    T? data,
    List<String>? errors,
  }) = _ApiResponse;

  factory ApiResponse.fromJson(
          Map<String, Object?> json, T Function(Object? json) fromJsonT) =>
      _$ApiResponseFromJson(json, fromJsonT);
}
