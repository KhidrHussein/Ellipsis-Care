import 'package:hive_flutter/hive_flutter.dart';

import '../../src/features/emergency/domain/emergency_contact.dart';
import '../../src/shared/models/user_information/user_information_model.dart';
import '../../src/shared/models/app_session/app_session_model.dart';
import '../utils/extensions.dart';

class StorageService {
  Future<void> initializeStorage() => Hive.initFlutter();

  void registerModels() async {
    Hive.registerAdapter(AppSessionModelAdapter());
    Hive.registerAdapter(UserInformationModelAdapter());
    Hive.registerAdapter(EmergencyContactAdapter());
  }

  Future<AppSessionModel?> getAppSession() async {
    try {
      var box = await Hive.openBox<AppSessionModel>('app_session_box');
      "${box.values}".printLog();
      return box.get('app_session', defaultValue: AppSessionModel());
    } catch (e) {
      "$runtimeType Error: $e".printLog();
      return null;
    }
  }

  Future<UserInformationModel?> getUser() async {
    try {
      var box = await Hive.openBox<UserInformationModel>('user_box');
      "${box.values}".printLog();
      return box.get('user', defaultValue: UserInformationModel());
    } catch (e) {
      "$runtimeType Error: $e".printLog();
      return null;
    }
  }

  Future<void> storeEmergencyContact(EmergencyContact? contact) async {
    if (contact != null) {
      try {
        final contactsBox =
            await Hive.openBox<EmergencyContact>('emergency_contacts');

        await contactsBox.put(contact.id, contact);
      } catch (e) {
        "$runtimeType Error: $e".printLog();
      }
    }
  }

  Future<List<EmergencyContact>?> getEmergencyContacts() async {
    try {
      final contactsBox =
          await Hive.openBox<EmergencyContact>('emergency_contacts');

      return [...contactsBox.values];
    } catch (e) {
      "$runtimeType Error: $e".printLog();
      return null;
    }
  }

  Future<void> editContactInformation(EmergencyContact contact) async {
    try {
      final contactsBox =
          await Hive.openBox<EmergencyContact>('emergency_contacts');

      await contactsBox.put(contact.id, contact);
    } catch (e) {
      "$runtimeType Error: $e".printLog();
    }
  }

  Future<void> deleteEmergencyContact(String id) async {
    try {
      final contactsBox =
          await Hive.openBox<EmergencyContact>('emergency_contacts');

      await contactsBox.delete(id);
    } catch (e) {
      "$runtimeType Error: $e".printLog();
    }
  }
}
