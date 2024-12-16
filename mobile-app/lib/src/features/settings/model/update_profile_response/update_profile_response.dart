// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'update_profile_response.g.dart';

@JsonSerializable()
class UpdateProfileResponse {
  const UpdateProfileResponse({required this.user, required this.profile});

  final UserResponse user;
  final ProfileResponse profile;

  factory UpdateProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProfileResponseToJson(this);

  @override
  String toString() => 'UpdateProfileResponse(user: $user, profile: $profile)';
}

@JsonSerializable()
class UserResponse {
  const UserResponse({
    required this.email,
    required this.firstName,
    required this.lastName,
  });

  final String? email;

  @JsonKey(name: "first_name")
  final String? firstName;

  @JsonKey(name: "last_name")
  final String? lastName;

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);

  @override
  String toString() => 'UserResponse(email: $email, firstName: $firstName, lastName: $lastName)';
}

@JsonSerializable()
class ProfileResponse {
  const ProfileResponse({
    this.dob,
    this.gender,
    this.languagePreference,
  });

  final String? gender;

  @JsonKey(name: "date_of_birth")
  final String? dob;

  @JsonKey(name: "language_preference")
  final String? languagePreference;

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseToJson(this);

  @override
  String toString() => 'ProfileResponse(gender: $gender, dob: $dob, languagePreference: $languagePreference)';
}
