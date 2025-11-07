part of 'procedures_bloc.dart';

@immutable
sealed class ProceduresEvent {}

class GetAllCoursesEvent extends ProceduresEvent {
  GetAllCoursesEvent();
}
