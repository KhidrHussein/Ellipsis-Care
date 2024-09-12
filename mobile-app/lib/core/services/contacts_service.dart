import 'package:flutter/material.dart';
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';

class EmergencyContactsService {
  EmergencyContactsService._internal();
  static EmergencyContactsService instance =
      EmergencyContactsService._internal();
  factory EmergencyContactsService() => instance;

  final FlutterContactPicker _picker = FlutterContactPicker();

  Future<Contact?> pickContact() async {
    try {
      final contact = await _picker.selectContact();
      debugPrint("Contact picked: $contact");
      return contact;
    } catch (e) {
      debugPrint("An exception occurred: $e");
      return null;
    }
  }

  Future<List<Contact>?> pickContacts() async {
    try {
      final contacts = await _picker.selectContacts();
      return contacts;
    } catch (e) {
      debugPrint("An exception occurred: $e");
      return null;
    }
  }
}
