import 'package:ellipsis_care/core/services/storage_service.dart';
import 'package:ellipsis_care/src/shared/models/user_information/user_information_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ellipsis_care/core/utils/enums/api_state.dart';

import '../../../../../core/api/exceptions/exceptions.dart';
import '../../../../../core/utils/locator.dart';
import '../../data/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc()
      : _apiRepository = injector<AuthenticationRepository>(),
        _storageService = injector<StorageService>(),
        super(const AuthenticationState()) {
    on<SignInEvent>(_signIn);
    on<SignUpEvent>(_signUp);
    on<OTPVerificationEvent>(_verifyOTP);
    on<ForgotPasswordEvent>(_forgotPassword);
    on<GoogleOAuthEvent>(_useGoogleOAuth);
  }

  final AuthenticationRepository _apiRepository;
  final StorageService _storageService;

  void _signIn(SignInEvent event, Emitter<AuthenticationState> emit) async {
    Map<String, dynamic> payload = {
      "email": event.email,
      "password": event.password,
    };

    emit(state.copyWith(apiState: ApiState.loading));
    try {
      final result = await _apiRepository.signIn(payload);

      result.fold(
        (success) {
          _updateUserAccount(success.data!);
          emit(state.copyWith(apiState: ApiState.success));
        },
        (exception) {
          final errorMessage = AppExceptions.getErrorMessage(exception);
          emit(state.copyWith(apiState: ApiState.failed, error: errorMessage));
        },
      );
    } catch (e) {
      emit(state.copyWith(apiState: ApiState.failed, error: "$e"));
    }
  }

  void _signUp(SignUpEvent event, Emitter<AuthenticationState> emit) async {
    Map<String, dynamic> payload = {
      "email": event.email,
      "password": event.password,
      "re_password": event.password,
      "first_name": event.firstName,
      "last_name": event.lastName
    };

    emit(state.copyWith(apiState: ApiState.loading));
    try {
      final result = await _apiRepository.signUp(payload);

      result.fold(
        (success) {
          _createUserAccount(success.data!.email, success.data!.username);

          emit(state.copyWith(apiState: ApiState.success));
        },
        (exception) {
          final errorMessage = AppExceptions.getErrorMessage(exception);
          emit(state.copyWith(apiState: ApiState.failed, error: errorMessage));
        },
      );
    } catch (e) {
      emit(state.copyWith(apiState: ApiState.failed, error: "$e"));
    }
  }

  void _verifyOTP(
      OTPVerificationEvent event, Emitter<AuthenticationState> emit) async {
    Map<String, dynamic> payload = {
      "email": event.email,
      "verification_code": event.verificationCode,
    };

    emit(state.copyWith(apiState: ApiState.loading));
    try {
      final result = await _apiRepository.verifyEmail(payload);
      result.fold(
        (successfulResponse) {
          emit(state.copyWith(apiState: ApiState.success));
        },
        (exception) {
          final errorMessage = AppExceptions.getErrorMessage(exception);
          emit(state.copyWith(apiState: ApiState.failed, error: errorMessage));
        },
      );
    } catch (e) {
      emit(state.copyWith(apiState: ApiState.failed, error: "$e"));
    }
  }

  void _useGoogleOAuth(
      GoogleOAuthEvent event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(apiState: ApiState.loading, isUsingOauth: true));
    try {
      final oauthResult = await _apiRepository.signInWithGoogle();

      oauthResult.fold(
        (googleCredentials) {
          List<String>? names = googleCredentials?.displayName?.split(' ');

          if (event.isNewUser) {
            final Map<String, dynamic> payload = {
              "email": googleCredentials?.email,
              "first_name": names?.first,
              "last_name": names?.last,
            };
            _signUpNewUser(payload, emit);
          } else {
            Map<String, dynamic> payload = {"email": googleCredentials?.email};
            _signInNewUser(payload, emit);
          }
        },
        (exception) {
          final errorMessage = AppExceptions.getErrorMessage(exception);
          emit(state.copyWith(apiState: ApiState.failed, error: errorMessage));
        },
      );
    } catch (e) {
      emit(state.copyWith(apiState: ApiState.failed, error: "$e"));
    }
  }

  void _forgotPassword(
      ForgotPasswordEvent event, Emitter<AuthenticationState> emit) async {}

  void _signInNewUser(
      Map<String, dynamic> payload, Emitter<AuthenticationState> emit) async {
    try {
      final result = await _apiRepository.signIn(payload);

      result.fold(
        (successfulResponse) {
          emit(
            state.copyWith(apiState: ApiState.success),
          );
        },
        (exception) {
          final errorMessage = AppExceptions.getErrorMessage(exception);
          emit(state.copyWith(apiState: ApiState.failed, error: errorMessage));
        },
      );
    } catch (e) {
      emit(state.copyWith(apiState: ApiState.failed, error: "$e"));
    }
  }

  void _signUpNewUser(
      Map<String, dynamic> payload, Emitter<AuthenticationState> emit) async {
    try {
      final result = await _apiRepository.signUp(payload);

      result.fold(
        (successfulResponse) {
          emit(
            state.copyWith(apiState: ApiState.success),
          );
        },
        (exception) {
          final errorMessage = AppExceptions.getErrorMessage(exception);
          emit(state.copyWith(apiState: ApiState.failed, error: errorMessage));
        },
      );
    } catch (e) {
      emit(state.copyWith(apiState: ApiState.failed, error: "$e"));
    }
  }

  void _createUserAccount(String email, String username) async {
    final user = await _storageService.getUser();
    user?.email = email;
    user?.username = username;
    await user?.save();
  }

  void _updateUserAccount(String id) async {
    final user = await _storageService.getUser();
    user?.userID = id;
    await user?.save();
  }
}