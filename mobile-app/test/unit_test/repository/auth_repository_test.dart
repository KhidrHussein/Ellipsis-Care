import 'package:ellipsis_care/src/features/authentication/data/auth_repository.dart';
import 'package:ellipsis_care/src/features/authentication/models/signin/signin_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([AuthenticationRepository])
import 'auth_repository_test.mocks.dart';

void main() {
  final mockAuth = MockAuthenticationRepository();
  final SigninResponse mockSuccess = SigninResponse(
    email: "admin@gmail.com",
    token: "",
    firstName: "Ellipsis",
    lastName: "Admin        ",
  );

  group(        "Tests for [Authentication Repository]", () {
    test('Check if the sign', () async {
      final response = await mockAuth.signIn({
        "email": "admin@gmail.com",
        "firstName": "Ellipsis",
        "lastName": "Admin",
      });

      response.fold(
        (success) {
          expect(success.data, mockSuccess);
        },
        (error) {},
      );
    });
  });
}
