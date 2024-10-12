import '../../../../../core/api/exceptions/exceptions.dart';
import '../../../../../core/utils/locator.dart';
import '../../domain/repository/authentication_repo.dart';
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

  final BaseAuthenticationRepository _repository =
      injector<BaseAuthenticationRepository>();

  void _signIn(SignInEvent event, Emitter<AuthenticationState> handler) async {
    handler.call(LoadingState());
    final result = await _repository.signIn(event.email!, event.password!);

    if (result.response != null) {
      handler.call(
        AuthenticationPassed(data: result.response!),
      );
    } else {
      final String error = AppExceptions.getErrorMessage(result.exception!);
      handler.call(AuthenticationFailed());
      UtilHelpers.showAlert(title: "Error", message: error);
    }
  }

  void _signUp(SignUpEvent event, Emitter<AuthenticationState> handler) async {
    // final Map<String, dynamic> payload = {
    //   "email": event.email,
    //   "password": event.password,
    //   "re_password": event.password,
    //   "first_name": event.firstName,
    //   "last_name": event.lastName
    // };
    handler.call(LoadingState());
    final result = await _repository.signUp(event.email!, event.password!);

    if (result.response != null) {
      handler.call(
        AuthenticationPassed(data: result.response!),
      );
    } else {
      handler.call(AuthenticationFailed());
      UtilHelpers.showAlert(
          title: "Error", message: "Failed to create an account");
    }
  }

  void _forgotPassword(
      ForgotPasswordEvent event, Emitter<AuthenticationState> handler) async {
    handler.call(LoadingState());
    final result = await _repository.forgotPassword(event.email);

    if (result.response != null) {
      handler.call(
        AuthenticationPassed(data: result.response!),
      );
    } else {
      handler.call(AuthenticationFailed());
      UtilHelpers.showAlert(
          title: "Error", message: "Failed to create an account");
    }
  }

  void _verifyOTP(
      OTPVerificationEvent event, Emitter<AuthenticationState> handler) async {}
}
