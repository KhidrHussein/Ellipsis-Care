import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:telephony_sms/telephony_sms.dart';

class SmsService {
  final TelephonySMS _service = TelephonySMS();

  Future<void> askForPermission() async {
    try {
      await _service.requestPermission();
    } catch (e) {
      "$runtimeType Error: ${e.runtimeType} $e".printLog();
    }
  }

  Future<void> sendSms(String phoneNumber, String message) async {
    try {
      await _service
          .sendSMS(phone: phoneNumber, message: message)
          .then((status) {
        "$runtimeType Status: Successfully sent SOS".printLog();
      });
    } catch (e) {
      "$runtimeType Error: ${e.runtimeType} $e".printLog();
    }
  }
}
