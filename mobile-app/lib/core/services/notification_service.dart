import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:ellipsis_care/core/services/background_audio_handler.dart';
import 'package:ellipsis_care/core/utils/injector.dart';

import '../utils/extensions.dart';

class NotificationService {
  NotificationService() {
    _setListeners();
  }

  final List<NotificationChannel> _channels = [
    NotificationChannel(
      channelKey: "ellipsis_care_reminder",
      channelName: "Ellipsis Care Reminder",
      channelDescription: "This manages reminders created by the user.",
    )
  ];

  final AwesomeNotifications _service = AwesomeNotifications();

  Future<void> init() async {
    try {
      final hasSetupSystem =
          await _service.initialize(null, _channels, debug: true);
      "Noitification Service is initialized ?$hasSetupSystem".printLog();
    } catch (e) {
      "$runtimeType Error: $e".printLog();
    }
  }

  Future<bool> checkForPermission() =>
      _service.requestPermissionToSendNotifications();

  Future<void> createReminderNotification({
    required String title,
    required String desc,
    required DateTime scheduledDate,
    String? filePath,
  }) async {
    final int id = DateTime.now().millisecondsSinceEpoch.remainder(100000);

    try {
      await _service.createNotification(
        content: NotificationContent(
          id: id,
          category: NotificationCategory.Reminder,
          channelKey: "ellipsis_care_reminder",
          title: title,
          body: desc,
          customSound: "file:/$filePath",
        ),
        schedule: NotificationCalendar.fromDate(
          date: scheduledDate,
          repeats: true,
          preciseAlarm: true,
        ),
        actionButtons: [
          NotificationActionButton(key: "complete_button", label: "Done")
        ],
      );
    } catch (e) {
      "$runtimeType Error: $e".printLog();
    }
  }

  void _setListeners() async {
    await _service.setListeners(
      onActionReceivedMethod: _NotificationController.onActionReceivedMethod,
      onNotificationDisplayedMethod:
          _NotificationController.onNotificationDisplayedMethod,
    );
  }
}

class _NotificationController {
  /// Use this method to detect every time that a new notification is displayed
  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    receivedNotification.printLog();
    try {
      if (receivedNotification.customSound != null) {
        final filePath = receivedNotification.customSound!;
        if (await File(filePath).exists()) {
          final audioService = injector<BackgroundAudioService>();
          audioService.handler.path = filePath;
          await audioService.handler.play();
        } else {
          "File does not exist: $filePath".printLog();
        }
      }
    } catch (e) {
      "Error playing custom sound: $e".printLog();
    }
  }

  /// Use this method to detect when the user taps on a notification or action button
  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {}
}
