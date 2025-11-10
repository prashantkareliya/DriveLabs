import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:drive_labs/Employee/dash/data/emp_repository.dart';
import 'package:drive_labs/Employee/dash/model/feedback_request.dart';
import 'package:drive_labs/Employee/dash/model/feedback_response.dart';
import 'package:meta/meta.dart';

part 'emp_event.dart';
part 'emp_state.dart';

class EmpBloc extends Bloc<EmpEvent, EmpState> {
  final EmpRepository empRepository;

  EmpBloc(this.empRepository) : super(EmpInitial()) {
    on<InstructorFeedbackEvent>((event, emit) => giveFeedback(event, emit));
  }

  Future<void> giveFeedback(InstructorFeedbackEvent event, Emitter<EmpState> emit) async {
    emit(LoadingState(true));

    final response = await empRepository.giveFeedback(instructorFeedbackRequest: event.instructorFeedbackRequest);

    response.when(
      success: (success) {
        emit(LoadingState(false));
        emit(LoadedState<InstructorFeedbackResponse>(data: success));
      },
      failure: (failure) {
        emit(LoadingState(false));
        emit(FailureState(failure.toString()));
      },
    );
  }
}
