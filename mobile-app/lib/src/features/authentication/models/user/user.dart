// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class UserResponse {
  final String email;
  final String username;
  final String otp;

  const UserResponse({
    required this.email,
    required this.username,
    required this.otp,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) => _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);

  @override
  String toString() => 'UserResponse(email: $email, username: $username, otp: $otp)';

  @override
  bool operator ==(covariant UserResponse other) {
    if (identical(this, other)) return true;

    return other.email == email &&
        other.username == username &&
        other.otp == otp;
  }

  @override
  int get hashCode => email.hashCode ^ username.hashCode ^ otp.hashCode;
}
