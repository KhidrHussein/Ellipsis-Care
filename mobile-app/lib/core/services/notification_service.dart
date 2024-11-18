import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';

import 'package:ellipsis_care/core/utils/extensions.dart';

import '../../src/features/reminders/models/event.dart';

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

  Future<void> createReminderNotification({required Event event}) async {
    final int id = Random().nextInt(50);

    try {
      await _service.createNotification(
        content: NotificationContent(
          id: id,
          category: NotificationCategory.Event,
          channelKey: "ellipsis_care_reminder",
          title: event.name,
          body: event.content,
        ),
        schedule: NotificationCalendar(
          repeats: true,
          day: event.day,
          month: event.month,
          year: event.year,
          hour: event.timeInHours,
          minute: event.timeInMinutes,
        ),
        actionButtons: [
          NotificationActionButton(
            key: "complete_button",
            label: "Mark as complete",
          )
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
