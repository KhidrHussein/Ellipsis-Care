part of 'auth_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckIfEmailExistsEvent extends AuthenticationEvent {
  CheckIfEmailExistsEvent({required this.email});
  final String email;

  @override
  List<Object?> get props => [email];
}

class SignUpEvent extends AuthenticationEvent {
  SignUpEvent({
    this.userName,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.hasAcceptedTerms,
    required this.email,
  });

  final String email;
  final String? userName;
  final String firstName;
  final String lastName;
  final String password;
  final bool hasAcceptedTerms;

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
  final String email;
  final String password;

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

class CreatePasswordEvent extends AuthenticationEvent {
  CreatePasswordEvent({
    required this.password,
    required this.confirmPassword,
  });

  final String password;
  final String confirmPassword;

  @override
  List<Object?> get props => [password, confirmPassword];
}

class GoogleOAuthEvent extends AuthenticationEvent {
  GoogleOAuthEvent();
}
