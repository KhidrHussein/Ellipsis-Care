part of 'bloc.dart';

sealed class AuthenticationEvent {}

class SignUpEvent extends AuthenticationEvent {
  SignUpEvent({
    this.firstName,
    this.lastName,
    this.password,
    this.userName,
    this.hasAcceptedTerms,
    required this.email,
  });

  final String? email;
  final String? userName;
  final String? firstName;
  final String? lastName;
  final String? password;
  final bool? hasAcceptedTerms;
}

class SignInEvent extends AuthenticationEvent {
  SignInEvent({required this.email, this.password});

  final String? email;
  final String? password;
}

class ForgotPasswordEvent extends AuthenticationEvent {
  ForgotPasswordEvent({required this.email});

  final String email;
}

class OTPVerificationEvent implements AuthenticationEvent {
  const OTPVerificationEvent({required this.otpCode});
  final String otpCode;
}
