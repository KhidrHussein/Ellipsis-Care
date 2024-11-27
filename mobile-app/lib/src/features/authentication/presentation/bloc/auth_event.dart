part of 'auth_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

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

  @override
  List<Object?> get props =>
      [email, userName, firstName, lastName, password, hasAcceptedTerms];
}

class OAuthSignUpEvent extends AuthenticationEvent {
  OAuthSignUpEvent({
    this.lastName,
    this.firstName,
    required this.email,
  });

  final String? email;
  final String? firstName;
  final String? lastName;

  @override
  List<Object?> get props => [email, firstName, lastName];
}

class OAuthSignInEvent extends AuthenticationEvent {
  OAuthSignInEvent({required this.email});

  final String? email;

  @override
  List<Object?> get props => [email];
}

class SignInEvent extends AuthenticationEvent {
  SignInEvent({required this.email, required this.password});

  final String? email;
  final String? password;

  @override
  List<Object?> get props => [email, password];
}

class OTPVerificationEvent extends AuthenticationEvent {
  OTPVerificationEvent({
    required this.email,
    required this.verificationCode,
  });

  final String email;
  final String verificationCode;

  @override
  List<Object?> get props => [email, verificationCode];
}

class ForgotPasswordEvent extends AuthenticationEvent {
  ForgotPasswordEvent({required this.email});
  final String email;

  @override
  List<Object?> get props => [email];
}

class GoogleOAuthEvent extends AuthenticationEvent {
  GoogleOAuthEvent({required this.isNewUser});
  final bool isNewUser;

  @override
  List<Object?> get props => [isNewUser];
}

class FacebookOAuthEvent extends AuthenticationEvent {}

class AppleOAuthEvent extends AuthenticationEvent {}
