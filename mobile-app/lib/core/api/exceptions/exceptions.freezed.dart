// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exceptions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppExceptions {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestCancelled,
    required TResult Function() requestTimeout,
    required TResult Function() sendTimeout,
    required TResult Function() receiveTimeout,
    required TResult Function(String? error) badRequest,
    required TResult Function(String? reason) unauthorizedRequest,
    required TResult Function(String? reason) notFound,
    required TResult Function() unexpectedError,
    required TResult Function(String? reason) unprocessableEntity,
    required TResult Function() internalServerError,
    required TResult Function() serviceUnavailable,
    required TResult Function() noInternetConnection,
    required TResult Function() formatException,
    required TResult Function(String? error) defaultError,
    required TResult Function(String error) typeException,
    required TResult Function(String? error) platformException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requestCancelled,
    TResult? Function()? requestTimeout,
    TResult? Function()? sendTimeout,
    TResult? Function()? receiveTimeout,
    TResult? Function(String? error)? badRequest,
    TResult? Function(String? reason)? unauthorizedRequest,
    TResult? Function(String? reason)? notFound,
    TResult? Function()? unexpectedError,
    TResult? Function(String? reason)? unprocessableEntity,
    TResult? Function()? internalServerError,
    TResult? Function()? serviceUnavailable,
    TResult? Function()? noInternetConnection,
    TResult? Function()? formatException,
    TResult? Function(String? error)? defaultError,
    TResult? Function(String error)? typeException,
    TResult? Function(String? error)? platformException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestCancelled,
    TResult Function()? requestTimeout,
    TResult Function()? sendTimeout,
    TResult Function()? receiveTimeout,
    TResult Function(String? error)? badRequest,
    TResult Function(String? reason)? unauthorizedRequest,
    TResult Function(String? reason)? notFound,
    TResult Function()? unexpectedError,
    TResult Function(String? reason)? unprocessableEntity,
    TResult Function()? internalServerError,
    TResult Function()? serviceUnavailable,
    TResult Function()? noInternetConnection,
    TResult Function()? formatException,
    TResult Function(String? error)? defaultError,
    TResult Function(String error)? typeException,
    TResult Function(String? error)? platformException,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestCancelled value) requestCancelled,
    required TResult Function(_RequestTimeout value) requestTimeout,
    required TResult Function(_SendTimeout value) sendTimeout,
    required TResult Function(_ReceiveTimeout value) receiveTimeout,
    required TResult Function(_BadRequest value) badRequest,
    required TResult Function(_UnauthorizedRequest value) unauthorizedRequest,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_UnexpectedError value) unexpectedError,
    required TResult Function(_UnprocessableEntity value) unprocessableEntity,
    required TResult Function(_InternalServerError value) internalServerError,
    required TResult Function(_ServiceUnavailable value) serviceUnavailable,
    required TResult Function(_NoInternetConnection value) noInternetConnection,
    required TResult Function(_FormatException value) formatException,
    required TResult Function(_DefaultError value) defaultError,
    required TResult Function(_TypeException value) typeException,
    required TResult Function(_PlatformException value) platformException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestCancelled value)? requestCancelled,
    TResult? Function(_RequestTimeout value)? requestTimeout,
    TResult? Function(_SendTimeout value)? sendTimeout,
    TResult? Function(_ReceiveTimeout value)? receiveTimeout,
    TResult? Function(_BadRequest value)? badRequest,
    TResult? Function(_UnauthorizedRequest value)? unauthorizedRequest,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_UnexpectedError value)? unexpectedError,
    TResult? Function(_UnprocessableEntity value)? unprocessableEntity,
    TResult? Function(_InternalServerError value)? internalServerError,
    TResult? Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult? Function(_NoInternetConnection value)? noInternetConnection,
    TResult? Function(_FormatException value)? formatException,
    TResult? Function(_DefaultError value)? defaultError,
    TResult? Function(_TypeException value)? typeException,
    TResult? Function(_PlatformException value)? platformException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestCancelled value)? requestCancelled,
    TResult Function(_RequestTimeout value)? requestTimeout,
    TResult Function(_SendTimeout value)? sendTimeout,
    TResult Function(_ReceiveTimeout value)? receiveTimeout,
    TResult Function(_BadRequest value)? badRequest,
    TResult Function(_UnauthorizedRequest value)? unauthorizedRequest,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_UnexpectedError value)? unexpectedError,
    TResult Function(_UnprocessableEntity value)? unprocessableEntity,
    TResult Function(_InternalServerError value)? internalServerError,
    TResult Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult Function(_NoInternetConnection value)? noInternetConnection,
    TResult Function(_FormatException value)? formatException,
    TResult Function(_DefaultError value)? defaultError,
    TResult Function(_TypeException value)? typeException,
    TResult Function(_PlatformException value)? platformException,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppExceptionsCopyWith<$Res> {
  factory $AppExceptionsCopyWith(
          AppExceptions value, $Res Function(AppExceptions) then) =
      _$AppExceptionsCopyWithImpl<$Res, AppExceptions>;
}

/// @nodoc
class _$AppExceptionsCopyWithImpl<$Res, $Val extends AppExceptions>
    implements $AppExceptionsCopyWith<$Res> {
  _$AppExceptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppExceptions
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$RequestCancelledImplCopyWith<$Res> {
  factory _$$RequestCancelledImplCopyWith(_$RequestCancelledImpl value,
          $Res Function(_$RequestCancelledImpl) then) =
      __$$RequestCancelledImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RequestCancelledImplCopyWithImpl<$Res>
    extends _$AppExceptionsCopyWithImpl<$Res, _$RequestCancelledImpl>
    implements _$$RequestCancelledImplCopyWith<$Res> {
  __$$RequestCancelledImplCopyWithImpl(_$RequestCancelledImpl _value,
      $Res Function(_$RequestCancelledImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppExceptions
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RequestCancelledImpl implements _RequestCancelled {
  const _$RequestCancelledImpl();

  @override
  String toString() {
    return 'AppExceptions.requestCancelled()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RequestCancelledImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestCancelled,
    required TResult Function() requestTimeout,
    required TResult Function() sendTimeout,
    required TResult Function() receiveTimeout,
    required TResult Function(String? error) badRequest,
    required TResult Function(String? reason) unauthorizedRequest,
    required TResult Function(String? reason) notFound,
    required TResult Function() unexpectedError,
    required TResult Function(String? reason) unprocessableEntity,
    required TResult Function() internalServerError,
    required TResult Function() serviceUnavailable,
    required TResult Function() noInternetConnection,
    required TResult Function() formatException,
    required TResult Function(String? error) defaultError,
    required TResult Function(String error) typeException,
    required TResult Function(String? error) platformException,
  }) {
    return requestCancelled();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requestCancelled,
    TResult? Function()? requestTimeout,
    TResult? Function()? sendTimeout,
    TResult? Function()? receiveTimeout,
    TResult? Function(String? error)? badRequest,
    TResult? Function(String? reason)? unauthorizedRequest,
    TResult? Function(String? reason)? notFound,
    TResult? Function()? unexpectedError,
    TResult? Function(String? reason)? unprocessableEntity,
    TResult? Function()? internalServerError,
    TResult? Function()? serviceUnavailable,
    TResult? Function()? noInternetConnection,
    TResult? Function()? formatException,
    TResult? Function(String? error)? defaultError,
    TResult? Function(String error)? typeException,
    TResult? Function(String? error)? platformException,
  }) {
    return requestCancelled?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestCancelled,
    TResult Function()? requestTimeout,
    TResult Function()? sendTimeout,
    TResult Function()? receiveTimeout,
    TResult Function(String? error)? badRequest,
    TResult Function(String? reason)? unauthorizedRequest,
    TResult Function(String? reason)? notFound,
    TResult Function()? unexpectedError,
    TResult Function(String? reason)? unprocessableEntity,
    TResult Function()? internalServerError,
    TResult Function()? serviceUnavailable,
    TResult Function()? noInternetConnection,
    TResult Function()? formatException,
    TResult Function(String? error)? defaultError,
    TResult Function(String error)? typeException,
    TResult Function(String? error)? platformException,
    required TResult orElse(),
  }) {
    if (requestCancelled != null) {
      return requestCancelled();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestCancelled value) requestCancelled,
    required TResult Function(_RequestTimeout value) requestTimeout,
    required TResult Function(_SendTimeout value) sendTimeout,
    required TResult Function(_ReceiveTimeout value) receiveTimeout,
    required TResult Function(_BadRequest value) badRequest,
    required TResult Function(_UnauthorizedRequest value) unauthorizedRequest,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_UnexpectedError value) unexpectedError,
    required TResult Function(_UnprocessableEntity value) unprocessableEntity,
    required TResult Function(_InternalServerError value) internalServerError,
    required TResult Function(_ServiceUnavailable value) serviceUnavailable,
    required TResult Function(_NoInternetConnection value) noInternetConnection,
    required TResult Function(_FormatException value) formatException,
    required TResult Function(_DefaultError value) defaultError,
    required TResult Function(_TypeException value) typeException,
    required TResult Function(_PlatformException value) platformException,
  }) {
    return requestCancelled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestCancelled value)? requestCancelled,
    TResult? Function(_RequestTimeout value)? requestTimeout,
    TResult? Function(_SendTimeout value)? sendTimeout,
    TResult? Function(_ReceiveTimeout value)? receiveTimeout,
    TResult? Function(_BadRequest value)? badRequest,
    TResult? Function(_UnauthorizedRequest value)? unauthorizedRequest,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_UnexpectedError value)? unexpectedError,
    TResult? Function(_UnprocessableEntity value)? unprocessableEntity,
    TResult? Function(_InternalServerError value)? internalServerError,
    TResult? Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult? Function(_NoInternetConnection value)? noInternetConnection,
    TResult? Function(_FormatException value)? formatException,
    TResult? Function(_DefaultError value)? defaultError,
    TResult? Function(_TypeException value)? typeException,
    TResult? Function(_PlatformException value)? platformException,
  }) {
    return requestCancelled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestCancelled value)? requestCancelled,
    TResult Function(_RequestTimeout value)? requestTimeout,
    TResult Function(_SendTimeout value)? sendTimeout,
    TResult Function(_ReceiveTimeout value)? receiveTimeout,
    TResult Function(_BadRequest value)? badRequest,
    TResult Function(_UnauthorizedRequest value)? unauthorizedRequest,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_UnexpectedError value)? unexpectedError,
    TResult Function(_UnprocessableEntity value)? unprocessableEntity,
    TResult Function(_InternalServerError value)? internalServerError,
    TResult Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult Function(_NoInternetConnection value)? noInternetConnection,
    TResult Function(_FormatException value)? formatException,
    TResult Function(_DefaultError value)? defaultError,
    TResult Function(_TypeException value)? typeException,
    TResult Function(_PlatformException value)? platformException,
    required TResult orElse(),
  }) {
    if (requestCancelled != null) {
      return requestCancelled(this);
    }
    return orElse();
  }
}

abstract class _RequestCancelled implements AppExceptions {
  const factory _RequestCancelled() = _$RequestCancelledImpl;
}

