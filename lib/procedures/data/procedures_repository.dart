import 'package:drive_labs/auth/model/upload_document_request.dart';
import 'package:drive_labs/auth/model/upload_document_response.dart';
import 'package:drive_labs/constants/constants.dart';
import 'package:drive_labs/constants/strings.dart';
import 'package:drive_labs/http_actions/api_result.dart';
import 'package:drive_labs/http_actions/handle_api_error.dart';
import 'package:drive_labs/procedures/data/procedures_datasource.dart';
import 'package:drive_labs/procedures/model/get_cource_response.dart';

class ProcedureRepository {
  ProcedureRepository({required ProcedureDataSource procedureDataSource}) : _procedureDataSource = procedureDataSource;

  final ProcedureDataSource _procedureDataSource;

  Future<ApiResult<GetAllCourseResponse>> getCourses() async {
    try {
      final result = await _procedureDataSource.getAllCourse();

      GetAllCourseResponse getAllCourseResponse = GetAllCourseResponse.fromJson(result);

      if (true == ResponseStatus.failed) {
        return ApiResult.success(data: getAllCourseResponse);
      } else {
        return ApiResult.failure(error: ErrorString.somethingWentWrong);
      }
    } catch (e) {
      final message = HandleAPI.handleAPIError(e);
      return ApiResult.failure(error: message);
    }
  }

  Future<ApiResult<UploadDocumentResponse>> uploadDocument(String docType, UploadDocumentRequest uploadDocumentRequest) async {
    try {
      final result = await _procedureDataSource.uploadDocument(docType, uploadDocumentRequest);
      UploadDocumentResponse uploadDocumentResponse = UploadDocumentResponse.fromJson(result);

      if (true == ResponseStatus.failed) {
        return ApiResult.success(data: uploadDocumentResponse);
      } else {
        return ApiResult.failure(error: ErrorString.somethingWentWrong);
      }
    } catch (e) {
      final message = HandleAPI.handleAPIError(e);
      return ApiResult.failure(error: message);
    }
  }
}
