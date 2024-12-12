
// void main() {
//   // Initialize test dependencies
//   Map<String, dynamic> testResponse = {
//     "user": {
//       "email": "tokiolaoluwa01@gmail.com",
//       "username": "Olaoluwa",
//       "otp": "146618"
//     },
//   };

//   // User testUser = const User(
//   //   email: "tokiolaoluwa01@gmail.com",
//   //   username: "Olaoluwa",
//   //   otp: "146618",
//   // );

//   // test("Deserialization Test", () {
//   //   var test = User.fromJson(testResponse["user"]);
//   //   expect(test, testUser);
//   // });
// }
String getDateFromIsoString(String isoString) {
  return isoString.split("T")[0];
}

String getTimeFromIsoString(String isoString) {
  final dateTime = DateTime.parse(isoString);
  return "${dateTime.hour.toString().padLeft(2, '0')}:"
      "${dateTime.minute.toString().padLeft(2, '0')}";
}

// void main() {
//   group("ISO string Formatting", () {
//     final date = DateTime.now().toUtc().toIso8601String();
//     test("Getting date", () {
//       expect(getDateFromIsoString(date), "2024-12-06");
//     });
//     test("Getting Time", () {
//       expect(getTimeFromIsoString(date), "13:39");
//     });
//   });
// }