/// @nodoc
abstract class _$$RequestTimeoutImplCopyWith<$Res> {
  factory _$$RequestTimeoutImplCopyWith(_$RequestTimeoutImpl value,
          $Res Function(_$RequestTimeoutImpl) then) =
      __$$RequestTimeoutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RequestTimeoutImplCopyWithImpl<$Res>
    extends _$AppExceptionsCopyWithImpl<$Res, _$RequestTimeoutImpl>
    implements _$$RequestTimeoutImplCopyWith<$Res> {
  __$$RequestTimeoutImplCopyWithImpl(
      _$RequestTimeoutImpl _value, $Res Function(_$RequestTimeoutImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppExceptions
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RequestTimeoutImpl implements _RequestTimeout {
  const _$RequestTimeoutImpl();

  @override
  String toString() {
    return 'AppExceptions.requestTimeout()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RequestTimeoutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestCancelled,
    required TResult Function() requestTimeout,
    required TResult Function() sendTimeout,
    required TResult Function() receiveTimeout,
    required TResult Function(String? error) badRequest,
    required TResult Function(String? reason) unauthorizedRequest,
    required TResult Function(String? reason) notFound,
    required TResult Function() unexpectedError,
    required TResult Function(String? reason) unprocessableEntity,
    required TResult Function() internalServerError,
    required TResult Function() serviceUnavailable,
    required TResult Function() noInternetConnection,
    required TResult Function() formatException,
    required TResult Function(String? error) defaultError,
    required TResult Function(String error) typeException,
    required TResult Function(String? error) platformException,
  }) {
    return requestTimeout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requestCancelled,
    TResult? Function()? requestTimeout,
    TResult? Function()? sendTimeout,
    TResult? Function()? receiveTimeout,
    TResult? Function(String? error)? badRequest,
    TResult? Function(String? reason)? unauthorizedRequest,
    TResult? Function(String? reason)? notFound,
    TResult? Function()? unexpectedError,
    TResult? Function(String? reason)? unprocessableEntity,
    TResult? Function()? internalServerError,
    TResult? Function()? serviceUnavailable,
    TResult? Function()? noInternetConnection,
    TResult? Function()? formatException,
    TResult? Function(String? error)? defaultError,
    TResult? Function(String error)? typeException,
    TResult? Function(String? error)? platformException,
  }) {
    return requestTimeout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestCancelled,
    TResult Function()? requestTimeout,
    TResult Function()? sendTimeout,
    TResult Function()? receiveTimeout,
    TResult Function(String? error)? badRequest,
    TResult Function(String? reason)? unauthorizedRequest,
    TResult Function(String? reason)? notFound,
    TResult Function()? unexpectedError,
    TResult Function(String? reason)? unprocessableEntity,
    TResult Function()? internalServerError,
    TResult Function()? serviceUnavailable,
    TResult Function()? noInternetConnection,
    TResult Function()? formatException,
    TResult Function(String? error)? defaultError,
    TResult Function(String error)? typeException,
    TResult Function(String? error)? platformException,
    required TResult orElse(),
  }) {
    if (requestTimeout != null) {
      return requestTimeout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestCancelled value) requestCancelled,
    required TResult Function(_RequestTimeout value) requestTimeout,
    required TResult Function(_SendTimeout value) sendTimeout,
    required TResult Function(_ReceiveTimeout value) receiveTimeout,
    required TResult Function(_BadRequest value) badRequest,
    required TResult Function(_UnauthorizedRequest value) unauthorizedRequest,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_UnexpectedError value) unexpectedError,
    required TResult Function(_UnprocessableEntity value) unprocessableEntity,
    required TResult Function(_InternalServerError value) internalServerError,
    required TResult Function(_ServiceUnavailable value) serviceUnavailable,
    required TResult Function(_NoInternetConnection value) noInternetConnection,
    required TResult Function(_FormatException value) formatException,
    required TResult Function(_DefaultError value) defaultError,
    required TResult Function(_TypeException value) typeException,
    required TResult Function(_PlatformException value) platformException,
  }) {
    return requestTimeout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestCancelled value)? requestCancelled,
    TResult? Function(_RequestTimeout value)? requestTimeout,
    TResult? Function(_SendTimeout value)? sendTimeout,
    TResult? Function(_ReceiveTimeout value)? receiveTimeout,
    TResult? Function(_BadRequest value)? badRequest,
    TResult? Function(_UnauthorizedRequest value)? unauthorizedRequest,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_UnexpectedError value)? unexpectedError,
    TResult? Function(_UnprocessableEntity value)? unprocessableEntity,
    TResult? Function(_InternalServerError value)? internalServerError,
    TResult? Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult? Function(_NoInternetConnection value)? noInternetConnection,
    TResult? Function(_FormatException value)? formatException,
    TResult? Function(_DefaultError value)? defaultError,
    TResult? Function(_TypeException value)? typeException,
    TResult? Function(_PlatformException value)? platformException,
  }) {
    return requestTimeout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestCancelled value)? requestCancelled,
    TResult Function(_RequestTimeout value)? requestTimeout,
    TResult Function(_SendTimeout value)? sendTimeout,
    TResult Function(_ReceiveTimeout value)? receiveTimeout,
    TResult Function(_BadRequest value)? badRequest,
    TResult Function(_UnauthorizedRequest value)? unauthorizedRequest,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_UnexpectedError value)? unexpectedError,
    TResult Function(_UnprocessableEntity value)? unprocessableEntity,
    TResult Function(_InternalServerError value)? internalServerError,
    TResult Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult Function(_NoInternetConnection value)? noInternetConnection,
    TResult Function(_FormatException value)? formatException,
    TResult Function(_DefaultError value)? defaultError,
    TResult Function(_TypeException value)? typeException,
    TResult Function(_PlatformException value)? platformException,
    required TResult orElse(),
  }) {
    if (requestTimeout != null) {
      return requestTimeout(this);
    }
    return orElse();
  }
}

abstract class _RequestTimeout implements AppExceptions {
  const factory _RequestTimeout() = _$RequestTimeoutImpl;
}

/// @nodoc
abstract class _$$SendTimeoutImplCopyWith<$Res> {
  factory _$$SendTimeoutImplCopyWith(
          _$SendTimeoutImpl value, $Res Function(_$SendTimeoutImpl) then) =
      __$$SendTimeoutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SendTimeoutImplCopyWithImpl<$Res>
    extends _$AppExceptionsCopyWithImpl<$Res, _$SendTimeoutImpl>
    implements _$$SendTimeoutImplCopyWith<$Res> {
  __$$SendTimeoutImplCopyWithImpl(
      _$SendTimeoutImpl _value, $Res Function(_$SendTimeoutImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppExceptions
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SendTimeoutImpl implements _SendTimeout {
  const _$SendTimeoutImpl();

  @override
  String toString() {
    return 'AppExceptions.sendTimeout()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SendTimeoutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestCancelled,
    required TResult Function() requestTimeout,
    required TResult Function() sendTimeout,
    required TResult Function() receiveTimeout,
    required TResult Function(String? error) badRequest,
    required TResult Function(String? reason) unauthorizedRequest,
    required TResult Function(String? reason) notFound,
    required TResult Function() unexpectedError,
    required TResult Function(String? reason) unprocessableEntity,
    required TResult Function() internalServerError,
    required TResult Function() serviceUnavailable,
    required TResult Function() noInternetConnection,
    required TResult Function() formatException,
    required TResult Function(String? error) defaultError,
    required TResult Function(String error) typeException,
    required TResult Function(String? error) platformException,
  }) {
    return sendTimeout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requestCancelled,
    TResult? Function()? requestTimeout,
    TResult? Function()? sendTimeout,
    TResult? Function()? receiveTimeout,
    TResult? Function(String? error)? badRequest,
    TResult? Function(String? reason)? unauthorizedRequest,
    TResult? Function(String? reason)? notFound,
    TResult? Function()? unexpectedError,
    TResult? Function(String? reason)? unprocessableEntity,
    TResult? Function()? internalServerError,
    TResult? Function()? serviceUnavailable,
    TResult? Function()? noInternetConnection,
    TResult? Function()? formatException,
    TResult? Function(String? error)? defaultError,
    TResult? Function(String error)? typeException,
    TResult? Function(String? error)? platformException,
  }) {
    return sendTimeout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestCancelled,
    TResult Function()? requestTimeout,
    TResult Function()? sendTimeout,
    TResult Function()? receiveTimeout,
    TResult Function(String? error)? badRequest,
    TResult Function(String? reason)? unauthorizedRequest,
    TResult Function(String? reason)? notFound,
    TResult Function()? unexpectedError,
    TResult Function(String? reason)? unprocessableEntity,
    TResult Function()? internalServerError,
    TResult Function()? serviceUnavailable,
    TResult Function()? noInternetConnection,
    TResult Function()? formatException,
    TResult Function(String? error)? defaultError,
    TResult Function(String error)? typeException,
    TResult Function(String? error)? platformException,
    required TResult orElse(),
  }) {
    if (sendTimeout != null) {
      return sendTimeout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestCancelled value) requestCancelled,
    required TResult Function(_RequestTimeout value) requestTimeout,
    required TResult Function(_SendTimeout value) sendTimeout,
    required TResult Function(_ReceiveTimeout value) receiveTimeout,
    required TResult Function(_BadRequest value) badRequest,
    required TResult Function(_UnauthorizedRequest value) unauthorizedRequest,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_UnexpectedError value) unexpectedError,
    required TResult Function(_UnprocessableEntity value) unprocessableEntity,
    required TResult Function(_InternalServerError value) internalServerError,
    required TResult Function(_ServiceUnavailable value) serviceUnavailable,
    required TResult Function(_NoInternetConnection value) noInternetConnection,
    required TResult Function(_FormatException value) formatException,
    required TResult Function(_DefaultError value) defaultError,
    required TResult Function(_TypeException value) typeException,
    required TResult Function(_PlatformException value) platformException,
  }) {
    return sendTimeout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestCancelled value)? requestCancelled,
    TResult? Function(_RequestTimeout value)? requestTimeout,
    TResult? Function(_SendTimeout value)? sendTimeout,
    TResult? Function(_ReceiveTimeout value)? receiveTimeout,
    TResult? Function(_BadRequest value)? badRequest,
    TResult? Function(_UnauthorizedRequest value)? unauthorizedRequest,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_UnexpectedError value)? unexpectedError,
    TResult? Function(_UnprocessableEntity value)? unprocessableEntity,
    TResult? Function(_InternalServerError value)? internalServerError,
    TResult? Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult? Function(_NoInternetConnection value)? noInternetConnection,
    TResult? Function(_FormatException value)? formatException,
    TResult? Function(_DefaultError value)? defaultError,
    TResult? Function(_TypeException value)? typeException,
    TResult? Function(_PlatformException value)? platformException,
  }) {
    return sendTimeout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestCancelled value)? requestCancelled,
    TResult Function(_RequestTimeout value)? requestTimeout,
    TResult Function(_SendTimeout value)? sendTimeout,
    TResult Function(_ReceiveTimeout value)? receiveTimeout,
    TResult Function(_BadRequest value)? badRequest,
    TResult Function(_UnauthorizedRequest value)? unauthorizedRequest,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_UnexpectedError value)? unexpectedError,
    TResult Function(_UnprocessableEntity value)? unprocessableEntity,
    TResult Function(_InternalServerError value)? internalServerError,
    TResult Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult Function(_NoInternetConnection value)? noInternetConnection,
    TResult Function(_FormatException value)? formatException,
    TResult Function(_DefaultError value)? defaultError,
    TResult Function(_TypeException value)? typeException,
    TResult Function(_PlatformException value)? platformException,
    required TResult orElse(),
  }) {
    if (sendTimeout != null) {
      return sendTimeout(this);
    }
    return orElse();
  }
}

abstract class _SendTimeout implements AppExceptions {
  const factory _SendTimeout() = _$SendTimeoutImpl;
}

