import 'package:fpdart/fpdart.dart';

import 'package:ellipsis_care/src/features/settings/model/update_profile_response/update_profile_response.dart';

import '../../../../core/api/exceptions/exceptions.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/injector.dart';

class SettingsRepository {
  final ApiService _service = injector<ApiService>();

  Future<Either<UpdateProfileResponse, AppExceptions>> updateProfile(
      Map<String, dynamic> payload) async {
    try {
      final apiResponse =
          await _service.put(ApiUrl.updateProfile, data: payload);
      final updatedProfile =
          UpdateProfileResponse.fromJson(apiResponse.data["data"]);

      return left(updatedProfile);
    } catch (e) {
      "$runtimeType exception \n Exception Type: ${e.runtimeType} \n Exception Details: $e \n"
          .printLog();

      final exception = AppExceptions.handleExceptions(e);
      return right(exception);
    }
  }

  Future<Either<String, AppExceptions>> changePassword(
      Map<String, dynamic> payload) async {
    try {
      final response =
          await _service.post(ApiUrl.changePassword, data: payload);

      return left(response.data["message"]);
    } catch (e) {
      "$runtimeType exception \n Exception Type: ${e.runtimeType} \n Exception Details: $e \n"
          .printLog();

      final exception = AppExceptions.handleExceptions(e);
      return right(exception);
    }
  }
}
