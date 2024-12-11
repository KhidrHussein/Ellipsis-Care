// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive_flutter/hive_flutter.dart';

part 'app_session_model.g.dart';

@HiveType(typeId: 0)
class UserSessionModel extends HiveObject {
  @HiveField(0)
  bool hasUserOnboard;

  @HiveField(1)
  bool isLoggedIn;

  UserSessionModel({
    this.isLoggedIn = false,
    this.hasUserOnboard = false,
  });

  @override
  String toString() =>
      'UserSessionModel(hasUserOnboard: $hasUserOnboard, isLoggedIn: $isLoggedIn)';
}
