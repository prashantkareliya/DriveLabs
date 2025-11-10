import 'package:drive_labs/Employee/dash/data/emp_datasource.dart';
import 'package:drive_labs/Employee/dash/model/feedback_request.dart';
import 'package:drive_labs/Employee/dash/model/feedback_response.dart';
import 'package:drive_labs/constants/constants.dart';
import 'package:drive_labs/http_actions/api_result.dart';

class EmpRepository {
  EmpRepository({required EmpDatasource empDatasource}) : _empDatasource = empDatasource;
  final EmpDatasource _empDatasource;

  Future<ApiResult<InstructorFeedbackResponse>> giveFeedback({required InstructorFeedbackRequest instructorFeedbackRequest}) async {
    try {
      final result = await _empDatasource.giveFeedback(instructorFeedbackRequest: instructorFeedbackRequest);

      InstructorFeedbackResponse instructorFeedbackResponse = InstructorFeedbackResponse.fromJson(result);

      if (instructorFeedbackResponse.success == ResponseStatus.failed) {
        return ApiResult.success(data: instructorFeedbackResponse);
      } else {
        return ApiResult.failure(error: instructorFeedbackResponse.message ?? 'instructor feedback failed');
      }
    } catch (e) {
      return ApiResult.failure(error: 'instructor feedback failed: $e');
    }
  }
}