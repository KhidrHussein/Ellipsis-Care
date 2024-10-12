import 'package:flutter_contacts/flutter_contacts.dart';

import '../utils/extensions.dart';
import '../../src/features/emergency/domain/emergency_contact.dart';
class PhoneContactService {
  Future<EmergencyContact?> pickContact() async {
    try {
      final contact = await FlutterContacts.openExternalPick();
      final List<String>? phoneNumber =
          contact?.phones.map((phone) => phone.number).toList();

      return contact != null
          ? EmergencyContact(
              name: contact.displayName,
              phoneNumbers: phoneNumber,
              photo: contact.photoOrThumbnail,
            )
          : null;
    } catch (e) {
      "$runtimeType Error: $e".printLog();
      return null;
    }
  }

  Future<bool> checkForPermission() => FlutterContacts.requestPermission();
}
