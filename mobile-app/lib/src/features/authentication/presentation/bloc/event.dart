part of 'bloc.dart';

sealed class AuthenticationEvent {}

class SignUpEvent extends AuthenticationEvent {}

class SignInEvent extends AuthenticationEvent {}

class ForgotPasswordEvent extends AuthenticationEvent {}

class OTPVerificationEvent implements AuthenticationEvent {
  const OTPVerificationEvent({required this.otpCode});
  final String otpCode;
}
