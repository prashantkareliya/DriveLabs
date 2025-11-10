part of 'emp_bloc.dart';

@immutable
sealed class EmpEvent {}

class InstructorFeedbackEvent extends EmpEvent {
  final InstructorFeedbackRequest instructorFeedbackRequest;

  InstructorFeedbackEvent(this.instructorFeedbackRequest);
}