/// @nodoc
abstract class _$$ReceiveTimeoutImplCopyWith<$Res> {
  factory _$$ReceiveTimeoutImplCopyWith(_$ReceiveTimeoutImpl value,
          $Res Function(_$ReceiveTimeoutImpl) then) =
      __$$ReceiveTimeoutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReceiveTimeoutImplCopyWithImpl<$Res>
    extends _$AppExceptionsCopyWithImpl<$Res, _$ReceiveTimeoutImpl>
    implements _$$ReceiveTimeoutImplCopyWith<$Res> {
  __$$ReceiveTimeoutImplCopyWithImpl(
      _$ReceiveTimeoutImpl _value, $Res Function(_$ReceiveTimeoutImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppExceptions
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ReceiveTimeoutImpl implements _ReceiveTimeout {
  const _$ReceiveTimeoutImpl();

  @override
  String toString() {
    return 'AppExceptions.receiveTimeout()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ReceiveTimeoutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestCancelled,
    required TResult Function() requestTimeout,
    required TResult Function() sendTimeout,
    required TResult Function() receiveTimeout,
    required TResult Function(String? error) badRequest,
    required TResult Function(String? reason) unauthorizedRequest,
    required TResult Function(String? reason) notFound,
    required TResult Function() unexpectedError,
    required TResult Function(String? reason) unprocessableEntity,
    required TResult Function() internalServerError,
    required TResult Function() serviceUnavailable,
    required TResult Function() noInternetConnection,
    required TResult Function() formatException,
    required TResult Function(String? error) defaultError,
    required TResult Function(String error) typeException,
    required TResult Function(String? error) platformException,
  }) {
    return receiveTimeout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requestCancelled,
    TResult? Function()? requestTimeout,
    TResult? Function()? sendTimeout,
    TResult? Function()? receiveTimeout,
    TResult? Function(String? error)? badRequest,
    TResult? Function(String? reason)? unauthorizedRequest,
    TResult? Function(String? reason)? notFound,
    TResult? Function()? unexpectedError,
    TResult? Function(String? reason)? unprocessableEntity,
    TResult? Function()? internalServerError,
    TResult? Function()? serviceUnavailable,
    TResult? Function()? noInternetConnection,
    TResult? Function()? formatException,
    TResult? Function(String? error)? defaultError,
    TResult? Function(String error)? typeException,
    TResult? Function(String? error)? platformException,
  }) {
    return receiveTimeout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestCancelled,
    TResult Function()? requestTimeout,
    TResult Function()? sendTimeout,
    TResult Function()? receiveTimeout,
    TResult Function(String? error)? badRequest,
    TResult Function(String? reason)? unauthorizedRequest,
    TResult Function(String? reason)? notFound,
    TResult Function()? unexpectedError,
    TResult Function(String? reason)? unprocessableEntity,
    TResult Function()? internalServerError,
    TResult Function()? serviceUnavailable,
    TResult Function()? noInternetConnection,
    TResult Function()? formatException,
    TResult Function(String? error)? defaultError,
    TResult Function(String error)? typeException,
    TResult Function(String? error)? platformException,
    required TResult orElse(),
  }) {
    if (receiveTimeout != null) {
      return receiveTimeout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestCancelled value) requestCancelled,
    required TResult Function(_RequestTimeout value) requestTimeout,
    required TResult Function(_SendTimeout value) sendTimeout,
    required TResult Function(_ReceiveTimeout value) receiveTimeout,
    required TResult Function(_BadRequest value) badRequest,
    required TResult Function(_UnauthorizedRequest value) unauthorizedRequest,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_UnexpectedError value) unexpectedError,
    required TResult Function(_UnprocessableEntity value) unprocessableEntity,
    required TResult Function(_InternalServerError value) internalServerError,
    required TResult Function(_ServiceUnavailable value) serviceUnavailable,
    required TResult Function(_NoInternetConnection value) noInternetConnection,
    required TResult Function(_FormatException value) formatException,
    required TResult Function(_DefaultError value) defaultError,
    required TResult Function(_TypeException value) typeException,
    required TResult Function(_PlatformException value) platformException,
  }) {
    return receiveTimeout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestCancelled value)? requestCancelled,
    TResult? Function(_RequestTimeout value)? requestTimeout,
    TResult? Function(_SendTimeout value)? sendTimeout,
    TResult? Function(_ReceiveTimeout value)? receiveTimeout,
    TResult? Function(_BadRequest value)? badRequest,
    TResult? Function(_UnauthorizedRequest value)? unauthorizedRequest,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_UnexpectedError value)? unexpectedError,
    TResult? Function(_UnprocessableEntity value)? unprocessableEntity,
    TResult? Function(_InternalServerError value)? internalServerError,
    TResult? Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult? Function(_NoInternetConnection value)? noInternetConnection,
    TResult? Function(_FormatException value)? formatException,
    TResult? Function(_DefaultError value)? defaultError,
    TResult? Function(_TypeException value)? typeException,
    TResult? Function(_PlatformException value)? platformException,
  }) {
    return receiveTimeout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestCancelled value)? requestCancelled,
    TResult Function(_RequestTimeout value)? requestTimeout,
    TResult Function(_SendTimeout value)? sendTimeout,
    TResult Function(_ReceiveTimeout value)? receiveTimeout,
    TResult Function(_BadRequest value)? badRequest,
    TResult Function(_UnauthorizedRequest value)? unauthorizedRequest,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_UnexpectedError value)? unexpectedError,
    TResult Function(_UnprocessableEntity value)? unprocessableEntity,
    TResult Function(_InternalServerError value)? internalServerError,
    TResult Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult Function(_NoInternetConnection value)? noInternetConnection,
    TResult Function(_FormatException value)? formatException,
    TResult Function(_DefaultError value)? defaultError,
    TResult Function(_TypeException value)? typeException,
    TResult Function(_PlatformException value)? platformException,
    required TResult orElse(),
  }) {
    if (receiveTimeout != null) {
      return receiveTimeout(this);
    }
    return orElse();
  }
}

abstract class _ReceiveTimeout implements AppExceptions {
  const factory _ReceiveTimeout() = _$ReceiveTimeoutImpl;
}

/// @nodoc
abstract class _$$BadRequestImplCopyWith<$Res> {
  factory _$$BadRequestImplCopyWith(
          _$BadRequestImpl value, $Res Function(_$BadRequestImpl) then) =
      __$$BadRequestImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? error});
}

/// @nodoc
class __$$BadRequestImplCopyWithImpl<$Res>
    extends _$AppExceptionsCopyWithImpl<$Res, _$BadRequestImpl>
    implements _$$BadRequestImplCopyWith<$Res> {
  __$$BadRequestImplCopyWithImpl(
      _$BadRequestImpl _value, $Res Function(_$BadRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppExceptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$BadRequestImpl(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$BadRequestImpl implements _BadRequest {
  const _$BadRequestImpl(this.error);

  @override
  final String? error;

  @override
  String toString() {
    return 'AppExceptions.badRequest(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BadRequestImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of AppExceptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BadRequestImplCopyWith<_$BadRequestImpl> get copyWith =>
      __$$BadRequestImplCopyWithImpl<_$BadRequestImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestCancelled,
    required TResult Function() requestTimeout,
    required TResult Function() sendTimeout,
    required TResult Function() receiveTimeout,
    required TResult Function(String? error) badRequest,
    required TResult Function(String? reason) unauthorizedRequest,
    required TResult Function(String? reason) notFound,
    required TResult Function() unexpectedError,
    required TResult Function(String? reason) unprocessableEntity,
    required TResult Function() internalServerError,
    required TResult Function() serviceUnavailable,
    required TResult Function() noInternetConnection,
    required TResult Function() formatException,
    required TResult Function(String? error) defaultError,
    required TResult Function(String error) typeException,
    required TResult Function(String? error) platformException,
  }) {
    return badRequest(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requestCancelled,
    TResult? Function()? requestTimeout,
    TResult? Function()? sendTimeout,
    TResult? Function()? receiveTimeout,
    TResult? Function(String? error)? badRequest,
    TResult? Function(String? reason)? unauthorizedRequest,
    TResult? Function(String? reason)? notFound,
    TResult? Function()? unexpectedError,
    TResult? Function(String? reason)? unprocessableEntity,
    TResult? Function()? internalServerError,
    TResult? Function()? serviceUnavailable,
    TResult? Function()? noInternetConnection,
    TResult? Function()? formatException,
    TResult? Function(String? error)? defaultError,
    TResult? Function(String error)? typeException,
    TResult? Function(String? error)? platformException,
  }) {
    return badRequest?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestCancelled,
    TResult Function()? requestTimeout,
    TResult Function()? sendTimeout,
    TResult Function()? receiveTimeout,
    TResult Function(String? error)? badRequest,
    TResult Function(String? reason)? unauthorizedRequest,
    TResult Function(String? reason)? notFound,
    TResult Function()? unexpectedError,
    TResult Function(String? reason)? unprocessableEntity,
    TResult Function()? internalServerError,
    TResult Function()? serviceUnavailable,
    TResult Function()? noInternetConnection,
    TResult Function()? formatException,
    TResult Function(String? error)? defaultError,
    TResult Function(String error)? typeException,
    TResult Function(String? error)? platformException,
    required TResult orElse(),
  }) {
    if (badRequest != null) {
      return badRequest(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestCancelled value) requestCancelled,
    required TResult Function(_RequestTimeout value) requestTimeout,
    required TResult Function(_SendTimeout value) sendTimeout,
    required TResult Function(_ReceiveTimeout value) receiveTimeout,
    required TResult Function(_BadRequest value) badRequest,
    required TResult Function(_UnauthorizedRequest value) unauthorizedRequest,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_UnexpectedError value) unexpectedError,
    required TResult Function(_UnprocessableEntity value) unprocessableEntity,
    required TResult Function(_InternalServerError value) internalServerError,
    required TResult Function(_ServiceUnavailable value) serviceUnavailable,
    required TResult Function(_NoInternetConnection value) noInternetConnection,
    required TResult Function(_FormatException value) formatException,
    required TResult Function(_DefaultError value) defaultError,
    required TResult Function(_TypeException value) typeException,
    required TResult Function(_PlatformException value) platformException,
  }) {
    return badRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestCancelled value)? requestCancelled,
    TResult? Function(_RequestTimeout value)? requestTimeout,
    TResult? Function(_SendTimeout value)? sendTimeout,
    TResult? Function(_ReceiveTimeout value)? receiveTimeout,
    TResult? Function(_BadRequest value)? badRequest,
    TResult? Function(_UnauthorizedRequest value)? unauthorizedRequest,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_UnexpectedError value)? unexpectedError,
    TResult? Function(_UnprocessableEntity value)? unprocessableEntity,
    TResult? Function(_InternalServerError value)? internalServerError,
    TResult? Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult? Function(_NoInternetConnection value)? noInternetConnection,
    TResult? Function(_FormatException value)? formatException,
    TResult? Function(_DefaultError value)? defaultError,
    TResult? Function(_TypeException value)? typeException,
    TResult? Function(_PlatformException value)? platformException,
  }) {
    return badRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestCancelled value)? requestCancelled,
    TResult Function(_RequestTimeout value)? requestTimeout,
    TResult Function(_SendTimeout value)? sendTimeout,
    TResult Function(_ReceiveTimeout value)? receiveTimeout,
    TResult Function(_BadRequest value)? badRequest,
    TResult Function(_UnauthorizedRequest value)? unauthorizedRequest,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_UnexpectedError value)? unexpectedError,
    TResult Function(_UnprocessableEntity value)? unprocessableEntity,
    TResult Function(_InternalServerError value)? internalServerError,
    TResult Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult Function(_NoInternetConnection value)? noInternetConnection,
    TResult Function(_FormatException value)? formatException,
    TResult Function(_DefaultError value)? defaultError,
    TResult Function(_TypeException value)? typeException,
    TResult Function(_PlatformException value)? platformException,
    required TResult orElse(),
  }) {
    if (badRequest != null) {
      return badRequest(this);
    }
    return orElse();
  }
}

abstract class _BadRequest implements AppExceptions {
  const factory _BadRequest(final String? error) = _$BadRequestImpl;

  String? get error;

  /// Create a copy of AppExceptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BadRequestImplCopyWith<_$BadRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnauthorizedRequestImplCopyWith<$Res> {
  factory _$$UnauthorizedRequestImplCopyWith(_$UnauthorizedRequestImpl value,
          $Res Function(_$UnauthorizedRequestImpl) then) =
      __$$UnauthorizedRequestImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? reason});
}

/// @nodoc
class __$$UnauthorizedRequestImplCopyWithImpl<$Res>
    extends _$AppExceptionsCopyWithImpl<$Res, _$UnauthorizedRequestImpl>
    implements _$$UnauthorizedRequestImplCopyWith<$Res> {
  __$$UnauthorizedRequestImplCopyWithImpl(_$UnauthorizedRequestImpl _value,
      $Res Function(_$UnauthorizedRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppExceptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reason = freezed,
  }) {
    return _then(_$UnauthorizedRequestImpl(
      freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UnauthorizedRequestImpl implements _UnauthorizedRequest {
  const _$UnauthorizedRequestImpl(this.reason);

  @override
  final String? reason;

  @override
  String toString() {
    return 'AppExceptions.unauthorizedRequest(reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnauthorizedRequestImpl &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reason);

  /// Create a copy of AppExceptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnauthorizedRequestImplCopyWith<_$UnauthorizedRequestImpl> get copyWith =>
      __$$UnauthorizedRequestImplCopyWithImpl<_$UnauthorizedRequestImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestCancelled,
    required TResult Function() requestTimeout,
    required TResult Function() sendTimeout,
    required TResult Function() receiveTimeout,
    required TResult Function(String? error) badRequest,
    required TResult Function(String? reason) unauthorizedRequest,
    required TResult Function(String? reason) notFound,
    required TResult Function() unexpectedError,
    required TResult Function(String? reason) unprocessableEntity,
    required TResult Function() internalServerError,
    required TResult Function() serviceUnavailable,
    required TResult Function() noInternetConnection,
    required TResult Function() formatException,
    required TResult Function(String? error) defaultError,
    required TResult Function(String error) typeException,
    required TResult Function(String? error) platformException,
  }) {
    return unauthorizedRequest(reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requestCancelled,
    TResult? Function()? requestTimeout,
    TResult? Function()? sendTimeout,
    TResult? Function()? receiveTimeout,
    TResult? Function(String? error)? badRequest,
    TResult? Function(String? reason)? unauthorizedRequest,
    TResult? Function(String? reason)? notFound,
    TResult? Function()? unexpectedError,
    TResult? Function(String? reason)? unprocessableEntity,
    TResult? Function()? internalServerError,
    TResult? Function()? serviceUnavailable,
    TResult? Function()? noInternetConnection,
    TResult? Function()? formatException,
    TResult? Function(String? error)? defaultError,
    TResult? Function(String error)? typeException,
    TResult? Function(String? error)? platformException,
  }) {
    return unauthorizedRequest?.call(reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestCancelled,
    TResult Function()? requestTimeout,
    TResult Function()? sendTimeout,
    TResult Function()? receiveTimeout,
    TResult Function(String? error)? badRequest,
    TResult Function(String? reason)? unauthorizedRequest,
    TResult Function(String? reason)? notFound,
    TResult Function()? unexpectedError,
    TResult Function(String? reason)? unprocessableEntity,
    TResult Function()? internalServerError,
    TResult Function()? serviceUnavailable,
    TResult Function()? noInternetConnection,
    TResult Function()? formatException,
    TResult Function(String? error)? defaultError,
    TResult Function(String error)? typeException,
    TResult Function(String? error)? platformException,
    required TResult orElse(),
  }) {
    if (unauthorizedRequest != null) {
      return unauthorizedRequest(reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestCancelled value) requestCancelled,
    required TResult Function(_RequestTimeout value) requestTimeout,
    required TResult Function(_SendTimeout value) sendTimeout,
    required TResult Function(_ReceiveTimeout value) receiveTimeout,
    required TResult Function(_BadRequest value) badRequest,
    required TResult Function(_UnauthorizedRequest value) unauthorizedRequest,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_UnexpectedError value) unexpectedError,
    required TResult Function(_UnprocessableEntity value) unprocessableEntity,
    required TResult Function(_InternalServerError value) internalServerError,
    required TResult Function(_ServiceUnavailable value) serviceUnavailable,
    required TResult Function(_NoInternetConnection value) noInternetConnection,
    required TResult Function(_FormatException value) formatException,
    required TResult Function(_DefaultError value) defaultError,
    required TResult Function(_TypeException value) typeException,
    required TResult Function(_PlatformException value) platformException,
  }) {
    return unauthorizedRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestCancelled value)? requestCancelled,
    TResult? Function(_RequestTimeout value)? requestTimeout,
    TResult? Function(_SendTimeout value)? sendTimeout,
    TResult? Function(_ReceiveTimeout value)? receiveTimeout,
    TResult? Function(_BadRequest value)? badRequest,
    TResult? Function(_UnauthorizedRequest value)? unauthorizedRequest,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_UnexpectedError value)? unexpectedError,
    TResult? Function(_UnprocessableEntity value)? unprocessableEntity,
    TResult? Function(_InternalServerError value)? internalServerError,
    TResult? Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult? Function(_NoInternetConnection value)? noInternetConnection,
    TResult? Function(_FormatException value)? formatException,
    TResult? Function(_DefaultError value)? defaultError,
    TResult? Function(_TypeException value)? typeException,
    TResult? Function(_PlatformException value)? platformException,
  }) {
    return unauthorizedRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestCancelled value)? requestCancelled,
    TResult Function(_RequestTimeout value)? requestTimeout,
    TResult Function(_SendTimeout value)? sendTimeout,
    TResult Function(_ReceiveTimeout value)? receiveTimeout,
    TResult Function(_BadRequest value)? badRequest,
    TResult Function(_UnauthorizedRequest value)? unauthorizedRequest,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_UnexpectedError value)? unexpectedError,
    TResult Function(_UnprocessableEntity value)? unprocessableEntity,
    TResult Function(_InternalServerError value)? internalServerError,
    TResult Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult Function(_NoInternetConnection value)? noInternetConnection,
    TResult Function(_FormatException value)? formatException,
    TResult Function(_DefaultError value)? defaultError,
    TResult Function(_TypeException value)? typeException,
    TResult Function(_PlatformException value)? platformException,
    required TResult orElse(),
  }) {
    if (unauthorizedRequest != null) {
      return unauthorizedRequest(this);
    }
    return orElse();
  }
}

