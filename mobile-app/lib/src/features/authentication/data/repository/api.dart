import 'package:ellipsis_care/core/services/api_service.dart';
import 'package:ellipsis_care/core/utils/locator.dart';

class AuthenticationRepository {
  AuthenticationRepository() : _service = injector<ApiService>();

  final ApiService _service;
  
}
