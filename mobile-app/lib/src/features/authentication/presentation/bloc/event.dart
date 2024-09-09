part of 'bloc.dart';

typedef AuthenticationState = (
  
);

sealed class AuthenticationEvent {}

class SignUpEvent extends AuthenticationEvent {}

class SignInEvent extends AuthenticationEvent {}

class ForgotPasswordEvent extends AuthenticationEvent {}

class OTPVerificationEvent extends Equatable implements AuthenticationEvent {
  const OTPVerificationEvent({required this.otpCode});
  final String otpCode;

  @override
  List<Object?> get props => [otpCode];
}
