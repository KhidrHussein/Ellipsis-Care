// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'signup_response.g.dart';

@JsonSerializable()
class SignupResponse {
  const SignupResponse({
    required this.email,
    this.username,
    this.otp,
    this.firstName,
    this.lastName,
    this.organizationName,
  });

  final String email;

  final String? otp;

  final String? username;

  @JsonKey(name: "first_name")
  final String? firstName;

  @JsonKey(name: "last_name")
  final String? lastName;

  @JsonKey(name: "linked_organization")
  final String? organizationName;

  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignupResponseToJson(this);

  @override
  String toString() {
    return 'SignupResponse(email: $email, otp: $otp, username: $username, firstName: $firstName, lastName: $lastName)';
  }
}
