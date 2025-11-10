part of 'emp_bloc.dart';

@immutable
sealed class EmpState {}

final class EmpInitial extends EmpState {}

///  loading state
class LoadingState extends EmpState {
  final bool isBusy;

  LoadingState(this.isBusy);
}

///  loaded state
class LoadedState<T> extends EmpState {
  final T data;

  LoadedState({required this.data});
}

///  failure state
class FailureState extends EmpState {
  final String error;

  FailureState(this.error);
}