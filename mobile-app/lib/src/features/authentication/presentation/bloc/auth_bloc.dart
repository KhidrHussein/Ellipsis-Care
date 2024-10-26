import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/api/exceptions/exceptions.dart';
import '../../../../../core/utils/locator.dart';
import '../../data/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc()
      : _apiRepository = injector<AuthenticationRepository>(),
        super(InitialState()) {
    on<SignInEvent>(_signIn);
    on<SignUpEvent>(_signUp);
    on<OTPVerificationEvent>(_verifyOTP);
    on<ForgotPasswordEvent>(_forgotPassword);
    on<GoogleOAuthEvent>(_useGoogleOAuth);
  }

  final AuthenticationRepository _apiRepository;

  void _signIn(SignInEvent event, Emitter<AuthenticationState> handler) async {
    final Map<String, dynamic> payload = {
      "email": event.email,
      "password": event.password,
    };

    handler.call(LoadingState());

    final result = await _apiRepository.signIn(payload);

    if (result.response != null) {
      handler.call(
        AuthenticationPassed(data: result.response!),
      );
    } else {
      final String errorMessage =
          AppExceptions.getErrorMessage(result.exception!);
      handler.call(AuthenticationFailed(error: errorMessage));
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

    final result = await _apiRepository.signUp(payload);

    if (result.response != null) {
      handler.call(
        AuthenticationPassed(data: result.response!.data),
      );
    } else {
      final String errorMessage =
          AppExceptions.getErrorMessage(result.exception!);
      handler.call(AuthenticationFailed(error: errorMessage));
    }
  }

  void _useGoogleOAuth(
      GoogleOAuthEvent event, Emitter<AuthenticationState> handler) async {
    handler.call(LoadingState());

    final result = await _apiRepository.signInWithGoogle();

    if (result.response != null) {
      List<String>? names = result.response?.displayName?.split(' ');

      if (event.isNewUser) {
        final Map<String, dynamic> payload = {
          "email": result.response?.email,
          "first_name": names?.first,
          "last_name": names?.last,
        };
        
        final apiResponse = await _apiRepository.signUp(payload);
        
        if (apiResponse.response != null) {
          handler.call(
            AuthenticationPassed(data: apiResponse.response!),
          );
        } else {
          final String errorMessage =
              AppExceptions.getErrorMessage(result.exception);
          handler.call(AuthenticationFailed(error: errorMessage));
        }
      } else {
        final Map<String, dynamic> payload = {"email": result.response?.email};

        final apiResponse = await _apiRepository.signIn(payload);

        if (apiResponse.response != null) {
          handler.call(
            AuthenticationPassed(data: apiResponse.response!),
          );
        } else {
          final String errorMessage =
              AppExceptions.getErrorMessage(result.exception);
          handler.call(AuthenticationFailed(error: errorMessage));
        }
      }
    }
  }

  void _forgotPassword(
      ForgotPasswordEvent event, Emitter<AuthenticationState> handler) async {
    handler.call(LoadingState());
    // final result = await _repository.forgotPassword(event.email);

    // if (result.response != null) {
    //   handler.call(
    //     AuthenticationPassed(data: result.response!),
    //   );
    // } else {
    //   handler.call(AuthenticationFailed());
    //   UtilHelpers.showAlert(
    //       title: "Error", message: "Failed to create an account");
    // }
  }

  void _verifyOTP(
      OTPVerificationEvent event, Emitter<AuthenticationState> handler) async {}
}
