part of 'procedures_bloc.dart';

@immutable
sealed class ProceduresState {}

final class ProceduresInitial extends ProceduresState {}

///  loading state
class LoadingState extends ProceduresState {
  final bool isBusy;

  LoadingState(this.isBusy);
}

///  loaded state
class LoadedState<T> extends ProceduresState {
  final T data;

  LoadedState({required this.data});
}

///  failure state
class FailureState extends ProceduresState {
  final String error;

  FailureState(this.error);
}