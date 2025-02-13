// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignupResponseNormalImpl _$$SignupResponseNormalImplFromJson(
        Map<String, dynamic> json) =>
    _$SignupResponseNormalImpl(
      email: json['email'] as String,
      username: json['username'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      verificationCode: json['verification_code'] as String?,
      organizationName: json['linked_organization'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SignupResponseNormalImplToJson(
        _$SignupResponseNormalImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'username': instance.username,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'verification_code': instance.verificationCode,
      'linked_organization': instance.organizationName,
      'runtimeType': instance.$type,
    };

_$SignupWithGoogleResponseImpl _$$SignupWithGoogleResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SignupWithGoogleResponseImpl(
      token: json['token'] as String,
      email: json['email'] as String,
      gender: json['gender'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      languagePreference: json['language_preference'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SignupWithGoogleResponseImplToJson(
        _$SignupWithGoogleResponseImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'email': instance.email,
      'gender': instance.gender,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'language_preference': instance.languagePreference,
      'runtimeType': instance.$type,
    };
