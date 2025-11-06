part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class LoginUserEvent extends AuthEvent {
  final LoginRequest loginRequest;

  LoginUserEvent(this.loginRequest);
}

class RegistrationEvent extends AuthEvent {
  final RegistrationRequest registrationRequest;

  RegistrationEvent(this.registrationRequest);
}
