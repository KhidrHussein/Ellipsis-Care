// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupResponse _$SignupResponseFromJson(Map<String, dynamic> json) =>
    SignupResponse(
      email: json['email'] as String,
      username: json['username'] as String?,
      otp: json['otp'] as String,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
    );

Map<String, dynamic> _$SignupResponseToJson(SignupResponse instance) =>
    <String, dynamic>{
      'email': instance.email,
      'otp': instance.otp,
      'username': instance.username,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
    };
