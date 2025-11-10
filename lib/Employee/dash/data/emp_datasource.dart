import 'package:drive_labs/Employee/dash/model/feedback_request.dart';
import 'package:drive_labs/constants/constants.dart';
import 'package:drive_labs/http_actions/app_http.dart';
import 'package:flutter/material.dart';

class EmpDatasource extends HttpActions {

  Future<dynamic> giveFeedback({required InstructorFeedbackRequest instructorFeedbackRequest}) async {
    final response = await postMethod(ApiEndPoint.instructorFeedback, data: instructorFeedbackRequest.toJson());
    debugPrint("Instructor feedback: $response");
    return response;
  }
}