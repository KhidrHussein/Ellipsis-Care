// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive_flutter/hive_flutter.dart';

part 'user_information_model.g.dart';

@HiveType(typeId: 1)
class UserInformationModel extends HiveObject {
  @HiveField(0)
  String userID;

  @HiveField(1)
  String email;

  @HiveField(2)
  String firstname;

  @HiveField(3)
  String lastname;

  @HiveField(4)
  String username;

  @HiveField(5)
  String photoUrl;

  @HiveField(6)
  String googleOAuthID;

  UserInformationModel({
    this.userID = "",
    this.firstname = "",
    this.lastname = "",
    this.photoUrl = "",
    this.googleOAuthID = "",
    this.email = "",
    this.username = "",
  });
}
