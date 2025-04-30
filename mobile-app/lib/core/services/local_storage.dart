import 'package:hive_flutter/hive_flutter.dart';

import '../utils/enums.dart';
import '../utils/storage_keys.dart';
import '../../src/features/reminders/models/reminder_model.dart/reminder_model.dart';
import '../../src/features/settings/model/settings_model.dart';

import '../../src/features/emergency/domain/emergency_contact.dart';
import '../../src/shared/models/user/user_model.dart';
import '../utils/extensions.dart';

class LocalStorage {
  Future<void> initializeStorage() => Hive.initFlutter();

  void registerModels() async {
    Hive.registerAdapter(UserModelAdapter()); // typeId = 1
    Hive.registerAdapter(EmergencyContactAdapter()); // typeId = 2
    Hive.registerAdapter(ReminderModelAdapter()); // typeId = 3
    Hive.registerAdapter(ReminderIntervalAdapter()); // typeId = 4
    Hive.registerAdapter(ReminderScheduleAdapter()); // typeId = 5
    Hive.registerAdapter(ReminderInstructionAdapter()); // typeId = 6
    Hive.registerAdapter(ReminderTypeAdapter()); // typeId = 7
    Hive.registerAdapter(SettingsModelAdapter()); // typeId = 8
  }

  Future<bool?> getOnboardingStatus() async {
    try {
      var box = await Hive.openBox<bool>(HiveBoxNames.onboarding);
      return box.get('onboarding_status', defaultValue: false);
    } catch (e) {
      "$runtimeType Error: $e".printLog();
    }
    return null;
  }

  void updateOnboardingStatus() async {
    try {
      var box = Hive.box<bool>(HiveBoxNames.onboarding);
      await box.put('onboarding_status', true);
    } catch (e) {
      "$runtimeType Error: $e".printLog();
    }
  }

  Future<SettingsModel?> getSettings() async {
    try {
      Box<SettingsModel> box;

      if (!Hive.isBoxOpen(HiveBoxNames.settings)) {
        box = await Hive.openBox<SettingsModel>(HiveBoxNames.settings);
      }
      box = Hive.box(HiveBoxNames.settings);

      return box.get('user-settings', defaultValue: SettingsModel());
    } catch (e) {
      "$runtimeType Error: $e".printLog();
    }
    return null;
  }

  Future<UserModel?> getUser() async {
    try {
      var box = await Hive.openBox<UserModel>(HiveBoxNames.user);
      return box.get('user', defaultValue: UserModel());
    } catch (e) {
      "$runtimeType Error: $e".printLog();
    }
    return null;
  }

  Future<void> storeReminder(ReminderModel reminder) async {
    try {
      final reminders =
          await Hive.openBox<ReminderModel>(HiveBoxNames.reminders);
      await reminders.put(reminder.id, reminder);
    } catch (e) {
      "$runtimeType Error: $e".printLog();
    }
  }

  Future<void> editReminder(ReminderModel reminder) async {
    try {
      final contactsBox = Hive.box<ReminderModel>(HiveBoxNames.reminders);
      await contactsBox.put(reminder.id, reminder);
    } catch (e) {
      "$runtimeType Error: $e".printLog();
    }
  }

  Future<List<ReminderModel>> getAllReminders() async {
    try {
      final reminders = Hive.box<ReminderModel>(HiveBoxNames.reminders);
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
            await Hive.openBox<EmergencyContact>(HiveBoxNames.emergency);
        await contactsBox.put(contact.id, contact);
      } catch (e) {
        "$runtimeType Error: $e".printLog();
      }
    }
  }

  Future<List<EmergencyContact>> getEmergencyContacts() async {
    try {
      Box<EmergencyContact> box;

      if (!Hive.isBoxOpen(HiveBoxNames.emergency)) {
        box = await Hive.openBox<EmergencyContact>(HiveBoxNames.emergency);
      }

      box = Hive.box(HiveBoxNames.emergency);
      return [...box.values];
    } catch (e) {
      "$runtimeType Error: $e".printLog();
      return [];
    }
  }

  Future<void> editContactInformation(EmergencyContact contact) async {
    try {
      final contactsBox = Hive.box<EmergencyContact>(HiveBoxNames.emergency);
      await contactsBox.put(contact.id, contact);
    } catch (e) {
      "$runtimeType Error: $e".printLog();
    }
  }

  Future<void> deleteEmergencyContact(String id) async {
    try {
      final contactsBox = Hive.box<EmergencyContact>(HiveBoxNames.emergency);
      await contactsBox.delete(id);
    } catch (e) {
      "$runtimeType Error: $e".printLog();
    }
  }

  Future<void> clearBoxStorage<T>(String boxName) async {
    bool validBox = (await Hive.boxExists(boxName) && Hive.isBoxOpen(boxName));
    if (validBox) {
      final box = Hive.box<T>(boxName);
      await box.clear();
    }
  }
}
