import 'package:ellipsis_care/core/api/exceptions/exceptions.dart';
import 'package:ellipsis_care/core/utils/locator.dart';
import 'package:ellipsis_care/src/features/authentication/data/api.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/helpers.dart';

part 'event.dart';
part 'state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(DefaultState()) {
    on<SignInEvent>(_signIn);
    on<SignUpEvent>(_signUp);
    on<OTPVerificationEvent>(_verifyOTP);
    on<ForgotPasswordEvent>(_forgotPassword);
  }

  final AuthenticationRepository _repository =
      injector<AuthenticationRepository>();

  void _signIn(SignInEvent event, Emitter<AuthenticationState> handler) async {
     final Map<String, dynamic> payload = {
      "email": event.email,
      "password": event.password,
    };
    handler.call(LoadingState());

    final result = await _repository.signIn(payload);
    if (result.response != null) {
      handler.call(
        AuthenticationPassed(data: result.response!.data),
      );
    } else {
      final String error = AppExceptions.getErrorMessage(result.exception!);
      handler.call(
        AuthenticationFailed(error: error),
      );
      UtilHelpers.showAlert(title: "Error", message: error);
    }
  }

  void _signUp(SignUpEvent event, Emitter<AuthenticationState> handler) async {
    final Map<String, dynamic> payload = {
      "email": event.email,
      "password": event.password,
      "re_password": event.password,
      "first_name": event.firstName,
      "last_name": event.lastName
    };
    handler.call(LoadingState());

    final result = await _repository.signUp(payload);
    if (result.response != null) {
      handler.call(
        AuthenticationPassed(data: result.response!.data),
      );
    } else {
      final String error = AppExceptions.getErrorMessage(result.exception!);
      handler.call(
        AuthenticationFailed(error: error),
      );
      UtilHelpers.showAlert(title: "Error", message: error);
    }
  }

  void _forgotPassword(
      ForgotPasswordEvent event, Emitter<AuthenticationState> handler) async {}

  void _verifyOTP(
      OTPVerificationEvent event, Emitter<AuthenticationState> handler) async {}
}
