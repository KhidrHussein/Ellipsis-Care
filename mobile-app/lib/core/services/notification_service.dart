import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:uuid/uuid.dart';

class NotificationService {
  final AwesomeNotifications _service = AwesomeNotifications();
  final Uuid _id = const Uuid();

  Future<bool> checkForPermission() {
    return _service.requestPermissionToSendNotifications();
  }

  v() {
    // _service.initialize(defaultIcon, channels)
  }

}
