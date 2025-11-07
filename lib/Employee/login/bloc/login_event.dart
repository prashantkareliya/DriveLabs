part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class LoginEmpEvent extends LoginEvent {
  final EmpLoginRequest empLoginRequest;

  LoginEmpEvent(this.empLoginRequest);
}
