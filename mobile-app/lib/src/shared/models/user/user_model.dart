// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive_flutter/hive_flutter.dart';

part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserModel extends HiveObject {
  @HiveField(0)
  String? email;

  @HiveField(1)
  String? firstname;

  @HiveField(2)
  String? lastname;

  @HiveField(3)
  String? username;

  @HiveField(4)
  String? photoUrl;

  UserModel({
    this.firstname,
    this.lastname,
    this.photoUrl,
    this.email,
    this.username,
  });

  @override
  String toString() {
    return 'UserModel(email: $email, firstname: $firstname, lastname: $lastname, username: $username, photoUrl: $photoUrl)';
  }
}
