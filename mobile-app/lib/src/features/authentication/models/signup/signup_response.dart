// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_response.freezed.dart';
part 'signup_response.g.dart';

@freezed
class SignupResponse with _$SignupResponse {
  const factory SignupResponse({
    required String email,
    String? username,
    @JsonKey(name: "first_name") String? firstName,
    @JsonKey(name: "last_name") String? lastName,
    @JsonKey(name: "verification_code") String? verificationCode,
    @JsonKey(name: "linked_organization") String? organizationName,
  }) = SignupResponseNormal;

  const factory SignupResponse.withGoogle({
    required String token,
    required String email,
    String? gender,
    @JsonKey(name: "first_name") String? firstName,
    @JsonKey(name: "last_name") String? lastName,
    @JsonKey(name: "language_preference") String? languagePreference,
  }) = SignupWithGoogleResponse;

  factory SignupResponse.fromJson(Map<String, Object?> json) =>
      _$SignupResponseFromJson(json);
}
