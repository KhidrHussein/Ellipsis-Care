import 'package:freezed_annotation/freezed_annotation.dart';

import '../exceptions/exceptions.dart';

part 'response.freezed.dart';
part 'response.g.dart';

typedef ApiResult = ({ApiResponse? response, AppExceptions? exception});

@Freezed(genericArgumentFactories: true)
sealed class ApiResponse<T> with _$ApiResponse<T> {
  const factory ApiResponse({
    required String success,
    required String message,
    T? data,
  }) = _ApiResponse<T>;

  factory ApiResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$ApiResponseFromJson(json, fromJsonT);
}
