import 'package:ellipsis_care/src/features/authentication/models/user/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Initialize test dependencies
  Map<String, dynamic> testResponse = {
    "user": {
      "email": "tokiolaoluwa01@gmail.com",
      "username": "Olaoluwa",
      "otp": "146618"
    },
  };

  User testUser = const User(
    email: "tokiolaoluwa01@gmail.com",
    username: "Olaoluwa",
    otp: "146618",
  );

  test("Deserialization Test", () {
    var test = User.fromJson(testResponse["user"]);
    expect(test, testUser);
  });
}