abstract class _UnauthorizedRequest implements AppExceptions {
  const factory _UnauthorizedRequest(final String? reason) =
      _$UnauthorizedRequestImpl;

  String? get reason;

  /// Create a copy of AppExceptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnauthorizedRequestImplCopyWith<_$UnauthorizedRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotFoundImplCopyWith<$Res> {
  factory _$$NotFoundImplCopyWith(
          _$NotFoundImpl value, $Res Function(_$NotFoundImpl) then) =
      __$$NotFoundImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? reason});
}

/// @nodoc
class __$$NotFoundImplCopyWithImpl<$Res>
    extends _$AppExceptionsCopyWithImpl<$Res, _$NotFoundImpl>
    implements _$$NotFoundImplCopyWith<$Res> {
  __$$NotFoundImplCopyWithImpl(
      _$NotFoundImpl _value, $Res Function(_$NotFoundImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppExceptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reason = freezed,
  }) {
    return _then(_$NotFoundImpl(
      freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$NotFoundImpl implements _NotFound {
  const _$NotFoundImpl(this.reason);

  @override
  final String? reason;

  @override
  String toString() {
    return 'AppExceptions.notFound(reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotFoundImpl &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reason);

  /// Create a copy of AppExceptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotFoundImplCopyWith<_$NotFoundImpl> get copyWith =>
      __$$NotFoundImplCopyWithImpl<_$NotFoundImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestCancelled,
    required TResult Function() requestTimeout,
    required TResult Function() sendTimeout,
    required TResult Function() receiveTimeout,
    required TResult Function(String? error) badRequest,
    required TResult Function(String? reason) unauthorizedRequest,
    required TResult Function(String? reason) notFound,
    required TResult Function() unexpectedError,
    required TResult Function(String? reason) unprocessableEntity,
    required TResult Function() internalServerError,
    required TResult Function() serviceUnavailable,
    required TResult Function() noInternetConnection,
    required TResult Function() formatException,
    required TResult Function(String? error) defaultError,
    required TResult Function(String error) typeException,
    required TResult Function(String? error) platformException,
  }) {
    return notFound(reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requestCancelled,
    TResult? Function()? requestTimeout,
    TResult? Function()? sendTimeout,
    TResult? Function()? receiveTimeout,
    TResult? Function(String? error)? badRequest,
    TResult? Function(String? reason)? unauthorizedRequest,
    TResult? Function(String? reason)? notFound,
    TResult? Function()? unexpectedError,
    TResult? Function(String? reason)? unprocessableEntity,
    TResult? Function()? internalServerError,
    TResult? Function()? serviceUnavailable,
    TResult? Function()? noInternetConnection,
    TResult? Function()? formatException,
    TResult? Function(String? error)? defaultError,
    TResult? Function(String error)? typeException,
    TResult? Function(String? error)? platformException,
  }) {
    return notFound?.call(reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestCancelled,
    TResult Function()? requestTimeout,
    TResult Function()? sendTimeout,
    TResult Function()? receiveTimeout,
    TResult Function(String? error)? badRequest,
    TResult Function(String? reason)? unauthorizedRequest,
    TResult Function(String? reason)? notFound,
    TResult Function()? unexpectedError,
    TResult Function(String? reason)? unprocessableEntity,
    TResult Function()? internalServerError,
    TResult Function()? serviceUnavailable,
    TResult Function()? noInternetConnection,
    TResult Function()? formatException,
    TResult Function(String? error)? defaultError,
    TResult Function(String error)? typeException,
    TResult Function(String? error)? platformException,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestCancelled value) requestCancelled,
    required TResult Function(_RequestTimeout value) requestTimeout,
    required TResult Function(_SendTimeout value) sendTimeout,
    required TResult Function(_ReceiveTimeout value) receiveTimeout,
    required TResult Function(_BadRequest value) badRequest,
    required TResult Function(_UnauthorizedRequest value) unauthorizedRequest,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_UnexpectedError value) unexpectedError,
    required TResult Function(_UnprocessableEntity value) unprocessableEntity,
    required TResult Function(_InternalServerError value) internalServerError,
    required TResult Function(_ServiceUnavailable value) serviceUnavailable,
    required TResult Function(_NoInternetConnection value) noInternetConnection,
    required TResult Function(_FormatException value) formatException,
    required TResult Function(_DefaultError value) defaultError,
    required TResult Function(_TypeException value) typeException,
    required TResult Function(_PlatformException value) platformException,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestCancelled value)? requestCancelled,
    TResult? Function(_RequestTimeout value)? requestTimeout,
    TResult? Function(_SendTimeout value)? sendTimeout,
    TResult? Function(_ReceiveTimeout value)? receiveTimeout,
    TResult? Function(_BadRequest value)? badRequest,
    TResult? Function(_UnauthorizedRequest value)? unauthorizedRequest,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_UnexpectedError value)? unexpectedError,
    TResult? Function(_UnprocessableEntity value)? unprocessableEntity,
    TResult? Function(_InternalServerError value)? internalServerError,
    TResult? Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult? Function(_NoInternetConnection value)? noInternetConnection,
    TResult? Function(_FormatException value)? formatException,
    TResult? Function(_DefaultError value)? defaultError,
    TResult? Function(_TypeException value)? typeException,
    TResult? Function(_PlatformException value)? platformException,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestCancelled value)? requestCancelled,
    TResult Function(_RequestTimeout value)? requestTimeout,
    TResult Function(_SendTimeout value)? sendTimeout,
    TResult Function(_ReceiveTimeout value)? receiveTimeout,
    TResult Function(_BadRequest value)? badRequest,
    TResult Function(_UnauthorizedRequest value)? unauthorizedRequest,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_UnexpectedError value)? unexpectedError,
    TResult Function(_UnprocessableEntity value)? unprocessableEntity,
    TResult Function(_InternalServerError value)? internalServerError,
    TResult Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult Function(_NoInternetConnection value)? noInternetConnection,
    TResult Function(_FormatException value)? formatException,
    TResult Function(_DefaultError value)? defaultError,
    TResult Function(_TypeException value)? typeException,
    TResult Function(_PlatformException value)? platformException,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class _NotFound implements AppExceptions {
  const factory _NotFound(final String? reason) = _$NotFoundImpl;

  String? get reason;

  /// Create a copy of AppExceptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotFoundImplCopyWith<_$NotFoundImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnexpectedErrorImplCopyWith<$Res> {
  factory _$$UnexpectedErrorImplCopyWith(_$UnexpectedErrorImpl value,
          $Res Function(_$UnexpectedErrorImpl) then) =
      __$$UnexpectedErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnexpectedErrorImplCopyWithImpl<$Res>
    extends _$AppExceptionsCopyWithImpl<$Res, _$UnexpectedErrorImpl>
    implements _$$UnexpectedErrorImplCopyWith<$Res> {
  __$$UnexpectedErrorImplCopyWithImpl(
      _$UnexpectedErrorImpl _value, $Res Function(_$UnexpectedErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppExceptions
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UnexpectedErrorImpl implements _UnexpectedError {
  const _$UnexpectedErrorImpl();

  @override
  String toString() {
    return 'AppExceptions.unexpectedError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnexpectedErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestCancelled,
    required TResult Function() requestTimeout,
    required TResult Function() sendTimeout,
    required TResult Function() receiveTimeout,
    required TResult Function(String? error) badRequest,
    required TResult Function(String? reason) unauthorizedRequest,
    required TResult Function(String? reason) notFound,
    required TResult Function() unexpectedError,
    required TResult Function(String? reason) unprocessableEntity,
    required TResult Function() internalServerError,
    required TResult Function() serviceUnavailable,
    required TResult Function() noInternetConnection,
    required TResult Function() formatException,
    required TResult Function(String? error) defaultError,
    required TResult Function(String error) typeException,
    required TResult Function(String? error) platformException,
  }) {
    return unexpectedError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requestCancelled,
    TResult? Function()? requestTimeout,
    TResult? Function()? sendTimeout,
    TResult? Function()? receiveTimeout,
    TResult? Function(String? error)? badRequest,
    TResult? Function(String? reason)? unauthorizedRequest,
    TResult? Function(String? reason)? notFound,
    TResult? Function()? unexpectedError,
    TResult? Function(String? reason)? unprocessableEntity,
    TResult? Function()? internalServerError,
    TResult? Function()? serviceUnavailable,
    TResult? Function()? noInternetConnection,
    TResult? Function()? formatException,
    TResult? Function(String? error)? defaultError,
    TResult? Function(String error)? typeException,
    TResult? Function(String? error)? platformException,
  }) {
    return unexpectedError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestCancelled,
    TResult Function()? requestTimeout,
    TResult Function()? sendTimeout,
    TResult Function()? receiveTimeout,
    TResult Function(String? error)? badRequest,
    TResult Function(String? reason)? unauthorizedRequest,
    TResult Function(String? reason)? notFound,
    TResult Function()? unexpectedError,
    TResult Function(String? reason)? unprocessableEntity,
    TResult Function()? internalServerError,
    TResult Function()? serviceUnavailable,
    TResult Function()? noInternetConnection,
    TResult Function()? formatException,
    TResult Function(String? error)? defaultError,
    TResult Function(String error)? typeException,
    TResult Function(String? error)? platformException,
    required TResult orElse(),
  }) {
    if (unexpectedError != null) {
      return unexpectedError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestCancelled value) requestCancelled,
    required TResult Function(_RequestTimeout value) requestTimeout,
    required TResult Function(_SendTimeout value) sendTimeout,
    required TResult Function(_ReceiveTimeout value) receiveTimeout,
    required TResult Function(_BadRequest value) badRequest,
    required TResult Function(_UnauthorizedRequest value) unauthorizedRequest,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_UnexpectedError value) unexpectedError,
    required TResult Function(_UnprocessableEntity value) unprocessableEntity,
    required TResult Function(_InternalServerError value) internalServerError,
    required TResult Function(_ServiceUnavailable value) serviceUnavailable,
    required TResult Function(_NoInternetConnection value) noInternetConnection,
    required TResult Function(_FormatException value) formatException,
    required TResult Function(_DefaultError value) defaultError,
    required TResult Function(_TypeException value) typeException,
    required TResult Function(_PlatformException value) platformException,
  }) {
    return unexpectedError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestCancelled value)? requestCancelled,
    TResult? Function(_RequestTimeout value)? requestTimeout,
    TResult? Function(_SendTimeout value)? sendTimeout,
    TResult? Function(_ReceiveTimeout value)? receiveTimeout,
    TResult? Function(_BadRequest value)? badRequest,
    TResult? Function(_UnauthorizedRequest value)? unauthorizedRequest,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_UnexpectedError value)? unexpectedError,
    TResult? Function(_UnprocessableEntity value)? unprocessableEntity,
    TResult? Function(_InternalServerError value)? internalServerError,
    TResult? Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult? Function(_NoInternetConnection value)? noInternetConnection,
    TResult? Function(_FormatException value)? formatException,
    TResult? Function(_DefaultError value)? defaultError,
    TResult? Function(_TypeException value)? typeException,
    TResult? Function(_PlatformException value)? platformException,
  }) {
    return unexpectedError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestCancelled value)? requestCancelled,
    TResult Function(_RequestTimeout value)? requestTimeout,
    TResult Function(_SendTimeout value)? sendTimeout,
    TResult Function(_ReceiveTimeout value)? receiveTimeout,
    TResult Function(_BadRequest value)? badRequest,
    TResult Function(_UnauthorizedRequest value)? unauthorizedRequest,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_UnexpectedError value)? unexpectedError,
    TResult Function(_UnprocessableEntity value)? unprocessableEntity,
    TResult Function(_InternalServerError value)? internalServerError,
    TResult Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult Function(_NoInternetConnection value)? noInternetConnection,
    TResult Function(_FormatException value)? formatException,
    TResult Function(_DefaultError value)? defaultError,
    TResult Function(_TypeException value)? typeException,
    TResult Function(_PlatformException value)? platformException,
    required TResult orElse(),
  }) {
    if (unexpectedError != null) {
      return unexpectedError(this);
    }
    return orElse();
  }
}

