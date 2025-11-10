part of 'procedures_bloc.dart';

@immutable
sealed class ProceduresEvent {}

class GetAllCoursesEvent extends ProceduresEvent {
  GetAllCoursesEvent();
}

class UploadDocumentEvent extends ProceduresEvent {
  UploadDocumentRequest uploadDocumentRequest;
  final String docType;

  UploadDocumentEvent(this.uploadDocumentRequest, this.docType);
}
