import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';

import '../utils/extensions.dart';

import '../../src/features/reminders/models/notification_event.dart';

class NotificationService {
  final AwesomeNotifications _service = AwesomeNotifications();
  final List<NotificationChannel> _channels = [
    NotificationChannel(
      channelKey: "ellipsis_care_reminder",
      channelName: "Ellipsis Care Reminder",
      channelDescription:
          "This manages reminders and events created by the user.",
    )
  ];

  Future<void> init() async {
    try {
      final hasSetupSystem =
          await _service.initialize(null, _channels, debug: true);

      "Noitification Service is initialized ?$hasSetupSystem".printLog();
    } catch (e) {
      "$runtimeType Error: $e".printLog();
    }
  }

  Future<bool> checkForPermission() {
    return _service.requestPermissionToSendNotifications();
  }

  Future<void> createReminderNotification(
      {required NotificationEvent notification}) async {
    final int id = Random().nextInt(50);

    try {
      await _service.createNotification(
        content: NotificationContent(
          id: id,
          category: NotificationCategory.Event,
          channelKey: "ellipsis_care_reminder",
          title: notification.name,
          body: notification.content,
          customSound: "file://${notification.customSoundFilePath}",
        ),
        schedule: NotificationCalendar(
          repeats: true,
          hour: notification.eventTimeInHours,
          minute: notification.eventTimeInMinutes,
        ),
        actionButtons: [
          NotificationActionButton(key: "complete_button", label: "Done")
        ],
      );
    } catch (e) {
      "$runtimeType Error: $e".printLog();
    }
  }

  @pragma("vm:entry-point")
  Future<void> _demo(ReceivedAction action) async {
    "${action.toMap()}".printLog();
  }
}
