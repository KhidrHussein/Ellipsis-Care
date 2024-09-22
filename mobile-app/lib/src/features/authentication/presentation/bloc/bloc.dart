import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'event.dart';
part 'state.dart';

class AutheticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AutheticationBloc() : super(DefaultState()) {
    on<SignInEvent>(_signIn);
    on<SignUpEvent>(_signUp);
    on<OTPVerificationEvent>(_verifyOTP);
    on<ForgotPasswordEvent>(_forgotPassword);
  }

  void _signIn(SignInEvent event, Emitter<AuthenticationState> handler) async {}

  void _signUp(SignUpEvent event, Emitter<AuthenticationState> handler) async {}

  void _forgotPassword(
      ForgotPasswordEvent event, Emitter<AuthenticationState> handler) async {}

  void _verifyOTP(
      OTPVerificationEvent event, Emitter<AuthenticationState> handler) async {}
}