abstract class _UnexpectedError implements AppExceptions {
  const factory _UnexpectedError() = _$UnexpectedErrorImpl;
}

/// @nodoc
abstract class _$$UnprocessableEntityImplCopyWith<$Res> {
  factory _$$UnprocessableEntityImplCopyWith(_$UnprocessableEntityImpl value,
          $Res Function(_$UnprocessableEntityImpl) then) =
      __$$UnprocessableEntityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? reason});
}

/// @nodoc
class __$$UnprocessableEntityImplCopyWithImpl<$Res>
    extends _$AppExceptionsCopyWithImpl<$Res, _$UnprocessableEntityImpl>
    implements _$$UnprocessableEntityImplCopyWith<$Res> {
  __$$UnprocessableEntityImplCopyWithImpl(_$UnprocessableEntityImpl _value,
      $Res Function(_$UnprocessableEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppExceptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reason = freezed,
  }) {
    return _then(_$UnprocessableEntityImpl(
      freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UnprocessableEntityImpl implements _UnprocessableEntity {
  const _$UnprocessableEntityImpl(this.reason);

  @override
  final String? reason;

  @override
  String toString() {
    return 'AppExceptions.unprocessableEntity(reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnprocessableEntityImpl &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reason);

  /// Create a copy of AppExceptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnprocessableEntityImplCopyWith<_$UnprocessableEntityImpl> get copyWith =>
      __$$UnprocessableEntityImplCopyWithImpl<_$UnprocessableEntityImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestCancelled,
    required TResult Function() requestTimeout,
    required TResult Function() sendTimeout,
    required TResult Function() receiveTimeout,
    required TResult Function(String? error) badRequest,
    required TResult Function(String? reason) unauthorizedRequest,
    required TResult Function(String? reason) notFound,
    required TResult Function() unexpectedError,
    required TResult Function(String? reason) unprocessableEntity,
    required TResult Function() internalServerError,
    required TResult Function() serviceUnavailable,
    required TResult Function() noInternetConnection,
    required TResult Function() formatException,
    required TResult Function(String? error) defaultError,
    required TResult Function(String error) typeException,
    required TResult Function(String? error) platformException,
  }) {
    return unprocessableEntity(reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requestCancelled,
    TResult? Function()? requestTimeout,
    TResult? Function()? sendTimeout,
    TResult? Function()? receiveTimeout,
    TResult? Function(String? error)? badRequest,
    TResult? Function(String? reason)? unauthorizedRequest,
    TResult? Function(String? reason)? notFound,
    TResult? Function()? unexpectedError,
    TResult? Function(String? reason)? unprocessableEntity,
    TResult? Function()? internalServerError,
    TResult? Function()? serviceUnavailable,
    TResult? Function()? noInternetConnection,
    TResult? Function()? formatException,
    TResult? Function(String? error)? defaultError,
    TResult? Function(String error)? typeException,
    TResult? Function(String? error)? platformException,
  }) {
    return unprocessableEntity?.call(reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestCancelled,
    TResult Function()? requestTimeout,
    TResult Function()? sendTimeout,
    TResult Function()? receiveTimeout,
    TResult Function(String? error)? badRequest,
    TResult Function(String? reason)? unauthorizedRequest,
    TResult Function(String? reason)? notFound,
    TResult Function()? unexpectedError,
    TResult Function(String? reason)? unprocessableEntity,
    TResult Function()? internalServerError,
    TResult Function()? serviceUnavailable,
    TResult Function()? noInternetConnection,
    TResult Function()? formatException,
    TResult Function(String? error)? defaultError,
    TResult Function(String error)? typeException,
    TResult Function(String? error)? platformException,
    required TResult orElse(),
  }) {
    if (unprocessableEntity != null) {
      return unprocessableEntity(reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestCancelled value) requestCancelled,
    required TResult Function(_RequestTimeout value) requestTimeout,
    required TResult Function(_SendTimeout value) sendTimeout,
    required TResult Function(_ReceiveTimeout value) receiveTimeout,
    required TResult Function(_BadRequest value) badRequest,
    required TResult Function(_UnauthorizedRequest value) unauthorizedRequest,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_UnexpectedError value) unexpectedError,
    required TResult Function(_UnprocessableEntity value) unprocessableEntity,
    required TResult Function(_InternalServerError value) internalServerError,
    required TResult Function(_ServiceUnavailable value) serviceUnavailable,
    required TResult Function(_NoInternetConnection value) noInternetConnection,
    required TResult Function(_FormatException value) formatException,
    required TResult Function(_DefaultError value) defaultError,
    required TResult Function(_TypeException value) typeException,
    required TResult Function(_PlatformException value) platformException,
  }) {
    return unprocessableEntity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestCancelled value)? requestCancelled,
    TResult? Function(_RequestTimeout value)? requestTimeout,
    TResult? Function(_SendTimeout value)? sendTimeout,
    TResult? Function(_ReceiveTimeout value)? receiveTimeout,
    TResult? Function(_BadRequest value)? badRequest,
    TResult? Function(_UnauthorizedRequest value)? unauthorizedRequest,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_UnexpectedError value)? unexpectedError,
    TResult? Function(_UnprocessableEntity value)? unprocessableEntity,
    TResult? Function(_InternalServerError value)? internalServerError,
    TResult? Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult? Function(_NoInternetConnection value)? noInternetConnection,
    TResult? Function(_FormatException value)? formatException,
    TResult? Function(_DefaultError value)? defaultError,
    TResult? Function(_TypeException value)? typeException,
    TResult? Function(_PlatformException value)? platformException,
  }) {
    return unprocessableEntity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestCancelled value)? requestCancelled,
    TResult Function(_RequestTimeout value)? requestTimeout,
    TResult Function(_SendTimeout value)? sendTimeout,
    TResult Function(_ReceiveTimeout value)? receiveTimeout,
    TResult Function(_BadRequest value)? badRequest,
    TResult Function(_UnauthorizedRequest value)? unauthorizedRequest,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_UnexpectedError value)? unexpectedError,
    TResult Function(_UnprocessableEntity value)? unprocessableEntity,
    TResult Function(_InternalServerError value)? internalServerError,
    TResult Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult Function(_NoInternetConnection value)? noInternetConnection,
    TResult Function(_FormatException value)? formatException,
    TResult Function(_DefaultError value)? defaultError,
    TResult Function(_TypeException value)? typeException,
    TResult Function(_PlatformException value)? platformException,
    required TResult orElse(),
  }) {
    if (unprocessableEntity != null) {
      return unprocessableEntity(this);
    }
    return orElse();
  }
}

abstract class _UnprocessableEntity implements AppExceptions {
  const factory _UnprocessableEntity(final String? reason) =
      _$UnprocessableEntityImpl;

  String? get reason;

  /// Create a copy of AppExceptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnprocessableEntityImplCopyWith<_$UnprocessableEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InternalServerErrorImplCopyWith<$Res> {
  factory _$$InternalServerErrorImplCopyWith(_$InternalServerErrorImpl value,
          $Res Function(_$InternalServerErrorImpl) then) =
      __$$InternalServerErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InternalServerErrorImplCopyWithImpl<$Res>
    extends _$AppExceptionsCopyWithImpl<$Res, _$InternalServerErrorImpl>
    implements _$$InternalServerErrorImplCopyWith<$Res> {
  __$$InternalServerErrorImplCopyWithImpl(_$InternalServerErrorImpl _value,
      $Res Function(_$InternalServerErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppExceptions
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InternalServerErrorImpl implements _InternalServerError {
  const _$InternalServerErrorImpl();

  @override
  String toString() {
    return 'AppExceptions.internalServerError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InternalServerErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestCancelled,
    required TResult Function() requestTimeout,
    required TResult Function() sendTimeout,
    required TResult Function() receiveTimeout,
    required TResult Function(String? error) badRequest,
    required TResult Function(String? reason) unauthorizedRequest,
    required TResult Function(String? reason) notFound,
    required TResult Function() unexpectedError,
    required TResult Function(String? reason) unprocessableEntity,
    required TResult Function() internalServerError,
    required TResult Function() serviceUnavailable,
    required TResult Function() noInternetConnection,
    required TResult Function() formatException,
    required TResult Function(String? error) defaultError,
    required TResult Function(String error) typeException,
    required TResult Function(String? error) platformException,
  }) {
    return internalServerError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requestCancelled,
    TResult? Function()? requestTimeout,
    TResult? Function()? sendTimeout,
    TResult? Function()? receiveTimeout,
    TResult? Function(String? error)? badRequest,
    TResult? Function(String? reason)? unauthorizedRequest,
    TResult? Function(String? reason)? notFound,
    TResult? Function()? unexpectedError,
    TResult? Function(String? reason)? unprocessableEntity,
    TResult? Function()? internalServerError,
    TResult? Function()? serviceUnavailable,
    TResult? Function()? noInternetConnection,
    TResult? Function()? formatException,
    TResult? Function(String? error)? defaultError,
    TResult? Function(String error)? typeException,
    TResult? Function(String? error)? platformException,
  }) {
    return internalServerError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestCancelled,
    TResult Function()? requestTimeout,
    TResult Function()? sendTimeout,
    TResult Function()? receiveTimeout,
    TResult Function(String? error)? badRequest,
    TResult Function(String? reason)? unauthorizedRequest,
    TResult Function(String? reason)? notFound,
    TResult Function()? unexpectedError,
    TResult Function(String? reason)? unprocessableEntity,
    TResult Function()? internalServerError,
    TResult Function()? serviceUnavailable,
    TResult Function()? noInternetConnection,
    TResult Function()? formatException,
    TResult Function(String? error)? defaultError,
    TResult Function(String error)? typeException,
    TResult Function(String? error)? platformException,
    required TResult orElse(),
  }) {
    if (internalServerError != null) {
      return internalServerError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestCancelled value) requestCancelled,
    required TResult Function(_RequestTimeout value) requestTimeout,
    required TResult Function(_SendTimeout value) sendTimeout,
    required TResult Function(_ReceiveTimeout value) receiveTimeout,
    required TResult Function(_BadRequest value) badRequest,
    required TResult Function(_UnauthorizedRequest value) unauthorizedRequest,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_UnexpectedError value) unexpectedError,
    required TResult Function(_UnprocessableEntity value) unprocessableEntity,
    required TResult Function(_InternalServerError value) internalServerError,
    required TResult Function(_ServiceUnavailable value) serviceUnavailable,
    required TResult Function(_NoInternetConnection value) noInternetConnection,
    required TResult Function(_FormatException value) formatException,
    required TResult Function(_DefaultError value) defaultError,
    required TResult Function(_TypeException value) typeException,
    required TResult Function(_PlatformException value) platformException,
  }) {
    return internalServerError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestCancelled value)? requestCancelled,
    TResult? Function(_RequestTimeout value)? requestTimeout,
    TResult? Function(_SendTimeout value)? sendTimeout,
    TResult? Function(_ReceiveTimeout value)? receiveTimeout,
    TResult? Function(_BadRequest value)? badRequest,
    TResult? Function(_UnauthorizedRequest value)? unauthorizedRequest,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_UnexpectedError value)? unexpectedError,
    TResult? Function(_UnprocessableEntity value)? unprocessableEntity,
    TResult? Function(_InternalServerError value)? internalServerError,
    TResult? Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult? Function(_NoInternetConnection value)? noInternetConnection,
    TResult? Function(_FormatException value)? formatException,
    TResult? Function(_DefaultError value)? defaultError,
    TResult? Function(_TypeException value)? typeException,
    TResult? Function(_PlatformException value)? platformException,
  }) {
    return internalServerError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestCancelled value)? requestCancelled,
    TResult Function(_RequestTimeout value)? requestTimeout,
    TResult Function(_SendTimeout value)? sendTimeout,
    TResult Function(_ReceiveTimeout value)? receiveTimeout,
    TResult Function(_BadRequest value)? badRequest,
    TResult Function(_UnauthorizedRequest value)? unauthorizedRequest,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_UnexpectedError value)? unexpectedError,
    TResult Function(_UnprocessableEntity value)? unprocessableEntity,
    TResult Function(_InternalServerError value)? internalServerError,
    TResult Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult Function(_NoInternetConnection value)? noInternetConnection,
    TResult Function(_FormatException value)? formatException,
    TResult Function(_DefaultError value)? defaultError,
    TResult Function(_TypeException value)? typeException,
    TResult Function(_PlatformException value)? platformException,
    required TResult orElse(),
  }) {
    if (internalServerError != null) {
      return internalServerError(this);
    }
    return orElse();
  }
}

