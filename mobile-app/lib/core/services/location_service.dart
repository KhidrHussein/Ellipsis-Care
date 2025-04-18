import 'package:fpdart/fpdart.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

import '../../config/env.dart';
import '../api/exceptions/exceptions.dart';
import '../utils/typedef.dart';

// class LocationService {
//   Future<void> askForPermission() async {
//     try {
//       LocationPermission permission = await Geolocator.requestPermission();

//       switch (permission) {
//         case LocationPermission.deniedForever:
//           await Geolocator.openAppSettings();
//           break;

//         default:
//           "$runtimeType Permission: $permission".printLog();
//       }
//     } catch (e) {
//       "$runtimeType Error: ${e.runtimeType} $e".printLog();
//     }
//   }

//   Future<String?> getCurrentLocation() async {
//     try {
//       Position userLocation = await Geolocator.getCurrentPosition();
//       List<Placemark> placemarks = await placemarkFromCoordinates(
//           userLocation.latitude, userLocation.longitude);

//       String currentAddress = "${placemarks.first.name!}, "
//           "${placemarks.first.locality!}, "
//           "${placemarks.first.country!}";

//       "$runtimeType Current Location: $currentAddress".printLog();

//       return currentAddress;
//     } catch (e) {
//       "$runtimeType Error: ${e.runtimeType} $e".printLog();
//     }
//     return null;
//   }
// }

class TwilioPhoneService {
  final TwilioFlutter _twilioFlutter = TwilioFlutter(
    accountSid: Env.twilioAccountSID,
    authToken: Env.twilioAuthToken,
    twilioNumber: Env.twilioPhoneNumber,
  );

  FutureEitherOf<TwilioResponse> sendSms({
    required String phoneNumber,
    required String message,
  }) async {
    try {
      final response = await _twilioFlutter.sendSMS(
          toNumber: phoneNumber, messageBody: message);

      return left(response);
    } catch (e) {
      final exception = AppExceptions.handleExceptions(e);
      return right(exception);
    }
  }
}
