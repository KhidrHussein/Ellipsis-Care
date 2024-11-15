import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';

import 'package:ellipsis_care/core/utils/extensions.dart';

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

  void startListening() async {
    try {
      final isListening = await _service.setListeners(
        onActionReceivedMethod: (ReceivedAction action) => _demo(action),
      );

      "$isListening".printLog();
    } catch (e) {
      "$runtimeType Error: $e".printLog();
    }
  }

  Future<void> createReminderNotification(String name, String? body) async {
    final int id = Random().nextInt(50);

    try {
      await _service.createNotification(
        content: NotificationContent(
          id: id,
          channelKey: "ellipsis_care_reminder",
          title: name,
          body: body,
          // timeoutAfter: 
        ),
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
