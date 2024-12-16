import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:uuid/uuid.dart';

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
              id: const Uuid().v4(),
              name: contact.displayName,
              phoneNumber: phoneNumber?.first,
              photo: contact.photoOrThumbnail,
            )
          : null;
    } catch (e) {
      "$runtimeType Error: $e".printLog();
      return null;
    }
  }

  Future<bool?> checkForPermission() async {
    try {
      final hasPermission = await FlutterContacts.requestPermission();
      "Contact Permission: $hasPermission".printLog();
      return hasPermission;
    } catch (e) {
      "$runtimeType Error: $e".printLog();
      return null;
    }
  }
}