abstract class _InternalServerError implements AppExceptions {
  const factory _InternalServerError() = _$InternalServerErrorImpl;
}

/// @nodoc
abstract class _$$ServiceUnavailableImplCopyWith<$Res> {
  factory _$$ServiceUnavailableImplCopyWith(_$ServiceUnavailableImpl value,
          $Res Function(_$ServiceUnavailableImpl) then) =
      __$$ServiceUnavailableImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ServiceUnavailableImplCopyWithImpl<$Res>
    extends _$AppExceptionsCopyWithImpl<$Res, _$ServiceUnavailableImpl>
    implements _$$ServiceUnavailableImplCopyWith<$Res> {
  __$$ServiceUnavailableImplCopyWithImpl(_$ServiceUnavailableImpl _value,
      $Res Function(_$ServiceUnavailableImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppExceptions
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ServiceUnavailableImpl implements _ServiceUnavailable {
  const _$ServiceUnavailableImpl();

  @override
  String toString() {
    return 'AppExceptions.serviceUnavailable()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ServiceUnavailableImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestCancelled,
    required TResult Function() requestTimeout,
    required TResult Function() sendTimeout,
    required TResult Function() receiveTimeout,
    required TResult Function(String? error) badRequest,
    required TResult Function(String? reason) unauthorizedRequest,
    required TResult Function(String? reason) notFound,
    required TResult Function() unexpectedError,
    required TResult Function(String? reason) unprocessableEntity,
    required TResult Function() internalServerError,
    required TResult Function() serviceUnavailable,
    required TResult Function() noInternetConnection,
    required TResult Function() formatException,
    required TResult Function(String? error) defaultError,
    required TResult Function(String error) typeException,
    required TResult Function(String? error) platformException,
  }) {
    return serviceUnavailable();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requestCancelled,
    TResult? Function()? requestTimeout,
    TResult? Function()? sendTimeout,
    TResult? Function()? receiveTimeout,
    TResult? Function(String? error)? badRequest,
    TResult? Function(String? reason)? unauthorizedRequest,
    TResult? Function(String? reason)? notFound,
    TResult? Function()? unexpectedError,
    TResult? Function(String? reason)? unprocessableEntity,
    TResult? Function()? internalServerError,
    TResult? Function()? serviceUnavailable,
    TResult? Function()? noInternetConnection,
    TResult? Function()? formatException,
    TResult? Function(String? error)? defaultError,
    TResult? Function(String error)? typeException,
    TResult? Function(String? error)? platformException,
  }) {
    return serviceUnavailable?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestCancelled,
    TResult Function()? requestTimeout,
    TResult Function()? sendTimeout,
    TResult Function()? receiveTimeout,
    TResult Function(String? error)? badRequest,
    TResult Function(String? reason)? unauthorizedRequest,
    TResult Function(String? reason)? notFound,
    TResult Function()? unexpectedError,
    TResult Function(String? reason)? unprocessableEntity,
    TResult Function()? internalServerError,
    TResult Function()? serviceUnavailable,
    TResult Function()? noInternetConnection,
    TResult Function()? formatException,
    TResult Function(String? error)? defaultError,
    TResult Function(String error)? typeException,
    TResult Function(String? error)? platformException,
    required TResult orElse(),
  }) {
    if (serviceUnavailable != null) {
      return serviceUnavailable();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestCancelled value) requestCancelled,
    required TResult Function(_RequestTimeout value) requestTimeout,
    required TResult Function(_SendTimeout value) sendTimeout,
    required TResult Function(_ReceiveTimeout value) receiveTimeout,
    required TResult Function(_BadRequest value) badRequest,
    required TResult Function(_UnauthorizedRequest value) unauthorizedRequest,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_UnexpectedError value) unexpectedError,
    required TResult Function(_UnprocessableEntity value) unprocessableEntity,
    required TResult Function(_InternalServerError value) internalServerError,
    required TResult Function(_ServiceUnavailable value) serviceUnavailable,
    required TResult Function(_NoInternetConnection value) noInternetConnection,
    required TResult Function(_FormatException value) formatException,
    required TResult Function(_DefaultError value) defaultError,
    required TResult Function(_TypeException value) typeException,
    required TResult Function(_PlatformException value) platformException,
  }) {
    return serviceUnavailable(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestCancelled value)? requestCancelled,
    TResult? Function(_RequestTimeout value)? requestTimeout,
    TResult? Function(_SendTimeout value)? sendTimeout,
    TResult? Function(_ReceiveTimeout value)? receiveTimeout,
    TResult? Function(_BadRequest value)? badRequest,
    TResult? Function(_UnauthorizedRequest value)? unauthorizedRequest,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_UnexpectedError value)? unexpectedError,
    TResult? Function(_UnprocessableEntity value)? unprocessableEntity,
    TResult? Function(_InternalServerError value)? internalServerError,
    TResult? Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult? Function(_NoInternetConnection value)? noInternetConnection,
    TResult? Function(_FormatException value)? formatException,
    TResult? Function(_DefaultError value)? defaultError,
    TResult? Function(_TypeException value)? typeException,
    TResult? Function(_PlatformException value)? platformException,
  }) {
    return serviceUnavailable?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestCancelled value)? requestCancelled,
    TResult Function(_RequestTimeout value)? requestTimeout,
    TResult Function(_SendTimeout value)? sendTimeout,
    TResult Function(_ReceiveTimeout value)? receiveTimeout,
    TResult Function(_BadRequest value)? badRequest,
    TResult Function(_UnauthorizedRequest value)? unauthorizedRequest,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_UnexpectedError value)? unexpectedError,
    TResult Function(_UnprocessableEntity value)? unprocessableEntity,
    TResult Function(_InternalServerError value)? internalServerError,
    TResult Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult Function(_NoInternetConnection value)? noInternetConnection,
    TResult Function(_FormatException value)? formatException,
    TResult Function(_DefaultError value)? defaultError,
    TResult Function(_TypeException value)? typeException,
    TResult Function(_PlatformException value)? platformException,
    required TResult orElse(),
  }) {
    if (serviceUnavailable != null) {
      return serviceUnavailable(this);
    }
    return orElse();
  }
}

abstract class _ServiceUnavailable implements AppExceptions {
  const factory _ServiceUnavailable() = _$ServiceUnavailableImpl;
}

/// @nodoc
abstract class _$$NoInternetConnectionImplCopyWith<$Res> {
  factory _$$NoInternetConnectionImplCopyWith(_$NoInternetConnectionImpl value,
          $Res Function(_$NoInternetConnectionImpl) then) =
      __$$NoInternetConnectionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoInternetConnectionImplCopyWithImpl<$Res>
    extends _$AppExceptionsCopyWithImpl<$Res, _$NoInternetConnectionImpl>
    implements _$$NoInternetConnectionImplCopyWith<$Res> {
  __$$NoInternetConnectionImplCopyWithImpl(_$NoInternetConnectionImpl _value,
      $Res Function(_$NoInternetConnectionImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppExceptions
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NoInternetConnectionImpl implements _NoInternetConnection {
  const _$NoInternetConnectionImpl();

  @override
  String toString() {
    return 'AppExceptions.noInternetConnection()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoInternetConnectionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestCancelled,
    required TResult Function() requestTimeout,
    required TResult Function() sendTimeout,
    required TResult Function() receiveTimeout,
    required TResult Function(String? error) badRequest,
    required TResult Function(String? reason) unauthorizedRequest,
    required TResult Function(String? reason) notFound,
    required TResult Function() unexpectedError,
    required TResult Function(String? reason) unprocessableEntity,
    required TResult Function() internalServerError,
    required TResult Function() serviceUnavailable,
    required TResult Function() noInternetConnection,
    required TResult Function() formatException,
    required TResult Function(String? error) defaultError,
    required TResult Function(String error) typeException,
    required TResult Function(String? error) platformException,
  }) {
    return noInternetConnection();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requestCancelled,
    TResult? Function()? requestTimeout,
    TResult? Function()? sendTimeout,
    TResult? Function()? receiveTimeout,
    TResult? Function(String? error)? badRequest,
    TResult? Function(String? reason)? unauthorizedRequest,
    TResult? Function(String? reason)? notFound,
    TResult? Function()? unexpectedError,
    TResult? Function(String? reason)? unprocessableEntity,
    TResult? Function()? internalServerError,
    TResult? Function()? serviceUnavailable,
    TResult? Function()? noInternetConnection,
    TResult? Function()? formatException,
    TResult? Function(String? error)? defaultError,
    TResult? Function(String error)? typeException,
    TResult? Function(String? error)? platformException,
  }) {
    return noInternetConnection?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestCancelled,
    TResult Function()? requestTimeout,
    TResult Function()? sendTimeout,
    TResult Function()? receiveTimeout,
    TResult Function(String? error)? badRequest,
    TResult Function(String? reason)? unauthorizedRequest,
    TResult Function(String? reason)? notFound,
    TResult Function()? unexpectedError,
    TResult Function(String? reason)? unprocessableEntity,
    TResult Function()? internalServerError,
    TResult Function()? serviceUnavailable,
    TResult Function()? noInternetConnection,
    TResult Function()? formatException,
    TResult Function(String? error)? defaultError,
    TResult Function(String error)? typeException,
    TResult Function(String? error)? platformException,
    required TResult orElse(),
  }) {
    if (noInternetConnection != null) {
      return noInternetConnection();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestCancelled value) requestCancelled,
    required TResult Function(_RequestTimeout value) requestTimeout,
    required TResult Function(_SendTimeout value) sendTimeout,
    required TResult Function(_ReceiveTimeout value) receiveTimeout,
    required TResult Function(_BadRequest value) badRequest,
    required TResult Function(_UnauthorizedRequest value) unauthorizedRequest,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_UnexpectedError value) unexpectedError,
    required TResult Function(_UnprocessableEntity value) unprocessableEntity,
    required TResult Function(_InternalServerError value) internalServerError,
    required TResult Function(_ServiceUnavailable value) serviceUnavailable,
    required TResult Function(_NoInternetConnection value) noInternetConnection,
    required TResult Function(_FormatException value) formatException,
    required TResult Function(_DefaultError value) defaultError,
    required TResult Function(_TypeException value) typeException,
    required TResult Function(_PlatformException value) platformException,
  }) {
    return noInternetConnection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestCancelled value)? requestCancelled,
    TResult? Function(_RequestTimeout value)? requestTimeout,
    TResult? Function(_SendTimeout value)? sendTimeout,
    TResult? Function(_ReceiveTimeout value)? receiveTimeout,
    TResult? Function(_BadRequest value)? badRequest,
    TResult? Function(_UnauthorizedRequest value)? unauthorizedRequest,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_UnexpectedError value)? unexpectedError,
    TResult? Function(_UnprocessableEntity value)? unprocessableEntity,
    TResult? Function(_InternalServerError value)? internalServerError,
    TResult? Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult? Function(_NoInternetConnection value)? noInternetConnection,
    TResult? Function(_FormatException value)? formatException,
    TResult? Function(_DefaultError value)? defaultError,
    TResult? Function(_TypeException value)? typeException,
    TResult? Function(_PlatformException value)? platformException,
  }) {
    return noInternetConnection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestCancelled value)? requestCancelled,
    TResult Function(_RequestTimeout value)? requestTimeout,
    TResult Function(_SendTimeout value)? sendTimeout,
    TResult Function(_ReceiveTimeout value)? receiveTimeout,
    TResult Function(_BadRequest value)? badRequest,
    TResult Function(_UnauthorizedRequest value)? unauthorizedRequest,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_UnexpectedError value)? unexpectedError,
    TResult Function(_UnprocessableEntity value)? unprocessableEntity,
    TResult Function(_InternalServerError value)? internalServerError,
    TResult Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult Function(_NoInternetConnection value)? noInternetConnection,
    TResult Function(_FormatException value)? formatException,
    TResult Function(_DefaultError value)? defaultError,
    TResult Function(_TypeException value)? typeException,
    TResult Function(_PlatformException value)? platformException,
    required TResult orElse(),
  }) {
    if (noInternetConnection != null) {
      return noInternetConnection(this);
    }
    return orElse();
  }
}

