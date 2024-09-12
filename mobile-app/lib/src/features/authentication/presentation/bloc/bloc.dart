import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ellipsis_care/core/constants/app_state.dart';

part 'event.dart';

class AutheticationBloc extends Bloc<AuthenticationEvent, AppState> {
  AutheticationBloc() : super(const Data()) {
    on<SignInEvent>(signIn);
    on<SignUpEvent>(signUp);
    on<OTPVerificationEvent>(verifyOTP);
    on<ForgotPasswordEvent>(forgotPassword);
  }

  void signIn(SignInEvent event, Emitter handler) async {
    
  }

  void signUp(SignUpEvent event, Emitter handler) async {}

  void forgotPassword(ForgotPasswordEvent event, Emitter handler) async {}

  void verifyOTP(OTPVerificationEvent event, Emitter handler) async {}
}
