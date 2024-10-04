import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'exceptions.freezed.dart';

@freezed
abstract class AppExceptions with _$AppExceptions implements Exception {
  const factory AppExceptions.requestCancelled() = _RequestCancelled;
  const factory AppExceptions.unauthorizedRequest(String? reason) =
      _UnauthorizedRequest;
  const factory AppExceptions.badRequest(String? error) = _BadRequest;
  const factory AppExceptions.notFound(String? reason) = _NotFound;
  const factory AppExceptions.methodNotAllowed() = _MethodNotAllowed;
  const factory AppExceptions.notAcceptable() = _NotAcceptable;
  const factory AppExceptions.requestTimeout() = _RequestTimeout;
  const factory AppExceptions.sendTimeout() = _SendTimeout;
  const factory AppExceptions.receiveTimeout() = _ReceiveTimeout;
  const factory AppExceptions.unprocessableEntity(String? reason) =
      _UnprocessableEntity;
  const factory AppExceptions.conflict() = _Conflict;
  const factory AppExceptions.internalServerError() = _InternalServerError;
  const factory AppExceptions.notImplemented() = _NotImplemented;
  const factory AppExceptions.serviceUnavailable() = _ServiceUnavailable;
  const factory AppExceptions.noInternetConnection() = _NoInternetConnection;
  const factory AppExceptions.formatException() = _FormatException;
  const factory AppExceptions.unableToProcess() = _UnableToProcess;
  const factory AppExceptions.defaultError(String? error) = _DefaultError;
  const factory AppExceptions.unexpectedError() = _UnexpectedError;

  static AppExceptions _handleResponse(Response<dynamic>? response) {
    int statusCode = response?.statusCode ?? 0;

    switch (statusCode) {
      case 400:
        return AppExceptions.badRequest(response?.statusMessage);
      case 401:
        return AppExceptions.unauthorizedRequest(response?.statusMessage);
      case 403:
        return AppExceptions.unauthorizedRequest(response?.statusMessage);
      case 404:
        return AppExceptions.notFound(response?.statusMessage);
      case 408:
        return const AppExceptions.requestTimeout();
      case 409:
        return const AppExceptions.conflict();
      case 422:
        return AppExceptions.unprocessableEntity(response?.statusMessage);
      case 500:
        return const AppExceptions.internalServerError();
      case 503:
        return const AppExceptions.serviceUnavailable();
      default:
        return AppExceptions.defaultError(
          "Received invalid status code: $statusCode",
        );
    }
  }

  static AppExceptions handleExceptions(error) {
    if (error is Exception) {
      try {
        AppExceptions networkExceptions;
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.cancel:
              networkExceptions = const AppExceptions.requestCancelled();
              break;
            case DioExceptionType.connectionTimeout:
              networkExceptions = const AppExceptions.requestTimeout();
              break;
            case DioExceptionType.receiveTimeout:
              networkExceptions = const AppExceptions.receiveTimeout();
              break;
            case DioExceptionType.sendTimeout:
              networkExceptions = const AppExceptions.sendTimeout();
              break;
            case DioExceptionType.connectionError:
              networkExceptions = const AppExceptions.noInternetConnection();
              break;
            case DioExceptionType.badCertificate:
              networkExceptions = const AppExceptions.internalServerError();
              break;
            case DioExceptionType.badResponse:
              networkExceptions = _handleResponse(error.response);
              break;
            default:
              networkExceptions = AppExceptions.defaultError(error.message);
          }
        } else if (error is SocketException) {
          networkExceptions = const AppExceptions.noInternetConnection();
        } else {
          networkExceptions = const AppExceptions.unexpectedError();
        }
        return networkExceptions;
      } on FormatException catch (format) {
        format.printLog();
        return const AppExceptions.formatException();
      } catch (e) {
        e.printLog();
        return const AppExceptions.unexpectedError();
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        error.printLog();
        return const AppExceptions.unableToProcess();
      } else {
        return const AppExceptions.unexpectedError();
      }
    }
  }

  static String getErrorMessage(AppExceptions appException) {
    String? errorMessage = "";
    appException.when(
      notImplemented: () {
        errorMessage = "Not Implemented";
      },
      requestCancelled: () {
        errorMessage = "Request Cancelled";
      },
      internalServerError: () {
        errorMessage = "Internal Server Error";
      },
      notFound: (String? reason) {
        errorMessage ??= reason;
      },
      serviceUnavailable: () {
        errorMessage = "Service unavailable";
      },
      methodNotAllowed: () {
        errorMessage = "Method Allowed";
      },
      badRequest: (value) {
        errorMessage = value;
      },
      unauthorizedRequest: (String? error) {
        errorMessage = error;
      },
      unprocessableEntity: (String? error) {
        errorMessage = error;
      },
      unexpectedError: () {
        errorMessage = "Unexpected error occurred";
      },
      requestTimeout: () {
        errorMessage = "Connection request timeout";
      },
      noInternetConnection: () {
        errorMessage = "No internet connection";
      },
      conflict: () {
        errorMessage = "Error due to a conflict";
      },
      sendTimeout: () {
        errorMessage = "Send timeout in connection with API server";
      },
      unableToProcess: () {
        errorMessage = "This credentials does not meet any of our records, "
            "please make sure you have entered the right credentials";
      },
      defaultError: (error) {
        errorMessage = error ?? "";
      },
      formatException: () {
        errorMessage = "Unexpected error occurred";
      },
      notAcceptable: () {
        errorMessage = "Not acceptable";
      },
      receiveTimeout: () {
        errorMessage = "A receive timeout occurred";
      },
    );
    return errorMessage!;
  }
}
