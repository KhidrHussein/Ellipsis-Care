import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<void> askForPermission() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();

      switch (permission) {
        case LocationPermission.deniedForever:
          await Geolocator.openAppSettings();
          break;

        default:
          "$runtimeType Permission: $permission".printLog();
      }
    } catch (e) {
      "$runtimeType Error: ${e.runtimeType} $e".printLog();
    }
  }

  Future<String?> getCurrentLocation() async {
    try {
      Position userLocation = await Geolocator.getCurrentPosition();
      List<Placemark> placemarks = await placemarkFromCoordinates(
          userLocation.latitude, userLocation.longitude);

      String currentAddress = "${placemarks.first.name!}, "
          "${placemarks.first.locality!}, "
          "${placemarks.first.country!}";

      "$runtimeType Current Location: $currentAddress".printLog();

      return currentAddress;
    } catch (e) {
      "$runtimeType Error: ${e.runtimeType} $e".printLog();
    }
    return null;
  }
}
