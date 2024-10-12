import 'package:hive_flutter/hive_flutter.dart';

import '../utils/extensions.dart';
import '../../src/features/authentication/domain/models/userdata/userdata.dart';
import '../../src/features/emergency/domain/emergency_contact.dart';
import 'package:uuid/uuid.dart';

class StorageService {
  final Uuid _id = const Uuid();

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
          isLoggedIn: false,
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
      return sessionBox.get('user_data_session')!;
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

        await contactsBox.put('contact${_id.v4()}', contact);
      } catch (e) {
        "$runtimeType Error: $e".printLog();
      }
    }
  }

  Future<List<EmergencyContact>?> getEmegencyContacts() async {
    try {
      final contactsBox =
          await Hive.openBox<EmergencyContact>('emergency_contacts');

      return [...contactsBox.values];
    } catch (e) {
      "$runtimeType Error: $e".printLog();
      return null;
    }
  }
}
