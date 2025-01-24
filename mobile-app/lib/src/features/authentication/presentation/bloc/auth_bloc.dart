import 'package:ellipsis_care/core/services/hive_storage_service.dart';
import 'package:ellipsis_care/core/services/oauth_service.dart';
import 'package:ellipsis_care/core/services/secure_storage.dart';
import 'package:ellipsis_care/core/utils/app_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ellipsis_care/core/enums/api_state.dart';

import '../../../../../core/api/exceptions/exceptions.dart';
import '../../../../../core/utils/injector.dart';
import '../../data/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc()
      : _hiveStorage = injector<HiveStorageService>(),
        _oAuthService = injector<OAuthService>(),
        _apiRepository = injector<AuthenticationRepository>(),
        super(const AuthenticationState()) {
    on<SignInEvent>(_signIn);
    on<SignUpEvent>(_signUp);
    on<CheckIfEmailExistsEvent>(_checkIfEmailExists);
    on<OTPVerificationEvent>(_verifyOTP);
    on<ForgotPasswordEvent>(_forgotPassword);
    on<GoogleOAuthEvent>(_signUpWithGoogle);
  }

  final AuthenticationRepository _apiRepository;
  final HiveStorageService _hiveStorage;
  final OAuthService _oAuthService;

  void _checkIfEmailExists(
      CheckIfEmailExistsEvent event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(state: ApiState.loading));

    final result = await _apiRepository.userExists(event.email);

    result.fold(
      (response) {
        emit(
          state.copyWith(
            error: "",
            state: ApiState.success,
            message: response.message,
          ),
        );
      },
      (exception) {
        final errorMessage = AppExceptions.getErrorMessage(exception);
        emit(
          state.copyWith(
            message: "",
            state: ApiState.failed,
            error: errorMessage,
          ),
        );
      },
    );
  }

  void _signIn(SignInEvent event, Emitter<AuthenticationState> emit) async {
    final Map<String, dynamic> payload = {
      "email": event.email,
      "password": event.password,
    };

    emit(state.copyWith(state: ApiState.loading));
    final result = await _apiRepository.signIn(payload);

    result.fold(
      (response) async {
        await injector<SecureStorage>().storeAccessToken(response.data!.token);

        _updateSession(
          email: response.data?.email,
          firstName: response.data?.firstName,
          lastName: response.data?.lastName,
        );

        _loginUser();

        emit(
          state.copyWith(
            state: ApiState.success,
            message: response.message,
          ),
        );
      },
      (exception) {
        final errorMessage = AppExceptions.getErrorMessage(exception);
        emit(
          state.copyWith(
            state: ApiState.failed,
            error: errorMessage,
          ),
        );
      },
    );
  }

  void _signUp(SignUpEvent event, Emitter<AuthenticationState> emit) async {
    Map<String, dynamic> payload = {
      "email": event.email,
      "password": event.password,
      "re_password": event.password,
      "first_name": event.firstName,
      "last_name": event.lastName,
    };

    emit(state.copyWith(state: ApiState.loading));

    final result = await _apiRepository.signUp(payload);

    result.fold(
      (response) {
        _updateSession(
          email: response.data?.email,
          firstName: response.data?.firstName,
          lastName: response.data?.lastName,
        );

        emit(
          state.copyWith(
            state: ApiState.success,
            message: response.message,
          ),
        );
      },
      (exception) {
        final errorMessage = AppExceptions.getErrorMessage(exception);
        emit(
          state.copyWith(
            state: ApiState.failed,
            error: errorMessage,
          ),
        );
      },
    );
  }

  void _verifyOTP(
      OTPVerificationEvent event, Emitter<AuthenticationState> emit) async {
    final Map<String, dynamic> payload = {
      "email": event.email,
      "verification_code": event.verificationCode,
    };

    emit(state.copyWith(state: ApiState.loading));

    final result = await _apiRepository.verifyEmail(payload);

    result.fold(
      (response) {
        emit(
          state.copyWith(
            state: ApiState.success,
            message: response.message,
          ),
        );
      },
      (exception) {
        final errorMessage = AppExceptions.getErrorMessage(exception);
        emit(
          state.copyWith(
            state: ApiState.failed,
            error: errorMessage,
          ),
        );
      },
    );
  }

  void _signUpWithGoogle(
      GoogleOAuthEvent event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(state: ApiState.loading));

    try {
      final account = await _oAuthService.signInWithGoogle();
      if (account != null) {
        final authentication = await account.authentication;
        final result =
            await _apiRepository.signUpWithGoogle(authentication.idToken);

        result.fold(
          (success) {
            emit(state.copyWith(state: ApiState.success));
          },
          (exception) {
            emit(
              state.copyWith(
                state: ApiState.failed,
                error: exception.toString(),
              ),
            );
          },
        );
      }
    } catch (e) {
      final exception = AppExceptions.handleExceptions(e);
      final error = AppExceptions.getErrorMessage(exception);
      emit(state.copyWith(state: ApiState.failed, error: error));
    }
  }

  void _forgotPassword(
      ForgotPasswordEvent event, Emitter<AuthenticationState> emit) async {
    final Map<String, dynamic> payload = {"email": event.email};

    emit(state.copyWith(state: ApiState.loading));

    final result = await _apiRepository.forgotPassword(payload);

    result.fold(
      (response) =>
          emit(state.copyWith(state: ApiState.success, data: response)),
      (exception) {
        final errorMessage = AppExceptions.getErrorMessage(exception);
        emit(state.copyWith(state: ApiState.failed, error: errorMessage));
      },
    );
  }

  void _updateSession({
    required String? email,
    required String? firstName,
    required String? lastName,
  }) async {
    await _hiveStorage.getUser().then((user) async {
      user?.email = email;
      user?.firstname = firstName;
      user?.lastname = lastName;
      await user?.save();
    });
  }

  void _loginUser() async {
    await _hiveStorage.getAppSession().then((session) async {
      session?.isLoggedIn = true;
      await session?.save();
    });
  }
}
