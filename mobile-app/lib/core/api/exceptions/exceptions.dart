import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

import '../../utils/extensions.dart';

part 'exceptions.freezed.dart';

@freezed
abstract class AppExceptions with _$AppExceptions implements Exception {
  const factory AppExceptions.requestCancelled() = _RequestCancelled;

  const factory AppExceptions.requestTimeout() = _RequestTimeout;

  const factory AppExceptions.sendTimeout() = _SendTimeout;

  const factory AppExceptions.receiveTimeout() = _ReceiveTimeout;

  const factory AppExceptions.badRequest(String? error) = _BadRequest;

  const factory AppExceptions.unauthorizedRequest(String? reason) =
      _UnauthorizedRequest;

  const factory AppExceptions.notFound(String? reason) = _NotFound;

  const factory AppExceptions.unexpectedError() = _UnexpectedError;

  const factory AppExceptions.unprocessableEntity(String? reason) =
      _UnprocessableEntity;

  const factory AppExceptions.internalServerError() = _InternalServerError;

  const factory AppExceptions.serviceUnavailable() = _ServiceUnavailable;

  const factory AppExceptions.noInternetConnection() = _NoInternetConnection;

  const factory AppExceptions.formatException() = _FormatException;

  const factory AppExceptions.defaultError(String? error) = _DefaultError;

  const factory AppExceptions.typeException(String error) = _TypeException;

  const factory AppExceptions.platformException(String? error) =
      _PlatformException;

  static AppExceptions _handleResponse(Response<dynamic>? response) {
    int statusCode = response?.statusCode ?? 0;
    String message = response?.data["message"];

    switch (statusCode) {
      case 400:
        return AppExceptions.badRequest(message);
      case 401:
        return AppExceptions.unauthorizedRequest(message);
      case 403:
        return AppExceptions.unauthorizedRequest(message);
      case 404:
        return AppExceptions.notFound(message);
      case 408:
        return const AppExceptions.requestTimeout();
      case 422:
        return AppExceptions.unprocessableEntity(message);
      case 500:
        return const AppExceptions.internalServerError();
      case 503:
        return const AppExceptions.serviceUnavailable();
      default:
        return AppExceptions.defaultError(
            "Unknown error with status code: $statusCode");
    }
  }

  static AppExceptions handleExceptions(dynamic exception) {
    // printLog(message: exception);

    if (exception is Exception) {
      try {
        AppExceptions networkExceptions;
        if (exception is DioException) {
          switch (exception.type) {
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
              networkExceptions = _handleResponse(exception.response);
              break;

            case DioExceptionType.unknown:
              if (exception.error is SocketException) {
                networkExceptions = const AppExceptions.noInternetConnection();
              } else {
                networkExceptions = const AppExceptions.serviceUnavailable();
              }
              break;
          }
        } else {
          networkExceptions = const AppExceptions.unexpectedError();
        }
        return networkExceptions;
      } on SocketException catch (e) {
        e.printLog();
        return const AppExceptions.noInternetConnection();
      } on PlatformException catch (e) {
        e.printLog();
        return AppExceptions.platformException(e.message);
      } on FormatException catch (e) {
        e.printLog();
        return const AppExceptions.formatException();
      } on TwilioFlutterException catch (e) {
        e.printLog();
        return AppExceptions.serviceUnavailable();
      } catch (e) {
        e.printLog();
        return const AppExceptions.unexpectedError();
      }
    } else {
      if (exception.toString().contains("is not a subtype of")) {
        return AppExceptions.typeException(exception);
      } else {
        return const AppExceptions.unexpectedError();
      }
    }
  }

  static String getErrorMessage(AppExceptions? appException) {
    String? errorMessage;
    appException?.maybeWhen(
      requestCancelled: () {
        errorMessage = "Request Cancelled";
      },
      internalServerError: () {
        errorMessage = "Internal Server Error";
      },
      notFound: (String? reason) {
        errorMessage = reason;
      },
      serviceUnavailable: () {
        errorMessage = "Service unavailable";
      },

      badRequest: (String? message) {
        errorMessage = message;
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
      sendTimeout: () {
        errorMessage = "Send timeout in connection with API server";
      },
      // unableToProcess: () {
      //   errorMessage = "This credentials does not meet any of our records, "
      //       "please make sure you have entered the right credentials";
      // },
      formatException: () {
        errorMessage = "Unexpected error occurred";
      },

      receiveTimeout: () {
        errorMessage = "A receive timeout occurred";
      },
      orElse: () => errorMessage =
          "Oops!, we ran into technical difficulties. Try again later.",
    );

    return errorMessage ?? "";
  }
}
