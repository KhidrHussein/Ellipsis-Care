import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';

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
    String? filePath,
    int? hours,
    int? minute,
  }) async {
    final int id = Random().nextInt(50);

    try {
      await _service.createNotification(
        content: NotificationContent(
          id: id,
          category: NotificationCategory.Event,
          channelKey: "ellipsis_care_reminder",
          title: title,
          body: desc,
          customSound: "file://$filePath",
        ),
        schedule: NotificationCalendar(hour: hours, minute: minute),
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
      onActionReceivedMethod: (ReceivedAction receivedAction) {
        return Future<void>.value();
      },
      onNotificationDisplayedMethod: (receivedNotification) {
        return Future<void>.value();
      },
    );
    // _backgroundAudioService.handler.setSource(
    //   DeviceFileSource(response.pathToAudioFile),
    // );
    // _backgroundAudioService.handler.play();
  }
}
