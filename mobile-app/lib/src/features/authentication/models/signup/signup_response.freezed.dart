// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SignupResponse _$SignupResponseFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'default':
      return SignupResponseNormal.fromJson(json);
    case 'withGoogle':
      return SignupWithGoogleResponse.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'SignupResponse',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$SignupResponse {
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: "first_name")
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: "last_name")
  String? get lastName => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String email,
            String? username,
            @JsonKey(name: "first_name") String? firstName,
            @JsonKey(name: "last_name") String? lastName,
            @JsonKey(name: "verification_code") String? verificationCode,
            @JsonKey(name: "linked_organization") String? organizationName)
        $default, {
    required TResult Function(
            String token,
            String email,
            String? gender,
            @JsonKey(name: "first_name") String? firstName,
            @JsonKey(name: "last_name") String? lastName,
            @JsonKey(name: "language_preference") String? languagePreference)
        withGoogle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String email,
            String? username,
            @JsonKey(name: "first_name") String? firstName,
            @JsonKey(name: "last_name") String? lastName,
            @JsonKey(name: "verification_code") String? verificationCode,
            @JsonKey(name: "linked_organization") String? organizationName)?
        $default, {
    TResult? Function(
            String token,
            String email,
            String? gender,
            @JsonKey(name: "first_name") String? firstName,
            @JsonKey(name: "last_name") String? lastName,
            @JsonKey(name: "language_preference") String? languagePreference)?
        withGoogle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String email,
            String? username,
            @JsonKey(name: "first_name") String? firstName,
            @JsonKey(name: "last_name") String? lastName,
            @JsonKey(name: "verification_code") String? verificationCode,
            @JsonKey(name: "linked_organization") String? organizationName)?
        $default, {
    TResult Function(
            String token,
            String email,
            String? gender,
            @JsonKey(name: "first_name") String? firstName,
            @JsonKey(name: "last_name") String? lastName,
            @JsonKey(name: "language_preference") String? languagePreference)?
        withGoogle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(SignupResponseNormal value) $default, {
    required TResult Function(SignupWithGoogleResponse value) withGoogle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(SignupResponseNormal value)? $default, {
    TResult? Function(SignupWithGoogleResponse value)? withGoogle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(SignupResponseNormal value)? $default, {
    TResult Function(SignupWithGoogleResponse value)? withGoogle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this SignupResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SignupResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignupResponseCopyWith<SignupResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignupResponseCopyWith<$Res> {
  factory $SignupResponseCopyWith(
          SignupResponse value, $Res Function(SignupResponse) then) =
      _$SignupResponseCopyWithImpl<$Res, SignupResponse>;
  @useResult
  $Res call(
      {String email,
      @JsonKey(name: "first_name") String? firstName,
      @JsonKey(name: "last_name") String? lastName});
}

/// @nodoc
class _$SignupResponseCopyWithImpl<$Res, $Val extends SignupResponse>
    implements $SignupResponseCopyWith<$Res> {
  _$SignupResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignupResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? firstName = freezed,
    Object? lastName = freezed,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignupResponseNormalImplCopyWith<$Res>
    implements $SignupResponseCopyWith<$Res> {
  factory _$$SignupResponseNormalImplCopyWith(_$SignupResponseNormalImpl value,
          $Res Function(_$SignupResponseNormalImpl) then) =
      __$$SignupResponseNormalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String? username,
      @JsonKey(name: "first_name") String? firstName,
      @JsonKey(name: "last_name") String? lastName,
      @JsonKey(name: "verification_code") String? verificationCode,
      @JsonKey(name: "linked_organization") String? organizationName});
}

/// @nodoc
class __$$SignupResponseNormalImplCopyWithImpl<$Res>
    extends _$SignupResponseCopyWithImpl<$Res, _$SignupResponseNormalImpl>
    implements _$$SignupResponseNormalImplCopyWith<$Res> {
  __$$SignupResponseNormalImplCopyWithImpl(_$SignupResponseNormalImpl _value,
      $Res Function(_$SignupResponseNormalImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignupResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? username = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? verificationCode = freezed,
    Object? organizationName = freezed,
  }) {
    return _then(_$SignupResponseNormalImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      verificationCode: freezed == verificationCode
          ? _value.verificationCode
          : verificationCode // ignore: cast_nullable_to_non_nullable
              as String?,
      organizationName: freezed == organizationName
          ? _value.organizationName
          : organizationName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignupResponseNormalImpl implements SignupResponseNormal {
  const _$SignupResponseNormalImpl(
      {required this.email,
      this.username,
      @JsonKey(name: "first_name") this.firstName,
      @JsonKey(name: "last_name") this.lastName,
      @JsonKey(name: "verification_code") this.verificationCode,
      @JsonKey(name: "linked_organization") this.organizationName,
      final String? $type})
      : $type = $type ?? 'default';

  factory _$SignupResponseNormalImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignupResponseNormalImplFromJson(json);

  @override
  final String email;
  @override
  final String? username;
  @override
  @JsonKey(name: "first_name")
  final String? firstName;
  @override
  @JsonKey(name: "last_name")
  final String? lastName;
  @override
  @JsonKey(name: "verification_code")
  final String? verificationCode;
  @override
  @JsonKey(name: "linked_organization")
  final String? organizationName;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SignupResponse(email: $email, username: $username, firstName: $firstName, lastName: $lastName, verificationCode: $verificationCode, organizationName: $organizationName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignupResponseNormalImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.verificationCode, verificationCode) ||
                other.verificationCode == verificationCode) &&
            (identical(other.organizationName, organizationName) ||
                other.organizationName == organizationName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, username, firstName,
      lastName, verificationCode, organizationName);

  /// Create a copy of SignupResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignupResponseNormalImplCopyWith<_$SignupResponseNormalImpl>
      get copyWith =>
          __$$SignupResponseNormalImplCopyWithImpl<_$SignupResponseNormalImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String email,
            String? username,
            @JsonKey(name: "first_name") String? firstName,
            @JsonKey(name: "last_name") String? lastName,
            @JsonKey(name: "verification_code") String? verificationCode,
            @JsonKey(name: "linked_organization") String? organizationName)
        $default, {
    required TResult Function(
            String token,
            String email,
            String? gender,
            @JsonKey(name: "first_name") String? firstName,
            @JsonKey(name: "last_name") String? lastName,
            @JsonKey(name: "language_preference") String? languagePreference)
        withGoogle,
  }) {
    return $default(email, username, firstName, lastName, verificationCode,
        organizationName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String email,
            String? username,
            @JsonKey(name: "first_name") String? firstName,
            @JsonKey(name: "last_name") String? lastName,
            @JsonKey(name: "verification_code") String? verificationCode,
            @JsonKey(name: "linked_organization") String? organizationName)?
        $default, {
    TResult? Function(
            String token,
            String email,
            String? gender,
            @JsonKey(name: "first_name") String? firstName,
            @JsonKey(name: "last_name") String? lastName,
            @JsonKey(name: "language_preference") String? languagePreference)?
        withGoogle,
  }) {
    return $default?.call(email, username, firstName, lastName,
        verificationCode, organizationName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String email,
            String? username,
            @JsonKey(name: "first_name") String? firstName,
            @JsonKey(name: "last_name") String? lastName,
            @JsonKey(name: "verification_code") String? verificationCode,
            @JsonKey(name: "linked_organization") String? organizationName)?
        $default, {
    TResult Function(
            String token,
            String email,
            String? gender,
            @JsonKey(name: "first_name") String? firstName,
            @JsonKey(name: "last_name") String? lastName,
            @JsonKey(name: "language_preference") String? languagePreference)?
        withGoogle,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(email, username, firstName, lastName, verificationCode,
          organizationName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(SignupResponseNormal value) $default, {
    required TResult Function(SignupWithGoogleResponse value) withGoogle,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(SignupResponseNormal value)? $default, {
    TResult? Function(SignupWithGoogleResponse value)? withGoogle,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(SignupResponseNormal value)? $default, {
    TResult Function(SignupWithGoogleResponse value)? withGoogle,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SignupResponseNormalImplToJson(
      this,
    );
  }
}

abstract class SignupResponseNormal implements SignupResponse {
  const factory SignupResponseNormal(
      {required final String email,
      final String? username,
      @JsonKey(name: "first_name") final String? firstName,
      @JsonKey(name: "last_name") final String? lastName,
      @JsonKey(name: "verification_code") final String? verificationCode,
      @JsonKey(name: "linked_organization")
      final String? organizationName}) = _$SignupResponseNormalImpl;

  factory SignupResponseNormal.fromJson(Map<String, dynamic> json) =
      _$SignupResponseNormalImpl.fromJson;

  @override
  String get email;
  String? get username;
  @override
  @JsonKey(name: "first_name")
  String? get firstName;
  @override
  @JsonKey(name: "last_name")
  String? get lastName;
  @JsonKey(name: "verification_code")
  String? get verificationCode;
  @JsonKey(name: "linked_organization")
  String? get organizationName;

  /// Create a copy of SignupResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignupResponseNormalImplCopyWith<_$SignupResponseNormalImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignupWithGoogleResponseImplCopyWith<$Res>
    implements $SignupResponseCopyWith<$Res> {
  factory _$$SignupWithGoogleResponseImplCopyWith(
          _$SignupWithGoogleResponseImpl value,
          $Res Function(_$SignupWithGoogleResponseImpl) then) =
      __$$SignupWithGoogleResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String token,
      String email,
      String? gender,
      @JsonKey(name: "first_name") String? firstName,
      @JsonKey(name: "last_name") String? lastName,
      @JsonKey(name: "language_preference") String? languagePreference});
}

/// @nodoc
class __$$SignupWithGoogleResponseImplCopyWithImpl<$Res>
    extends _$SignupResponseCopyWithImpl<$Res, _$SignupWithGoogleResponseImpl>
    implements _$$SignupWithGoogleResponseImplCopyWith<$Res> {
  __$$SignupWithGoogleResponseImplCopyWithImpl(
      _$SignupWithGoogleResponseImpl _value,
      $Res Function(_$SignupWithGoogleResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignupResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? email = null,
    Object? gender = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? languagePreference = freezed,
  }) {
    return _then(_$SignupWithGoogleResponseImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      languagePreference: freezed == languagePreference
          ? _value.languagePreference
          : languagePreference // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignupWithGoogleResponseImpl implements SignupWithGoogleResponse {
  const _$SignupWithGoogleResponseImpl(
      {required this.token,
      required this.email,
      this.gender,
      @JsonKey(name: "first_name") this.firstName,
      @JsonKey(name: "last_name") this.lastName,
      @JsonKey(name: "language_preference") this.languagePreference,
      final String? $type})
      : $type = $type ?? 'withGoogle';

  factory _$SignupWithGoogleResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignupWithGoogleResponseImplFromJson(json);

  @override
  final String token;
  @override
  final String email;
  @override
  final String? gender;
  @override
  @JsonKey(name: "first_name")
  final String? firstName;
  @override
  @JsonKey(name: "last_name")
  final String? lastName;
  @override
  @JsonKey(name: "language_preference")
  final String? languagePreference;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SignupResponse.withGoogle(token: $token, email: $email, gender: $gender, firstName: $firstName, lastName: $lastName, languagePreference: $languagePreference)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignupWithGoogleResponseImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.languagePreference, languagePreference) ||
                other.languagePreference == languagePreference));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token, email, gender, firstName,
      lastName, languagePreference);

  /// Create a copy of SignupResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignupWithGoogleResponseImplCopyWith<_$SignupWithGoogleResponseImpl>
      get copyWith => __$$SignupWithGoogleResponseImplCopyWithImpl<
          _$SignupWithGoogleResponseImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String email,
            String? username,
            @JsonKey(name: "first_name") String? firstName,
            @JsonKey(name: "last_name") String? lastName,
            @JsonKey(name: "verification_code") String? verificationCode,
            @JsonKey(name: "linked_organization") String? organizationName)
        $default, {
    required TResult Function(
            String token,
            String email,
            String? gender,
            @JsonKey(name: "first_name") String? firstName,
            @JsonKey(name: "last_name") String? lastName,
            @JsonKey(name: "language_preference") String? languagePreference)
        withGoogle,
  }) {
    return withGoogle(
        token, email, gender, firstName, lastName, languagePreference);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String email,
            String? username,
            @JsonKey(name: "first_name") String? firstName,
            @JsonKey(name: "last_name") String? lastName,
            @JsonKey(name: "verification_code") String? verificationCode,
            @JsonKey(name: "linked_organization") String? organizationName)?
        $default, {
    TResult? Function(
            String token,
            String email,
            String? gender,
            @JsonKey(name: "first_name") String? firstName,
            @JsonKey(name: "last_name") String? lastName,
            @JsonKey(name: "language_preference") String? languagePreference)?
        withGoogle,
  }) {
    return withGoogle?.call(
        token, email, gender, firstName, lastName, languagePreference);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String email,
            String? username,
            @JsonKey(name: "first_name") String? firstName,
            @JsonKey(name: "last_name") String? lastName,
            @JsonKey(name: "verification_code") String? verificationCode,
            @JsonKey(name: "linked_organization") String? organizationName)?
        $default, {
    TResult Function(
            String token,
            String email,
            String? gender,
            @JsonKey(name: "first_name") String? firstName,
            @JsonKey(name: "last_name") String? lastName,
            @JsonKey(name: "language_preference") String? languagePreference)?
        withGoogle,
    required TResult orElse(),
  }) {
    if (withGoogle != null) {
      return withGoogle(
          token, email, gender, firstName, lastName, languagePreference);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(SignupResponseNormal value) $default, {
    required TResult Function(SignupWithGoogleResponse value) withGoogle,
  }) {
    return withGoogle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(SignupResponseNormal value)? $default, {
    TResult? Function(SignupWithGoogleResponse value)? withGoogle,
  }) {
    return withGoogle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(SignupResponseNormal value)? $default, {
    TResult Function(SignupWithGoogleResponse value)? withGoogle,
    required TResult orElse(),
  }) {
    if (withGoogle != null) {
      return withGoogle(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SignupWithGoogleResponseImplToJson(
      this,
    );
  }
}

abstract class SignupWithGoogleResponse implements SignupResponse {
  const factory SignupWithGoogleResponse(
      {required final String token,
      required final String email,
      final String? gender,
      @JsonKey(name: "first_name") final String? firstName,
      @JsonKey(name: "last_name") final String? lastName,
      @JsonKey(name: "language_preference")
      final String? languagePreference}) = _$SignupWithGoogleResponseImpl;

  factory SignupWithGoogleResponse.fromJson(Map<String, dynamic> json) =
      _$SignupWithGoogleResponseImpl.fromJson;

  String get token;
  @override
  String get email;
  String? get gender;
  @override
  @JsonKey(name: "first_name")
  String? get firstName;
  @override
  @JsonKey(name: "last_name")
  String? get lastName;
  @JsonKey(name: "language_preference")
  String? get languagePreference;

  /// Create a copy of SignupResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignupWithGoogleResponseImplCopyWith<_$SignupWithGoogleResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