abstract class _NoInternetConnection implements AppExceptions {
  const factory _NoInternetConnection() = _$NoInternetConnectionImpl;
}

/// @nodoc
abstract class _$$FormatExceptionImplCopyWith<$Res> {
  factory _$$FormatExceptionImplCopyWith(_$FormatExceptionImpl value,
          $Res Function(_$FormatExceptionImpl) then) =
      __$$FormatExceptionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FormatExceptionImplCopyWithImpl<$Res>
    extends _$AppExceptionsCopyWithImpl<$Res, _$FormatExceptionImpl>
    implements _$$FormatExceptionImplCopyWith<$Res> {
  __$$FormatExceptionImplCopyWithImpl(
      _$FormatExceptionImpl _value, $Res Function(_$FormatExceptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppExceptions
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FormatExceptionImpl implements _FormatException {
  const _$FormatExceptionImpl();

  @override
  String toString() {
    return 'AppExceptions.formatException()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FormatExceptionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestCancelled,
    required TResult Function() requestTimeout,
    required TResult Function() sendTimeout,
    required TResult Function() receiveTimeout,
    required TResult Function(String? error) badRequest,
    required TResult Function(String? reason) unauthorizedRequest,
    required TResult Function(String? reason) notFound,
    required TResult Function() unexpectedError,
    required TResult Function(String? reason) unprocessableEntity,
    required TResult Function() internalServerError,
    required TResult Function() serviceUnavailable,
    required TResult Function() noInternetConnection,
    required TResult Function() formatException,
    required TResult Function(String? error) defaultError,
    required TResult Function(String error) typeException,
    required TResult Function(String? error) platformException,
  }) {
    return formatException();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requestCancelled,
    TResult? Function()? requestTimeout,
    TResult? Function()? sendTimeout,
    TResult? Function()? receiveTimeout,
    TResult? Function(String? error)? badRequest,
    TResult? Function(String? reason)? unauthorizedRequest,
    TResult? Function(String? reason)? notFound,
    TResult? Function()? unexpectedError,
    TResult? Function(String? reason)? unprocessableEntity,
    TResult? Function()? internalServerError,
    TResult? Function()? serviceUnavailable,
    TResult? Function()? noInternetConnection,
    TResult? Function()? formatException,
    TResult? Function(String? error)? defaultError,
    TResult? Function(String error)? typeException,
    TResult? Function(String? error)? platformException,
  }) {
    return formatException?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestCancelled,
    TResult Function()? requestTimeout,
    TResult Function()? sendTimeout,
    TResult Function()? receiveTimeout,
    TResult Function(String? error)? badRequest,
    TResult Function(String? reason)? unauthorizedRequest,
    TResult Function(String? reason)? notFound,
    TResult Function()? unexpectedError,
    TResult Function(String? reason)? unprocessableEntity,
    TResult Function()? internalServerError,
    TResult Function()? serviceUnavailable,
    TResult Function()? noInternetConnection,
    TResult Function()? formatException,
    TResult Function(String? error)? defaultError,
    TResult Function(String error)? typeException,
    TResult Function(String? error)? platformException,
    required TResult orElse(),
  }) {
    if (formatException != null) {
      return formatException();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestCancelled value) requestCancelled,
    required TResult Function(_RequestTimeout value) requestTimeout,
    required TResult Function(_SendTimeout value) sendTimeout,
    required TResult Function(_ReceiveTimeout value) receiveTimeout,
    required TResult Function(_BadRequest value) badRequest,
    required TResult Function(_UnauthorizedRequest value) unauthorizedRequest,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_UnexpectedError value) unexpectedError,
    required TResult Function(_UnprocessableEntity value) unprocessableEntity,
    required TResult Function(_InternalServerError value) internalServerError,
    required TResult Function(_ServiceUnavailable value) serviceUnavailable,
    required TResult Function(_NoInternetConnection value) noInternetConnection,
    required TResult Function(_FormatException value) formatException,
    required TResult Function(_DefaultError value) defaultError,
    required TResult Function(_TypeException value) typeException,
    required TResult Function(_PlatformException value) platformException,
  }) {
    return formatException(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestCancelled value)? requestCancelled,
    TResult? Function(_RequestTimeout value)? requestTimeout,
    TResult? Function(_SendTimeout value)? sendTimeout,
    TResult? Function(_ReceiveTimeout value)? receiveTimeout,
    TResult? Function(_BadRequest value)? badRequest,
    TResult? Function(_UnauthorizedRequest value)? unauthorizedRequest,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_UnexpectedError value)? unexpectedError,
    TResult? Function(_UnprocessableEntity value)? unprocessableEntity,
    TResult? Function(_InternalServerError value)? internalServerError,
    TResult? Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult? Function(_NoInternetConnection value)? noInternetConnection,
    TResult? Function(_FormatException value)? formatException,
    TResult? Function(_DefaultError value)? defaultError,
    TResult? Function(_TypeException value)? typeException,
    TResult? Function(_PlatformException value)? platformException,
  }) {
    return formatException?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestCancelled value)? requestCancelled,
    TResult Function(_RequestTimeout value)? requestTimeout,
    TResult Function(_SendTimeout value)? sendTimeout,
    TResult Function(_ReceiveTimeout value)? receiveTimeout,
    TResult Function(_BadRequest value)? badRequest,
    TResult Function(_UnauthorizedRequest value)? unauthorizedRequest,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_UnexpectedError value)? unexpectedError,
    TResult Function(_UnprocessableEntity value)? unprocessableEntity,
    TResult Function(_InternalServerError value)? internalServerError,
    TResult Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult Function(_NoInternetConnection value)? noInternetConnection,
    TResult Function(_FormatException value)? formatException,
    TResult Function(_DefaultError value)? defaultError,
    TResult Function(_TypeException value)? typeException,
    TResult Function(_PlatformException value)? platformException,
    required TResult orElse(),
  }) {
    if (formatException != null) {
      return formatException(this);
    }
    return orElse();
  }
}

abstract class _FormatException implements AppExceptions {
  const factory _FormatException() = _$FormatExceptionImpl;
}

/// @nodoc
abstract class _$$DefaultErrorImplCopyWith<$Res> {
  factory _$$DefaultErrorImplCopyWith(
          _$DefaultErrorImpl value, $Res Function(_$DefaultErrorImpl) then) =
      __$$DefaultErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? error});
}

/// @nodoc
class __$$DefaultErrorImplCopyWithImpl<$Res>
    extends _$AppExceptionsCopyWithImpl<$Res, _$DefaultErrorImpl>
    implements _$$DefaultErrorImplCopyWith<$Res> {
  __$$DefaultErrorImplCopyWithImpl(
      _$DefaultErrorImpl _value, $Res Function(_$DefaultErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppExceptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$DefaultErrorImpl(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$DefaultErrorImpl implements _DefaultError {
  const _$DefaultErrorImpl(this.error);

  @override
  final String? error;

  @override
  String toString() {
    return 'AppExceptions.defaultError(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DefaultErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of AppExceptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DefaultErrorImplCopyWith<_$DefaultErrorImpl> get copyWith =>
      __$$DefaultErrorImplCopyWithImpl<_$DefaultErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestCancelled,
    required TResult Function() requestTimeout,
    required TResult Function() sendTimeout,
    required TResult Function() receiveTimeout,
    required TResult Function(String? error) badRequest,
    required TResult Function(String? reason) unauthorizedRequest,
    required TResult Function(String? reason) notFound,
    required TResult Function() unexpectedError,
    required TResult Function(String? reason) unprocessableEntity,
    required TResult Function() internalServerError,
    required TResult Function() serviceUnavailable,
    required TResult Function() noInternetConnection,
    required TResult Function() formatException,
    required TResult Function(String? error) defaultError,
    required TResult Function(String error) typeException,
    required TResult Function(String? error) platformException,
  }) {
    return defaultError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requestCancelled,
    TResult? Function()? requestTimeout,
    TResult? Function()? sendTimeout,
    TResult? Function()? receiveTimeout,
    TResult? Function(String? error)? badRequest,
    TResult? Function(String? reason)? unauthorizedRequest,
    TResult? Function(String? reason)? notFound,
    TResult? Function()? unexpectedError,
    TResult? Function(String? reason)? unprocessableEntity,
    TResult? Function()? internalServerError,
    TResult? Function()? serviceUnavailable,
    TResult? Function()? noInternetConnection,
    TResult? Function()? formatException,
    TResult? Function(String? error)? defaultError,
    TResult? Function(String error)? typeException,
    TResult? Function(String? error)? platformException,
  }) {
    return defaultError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestCancelled,
    TResult Function()? requestTimeout,
    TResult Function()? sendTimeout,
    TResult Function()? receiveTimeout,
    TResult Function(String? error)? badRequest,
    TResult Function(String? reason)? unauthorizedRequest,
    TResult Function(String? reason)? notFound,
    TResult Function()? unexpectedError,
    TResult Function(String? reason)? unprocessableEntity,
    TResult Function()? internalServerError,
    TResult Function()? serviceUnavailable,
    TResult Function()? noInternetConnection,
    TResult Function()? formatException,
    TResult Function(String? error)? defaultError,
    TResult Function(String error)? typeException,
    TResult Function(String? error)? platformException,
    required TResult orElse(),
  }) {
    if (defaultError != null) {
      return defaultError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestCancelled value) requestCancelled,
    required TResult Function(_RequestTimeout value) requestTimeout,
    required TResult Function(_SendTimeout value) sendTimeout,
    required TResult Function(_ReceiveTimeout value) receiveTimeout,
    required TResult Function(_BadRequest value) badRequest,
    required TResult Function(_UnauthorizedRequest value) unauthorizedRequest,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_UnexpectedError value) unexpectedError,
    required TResult Function(_UnprocessableEntity value) unprocessableEntity,
    required TResult Function(_InternalServerError value) internalServerError,
    required TResult Function(_ServiceUnavailable value) serviceUnavailable,
    required TResult Function(_NoInternetConnection value) noInternetConnection,
    required TResult Function(_FormatException value) formatException,
    required TResult Function(_DefaultError value) defaultError,
    required TResult Function(_TypeException value) typeException,
    required TResult Function(_PlatformException value) platformException,
  }) {
    return defaultError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestCancelled value)? requestCancelled,
    TResult? Function(_RequestTimeout value)? requestTimeout,
    TResult? Function(_SendTimeout value)? sendTimeout,
    TResult? Function(_ReceiveTimeout value)? receiveTimeout,
    TResult? Function(_BadRequest value)? badRequest,
    TResult? Function(_UnauthorizedRequest value)? unauthorizedRequest,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_UnexpectedError value)? unexpectedError,
    TResult? Function(_UnprocessableEntity value)? unprocessableEntity,
    TResult? Function(_InternalServerError value)? internalServerError,
    TResult? Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult? Function(_NoInternetConnection value)? noInternetConnection,
    TResult? Function(_FormatException value)? formatException,
    TResult? Function(_DefaultError value)? defaultError,
    TResult? Function(_TypeException value)? typeException,
    TResult? Function(_PlatformException value)? platformException,
  }) {
    return defaultError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestCancelled value)? requestCancelled,
    TResult Function(_RequestTimeout value)? requestTimeout,
    TResult Function(_SendTimeout value)? sendTimeout,
    TResult Function(_ReceiveTimeout value)? receiveTimeout,
    TResult Function(_BadRequest value)? badRequest,
    TResult Function(_UnauthorizedRequest value)? unauthorizedRequest,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_UnexpectedError value)? unexpectedError,
    TResult Function(_UnprocessableEntity value)? unprocessableEntity,
    TResult Function(_InternalServerError value)? internalServerError,
    TResult Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult Function(_NoInternetConnection value)? noInternetConnection,
    TResult Function(_FormatException value)? formatException,
    TResult Function(_DefaultError value)? defaultError,
    TResult Function(_TypeException value)? typeException,
    TResult Function(_PlatformException value)? platformException,
    required TResult orElse(),
  }) {
    if (defaultError != null) {
      return defaultError(this);
    }
    return orElse();
  }
}

