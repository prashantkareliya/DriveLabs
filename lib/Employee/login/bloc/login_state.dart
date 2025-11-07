part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

//  loading state
class LoadingState extends LoginState {
  final bool isBusy;

  LoadingState(this.isBusy);
}

///  loaded state
class LoadedState<T> extends LoginState {
  final T data;

  LoadedState({required this.data});
}

///  failure state
class FailureState extends LoginState {
  final String error;

  FailureState(this.error);
}