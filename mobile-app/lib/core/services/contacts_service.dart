import 'dart:typed_data';

import 'package:flutter_contacts/flutter_contacts.dart';

import 'package:ellipsis_care/core/utils/extensions.dart';

typedef PhoneContact = (
  String? name,
  List<String>? phoneNumber,
  Uint8List? profilePicture,
);

class PhoneContactService {
  Future<PhoneContact?> pickContact() async {
    try {
      final contact = await FlutterContacts.openExternalPick();
      final List<String>? phoneNumber =
          contact?.phones.map((phone) => phone.number).toList();

      return contact != null
          ? (contact.displayName, phoneNumber, contact.photo)
          : null;
          
    } catch (e) {
      "An exception occurred: $e".printLog();
      return null;
    }
  }

  Future<bool> checkForPermission() => FlutterContacts.requestPermission();
}