abstract class _DefaultError implements AppExceptions {
  const factory _DefaultError(final String? error) = _$DefaultErrorImpl;

  String? get error;

  /// Create a copy of AppExceptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DefaultErrorImplCopyWith<_$DefaultErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TypeExceptionImplCopyWith<$Res> {
  factory _$$TypeExceptionImplCopyWith(
          _$TypeExceptionImpl value, $Res Function(_$TypeExceptionImpl) then) =
      __$$TypeExceptionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$TypeExceptionImplCopyWithImpl<$Res>
    extends _$AppExceptionsCopyWithImpl<$Res, _$TypeExceptionImpl>
    implements _$$TypeExceptionImplCopyWith<$Res> {
  __$$TypeExceptionImplCopyWithImpl(
      _$TypeExceptionImpl _value, $Res Function(_$TypeExceptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppExceptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$TypeExceptionImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TypeExceptionImpl implements _TypeException {
  const _$TypeExceptionImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'AppExceptions.typeException(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TypeExceptionImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of AppExceptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TypeExceptionImplCopyWith<_$TypeExceptionImpl> get copyWith =>
      __$$TypeExceptionImplCopyWithImpl<_$TypeExceptionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestCancelled,
    required TResult Function() requestTimeout,
    required TResult Function() sendTimeout,
    required TResult Function() receiveTimeout,
    required TResult Function(String? error) badRequest,
    required TResult Function(String? reason) unauthorizedRequest,
    required TResult Function(String? reason) notFound,
    required TResult Function() unexpectedError,
    required TResult Function(String? reason) unprocessableEntity,
    required TResult Function() internalServerError,
    required TResult Function() serviceUnavailable,
    required TResult Function() noInternetConnection,
    required TResult Function() formatException,
    required TResult Function(String? error) defaultError,
    required TResult Function(String error) typeException,
    required TResult Function(String? error) platformException,
  }) {
    return typeException(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requestCancelled,
    TResult? Function()? requestTimeout,
    TResult? Function()? sendTimeout,
    TResult? Function()? receiveTimeout,
    TResult? Function(String? error)? badRequest,
    TResult? Function(String? reason)? unauthorizedRequest,
    TResult? Function(String? reason)? notFound,
    TResult? Function()? unexpectedError,
    TResult? Function(String? reason)? unprocessableEntity,
    TResult? Function()? internalServerError,
    TResult? Function()? serviceUnavailable,
    TResult? Function()? noInternetConnection,
    TResult? Function()? formatException,
    TResult? Function(String? error)? defaultError,
    TResult? Function(String error)? typeException,
    TResult? Function(String? error)? platformException,
  }) {
    return typeException?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestCancelled,
    TResult Function()? requestTimeout,
    TResult Function()? sendTimeout,
    TResult Function()? receiveTimeout,
    TResult Function(String? error)? badRequest,
    TResult Function(String? reason)? unauthorizedRequest,
    TResult Function(String? reason)? notFound,
    TResult Function()? unexpectedError,
    TResult Function(String? reason)? unprocessableEntity,
    TResult Function()? internalServerError,
    TResult Function()? serviceUnavailable,
    TResult Function()? noInternetConnection,
    TResult Function()? formatException,
    TResult Function(String? error)? defaultError,
    TResult Function(String error)? typeException,
    TResult Function(String? error)? platformException,
    required TResult orElse(),
  }) {
    if (typeException != null) {
      return typeException(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestCancelled value) requestCancelled,
    required TResult Function(_RequestTimeout value) requestTimeout,
    required TResult Function(_SendTimeout value) sendTimeout,
    required TResult Function(_ReceiveTimeout value) receiveTimeout,
    required TResult Function(_BadRequest value) badRequest,
    required TResult Function(_UnauthorizedRequest value) unauthorizedRequest,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_UnexpectedError value) unexpectedError,
    required TResult Function(_UnprocessableEntity value) unprocessableEntity,
    required TResult Function(_InternalServerError value) internalServerError,
    required TResult Function(_ServiceUnavailable value) serviceUnavailable,
    required TResult Function(_NoInternetConnection value) noInternetConnection,
    required TResult Function(_FormatException value) formatException,
    required TResult Function(_DefaultError value) defaultError,
    required TResult Function(_TypeException value) typeException,
    required TResult Function(_PlatformException value) platformException,
  }) {
    return typeException(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestCancelled value)? requestCancelled,
    TResult? Function(_RequestTimeout value)? requestTimeout,
    TResult? Function(_SendTimeout value)? sendTimeout,
    TResult? Function(_ReceiveTimeout value)? receiveTimeout,
    TResult? Function(_BadRequest value)? badRequest,
    TResult? Function(_UnauthorizedRequest value)? unauthorizedRequest,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_UnexpectedError value)? unexpectedError,
    TResult? Function(_UnprocessableEntity value)? unprocessableEntity,
    TResult? Function(_InternalServerError value)? internalServerError,
    TResult? Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult? Function(_NoInternetConnection value)? noInternetConnection,
    TResult? Function(_FormatException value)? formatException,
    TResult? Function(_DefaultError value)? defaultError,
    TResult? Function(_TypeException value)? typeException,
    TResult? Function(_PlatformException value)? platformException,
  }) {
    return typeException?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestCancelled value)? requestCancelled,
    TResult Function(_RequestTimeout value)? requestTimeout,
    TResult Function(_SendTimeout value)? sendTimeout,
    TResult Function(_ReceiveTimeout value)? receiveTimeout,
    TResult Function(_BadRequest value)? badRequest,
    TResult Function(_UnauthorizedRequest value)? unauthorizedRequest,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_UnexpectedError value)? unexpectedError,
    TResult Function(_UnprocessableEntity value)? unprocessableEntity,
    TResult Function(_InternalServerError value)? internalServerError,
    TResult Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult Function(_NoInternetConnection value)? noInternetConnection,
    TResult Function(_FormatException value)? formatException,
    TResult Function(_DefaultError value)? defaultError,
    TResult Function(_TypeException value)? typeException,
    TResult Function(_PlatformException value)? platformException,
    required TResult orElse(),
  }) {
    if (typeException != null) {
      return typeException(this);
    }
    return orElse();
  }
}

abstract class _TypeException implements AppExceptions {
  const factory _TypeException(final String error) = _$TypeExceptionImpl;

  String get error;

  /// Create a copy of AppExceptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TypeExceptionImplCopyWith<_$TypeExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PlatformExceptionImplCopyWith<$Res> {
  factory _$$PlatformExceptionImplCopyWith(_$PlatformExceptionImpl value,
          $Res Function(_$PlatformExceptionImpl) then) =
      __$$PlatformExceptionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? error});
}

/// @nodoc
class __$$PlatformExceptionImplCopyWithImpl<$Res>
    extends _$AppExceptionsCopyWithImpl<$Res, _$PlatformExceptionImpl>
    implements _$$PlatformExceptionImplCopyWith<$Res> {
  __$$PlatformExceptionImplCopyWithImpl(_$PlatformExceptionImpl _value,
      $Res Function(_$PlatformExceptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppExceptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$PlatformExceptionImpl(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$PlatformExceptionImpl implements _PlatformException {
  const _$PlatformExceptionImpl(this.error);

  @override
  final String? error;

  @override
  String toString() {
    return 'AppExceptions.platformException(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlatformExceptionImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of AppExceptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlatformExceptionImplCopyWith<_$PlatformExceptionImpl> get copyWith =>
      __$$PlatformExceptionImplCopyWithImpl<_$PlatformExceptionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestCancelled,
    required TResult Function() requestTimeout,
    required TResult Function() sendTimeout,
    required TResult Function() receiveTimeout,
    required TResult Function(String? error) badRequest,
    required TResult Function(String? reason) unauthorizedRequest,
    required TResult Function(String? reason) notFound,
    required TResult Function() unexpectedError,
    required TResult Function(String? reason) unprocessableEntity,
    required TResult Function() internalServerError,
    required TResult Function() serviceUnavailable,
    required TResult Function() noInternetConnection,
    required TResult Function() formatException,
    required TResult Function(String? error) defaultError,
    required TResult Function(String error) typeException,
    required TResult Function(String? error) platformException,
  }) {
    return platformException(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requestCancelled,
    TResult? Function()? requestTimeout,
    TResult? Function()? sendTimeout,
    TResult? Function()? receiveTimeout,
    TResult? Function(String? error)? badRequest,
    TResult? Function(String? reason)? unauthorizedRequest,
    TResult? Function(String? reason)? notFound,
    TResult? Function()? unexpectedError,
    TResult? Function(String? reason)? unprocessableEntity,
    TResult? Function()? internalServerError,
    TResult? Function()? serviceUnavailable,
    TResult? Function()? noInternetConnection,
    TResult? Function()? formatException,
    TResult? Function(String? error)? defaultError,
    TResult? Function(String error)? typeException,
    TResult? Function(String? error)? platformException,
  }) {
    return platformException?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestCancelled,
    TResult Function()? requestTimeout,
    TResult Function()? sendTimeout,
    TResult Function()? receiveTimeout,
    TResult Function(String? error)? badRequest,
    TResult Function(String? reason)? unauthorizedRequest,
    TResult Function(String? reason)? notFound,
    TResult Function()? unexpectedError,
    TResult Function(String? reason)? unprocessableEntity,
    TResult Function()? internalServerError,
    TResult Function()? serviceUnavailable,
    TResult Function()? noInternetConnection,
    TResult Function()? formatException,
    TResult Function(String? error)? defaultError,
    TResult Function(String error)? typeException,
    TResult Function(String? error)? platformException,
    required TResult orElse(),
  }) {
    if (platformException != null) {
      return platformException(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestCancelled value) requestCancelled,
    required TResult Function(_RequestTimeout value) requestTimeout,
    required TResult Function(_SendTimeout value) sendTimeout,
    required TResult Function(_ReceiveTimeout value) receiveTimeout,
    required TResult Function(_BadRequest value) badRequest,
    required TResult Function(_UnauthorizedRequest value) unauthorizedRequest,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_UnexpectedError value) unexpectedError,
    required TResult Function(_UnprocessableEntity value) unprocessableEntity,
    required TResult Function(_InternalServerError value) internalServerError,
    required TResult Function(_ServiceUnavailable value) serviceUnavailable,
    required TResult Function(_NoInternetConnection value) noInternetConnection,
    required TResult Function(_FormatException value) formatException,
    required TResult Function(_DefaultError value) defaultError,
    required TResult Function(_TypeException value) typeException,
    required TResult Function(_PlatformException value) platformException,
  }) {
    return platformException(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestCancelled value)? requestCancelled,
    TResult? Function(_RequestTimeout value)? requestTimeout,
    TResult? Function(_SendTimeout value)? sendTimeout,
    TResult? Function(_ReceiveTimeout value)? receiveTimeout,
    TResult? Function(_BadRequest value)? badRequest,
    TResult? Function(_UnauthorizedRequest value)? unauthorizedRequest,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_UnexpectedError value)? unexpectedError,
    TResult? Function(_UnprocessableEntity value)? unprocessableEntity,
    TResult? Function(_InternalServerError value)? internalServerError,
    TResult? Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult? Function(_NoInternetConnection value)? noInternetConnection,
    TResult? Function(_FormatException value)? formatException,
    TResult? Function(_DefaultError value)? defaultError,
    TResult? Function(_TypeException value)? typeException,
    TResult? Function(_PlatformException value)? platformException,
  }) {
    return platformException?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestCancelled value)? requestCancelled,
    TResult Function(_RequestTimeout value)? requestTimeout,
    TResult Function(_SendTimeout value)? sendTimeout,
    TResult Function(_ReceiveTimeout value)? receiveTimeout,
    TResult Function(_BadRequest value)? badRequest,
    TResult Function(_UnauthorizedRequest value)? unauthorizedRequest,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_UnexpectedError value)? unexpectedError,
    TResult Function(_UnprocessableEntity value)? unprocessableEntity,
    TResult Function(_InternalServerError value)? internalServerError,
    TResult Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult Function(_NoInternetConnection value)? noInternetConnection,
    TResult Function(_FormatException value)? formatException,
    TResult Function(_DefaultError value)? defaultError,
    TResult Function(_TypeException value)? typeException,
    TResult Function(_PlatformException value)? platformException,
    required TResult orElse(),
  }) {
    if (platformException != null) {
      return platformException(this);
    }
    return orElse();
  }
}

abstract class _PlatformException implements AppExceptions {
  const factory _PlatformException(final String? error) =
      _$PlatformExceptionImpl;

  String? get error;

  /// Create a copy of AppExceptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlatformExceptionImplCopyWith<_$PlatformExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
