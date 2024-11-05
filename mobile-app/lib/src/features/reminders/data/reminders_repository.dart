import '../../../../core/api/exceptions/exceptions.dart';
import '../../../../core/api/response/response.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/utils/locator.dart';

class ReminderRepository {
  ReminderRepository() : _apiService = injector<ApiService>();
  final ApiService _apiService;

  Future<ApiResult<SuccessfulApiResponse?, AppExceptions>> addReminder(
      Map<String, dynamic> payload) async {
    try {
      final response =
          await _apiService.client.post(ApiUrl.addReminder, data: payload);

      final apiResult = SuccessfulApiResponse.fromJson(
        response.data,
        (json) {},
      );

      return (response: apiResult, exception: null);
    } catch (e) {
      final exception = AppExceptions.handleExceptions(e);
      return (response: null, exception: exception);
    }
  }
}
