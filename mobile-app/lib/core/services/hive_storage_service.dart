import 'package:ellipsis_care/src/features/settings/model/settings_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:ellipsis_care/core/utils/enums/reminder_options/reminder_options.dart';
import 'package:ellipsis_care/src/features/reminders/models/reminder_model.dart/reminder_model.dart';

import '../../src/features/emergency/domain/emergency_contact.dart';
import '../../src/shared/models/app_session/app_session_model.dart';
import '../../src/shared/models/user/user_model.dart';
import '../utils/extensions.dart';

class HiveStorageService {
  Future<void> initializeStorage() => Hive.initFlutter();

  void registerModels() async {
    Hive.registerAdapter(UserSessionModelAdapter()); // typeId = 0
    Hive.registerAdapter(UserModelAdapter()); // typeId = 1
    Hive.registerAdapter(EmergencyContactAdapter()); // typeId = 2
    Hive.registerAdapter(ReminderModelAdapter()); // typeId = 3
    Hive.registerAdapter(ReminderIntervalAdapter()); // typeId = 4
    Hive.registerAdapter(ReminderScheduleAdapter()); // typeId = 5
    Hive.registerAdapter(ReminderInstructionAdapter()); // typeId = 6
    Hive.registerAdapter(ReminderTypeAdapter()); // typeId = 7
    Hive.registerAdapter(SettingsModelAdapter()); // typeId = 8
  }

  Future<UserSessionModel?> getAppSession() async {
    try {
      var box = await Hive.openBox<UserSessionModel>('app_session_box');
      return box.get('app_session', defaultValue: UserSessionModel());
    } catch (e) {
      "$runtimeType Error: $e".printLog();
    }
    return null;
  }

  Future<SettingsModel?> getSettings() async {
    try {
      var box = await Hive.openBox<SettingsModel>('settings_box');
      return box.get('app_session', defaultValue: SettingsModel());
    } catch (e) {
      "$runtimeType Error: $e".printLog();
    }
    return null;
  }

  Future<UserModel?> getUser() async {
    try {
      var box = await Hive.openBox<UserModel>('user_box');
      return box.get('user', defaultValue: UserModel());
    } catch (e) {
      "$runtimeType Error: $e".printLog();
    }
    return null;
  }

  Future<void> storeReminder(ReminderModel reminder) async {
    try {
      final reminders = await Hive.openBox<ReminderModel>('reminder_events');
      await reminders.put(reminder.id, reminder);
    } catch (e) {
      "$runtimeType Error: $e".printLog();
    }
  }

  Future<void> editReminder(ReminderModel reminder) async {
    try {
      final contactsBox = await Hive.openBox<ReminderModel>('reminder_events');
      await contactsBox.put(reminder.id, reminder);
    } catch (e) {
      "$runtimeType Error: $e".printLog();
    }
  }

  Future<List<ReminderModel>> getAllReminders() async {
    try {
      final reminders = await Hive.openBox<ReminderModel>('reminder_events');
      return reminders.values.whereType<ReminderModel>().toList();
    } catch (e) {
      "$runtimeType Error: $e".printLog();
      return [];
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

  Future<List<EmergencyContact>> getEmergencyContacts() async {
    try {
      final contactsBox =
          await Hive.openBox<EmergencyContact>('emergency_contacts');
      return [...contactsBox.values];
    } catch (e) {
      "$runtimeType Error: $e".printLog();
      return [];
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
