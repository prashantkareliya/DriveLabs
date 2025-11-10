import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:drive_labs/auth/model/upload_document_request.dart';
import 'package:drive_labs/auth/model/upload_document_response.dart';
import 'package:drive_labs/procedures/data/procedures_repository.dart';
import 'package:drive_labs/procedures/model/get_cource_response.dart';
import 'package:meta/meta.dart';

part 'procedures_event.dart';

part 'procedures_state.dart';

class ProceduresBloc extends Bloc<ProceduresEvent, ProceduresState> {
  final ProcedureRepository procedureRepository;

  ProceduresBloc(this.procedureRepository) : super(ProceduresInitial()) {
    on<GetAllCoursesEvent>((event, emit) => _getCourses(event, emit));
    on<UploadDocumentEvent>((event, emit) => _uploadDocument(event, emit));
  }

  Future<void> _getCourses(GetAllCoursesEvent event, Emitter<ProceduresState> emit) async {
    emit(LoadingState(true));
    final response = await procedureRepository.getCourses();
    response.when(
      success: (success) {
        emit(LoadingState(false));
        emit(LoadedState<GetAllCourseResponse>(data: success));
      },
      failure: (failure) {
        emit(LoadingState(false));
        emit(FailureState(failure.toString()));
      },
    );
  }

  Future<void> _uploadDocument(UploadDocumentEvent event, Emitter<ProceduresState> emit) async {
    emit(LoadingState(true));
    final response = await procedureRepository.uploadDocument(event.docType, event.uploadDocumentRequest);
    response.when(
      success: (success) {
        emit(LoadingState(false));
        emit(LoadedState<UploadDocumentResponse>(data: success));
      },
      failure: (failure) {
        emit(LoadingState(false));
        emit(FailureState(failure.toString()));
      },
    );
  }
}
