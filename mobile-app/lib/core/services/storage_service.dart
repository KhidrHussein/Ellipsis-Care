import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:ellipsis_care/src/features/authentication/domain/userdata/userdata.dart';
import 'package:ellipsis_care/src/features/emergency/domain/emergency_contact.dart';
import 'package:hive_flutter/hive_flutter.dart';

class StorageService {
  Future<void> initializeStorage() => Hive.initFlutter();

  void registerModels() async {
    Hive.registerAdapter(UserDataAdapter());
    Hive.registerAdapter(EmergencyContactAdapter());
  }

  Future<void> initSession() async {
    try {
      final sessionBox = await Hive.openBox<UserData>('user_session');
      await sessionBox.put(
        'user_data_session',
        UserData(
          enableDarkMode: false,
          showNotifications: false,
          hasViewedOnboarding: false,
        ),
      );
    } catch (e) {
      "$runtimeType Error: $e".printLog();
    }
  }

  Future<UserData?> getUserData() async {
    try {
      var sessionBox = await Hive.openBox<UserData>('user_session');
      return sessionBox.get('user_data_session');
    } catch (e) {
      "$runtimeType Error: $e".printLog();
      return null;
    }
  }

  Future<void> storeEmergencyContacts(List<EmergencyContact> contacts) async {
    try {
      final contactsBox =
          await Hive.openBox<List<EmergencyContact>>('emergency_contacts');
      await contactsBox.put('contacts', contacts);
    } catch (e) {
      "$runtimeType Error: $e".printLog();
    }
  }

  Future<List<EmergencyContact>?> getEmegencyContacts() async {
    try {
      var contactsBox =
          await Hive.openBox<List<EmergencyContact>>('emergency_contacts');
      return contactsBox.get('contacts');
    } catch (e) {
      "$runtimeType Error: $e".printLog();
      return null;
    }
  }
}
