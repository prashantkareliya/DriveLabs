import 'package:drive_labs/Employee/login/model/emp_login_request.dart';
import 'package:drive_labs/constants/constants.dart';
import 'package:drive_labs/http_actions/app_http.dart';
import 'package:flutter/cupertino.dart';

class EmpLoginDatasource extends HttpActions {
  Future<dynamic> loginEmp({required EmpLoginRequest empLoginRequest}) async {
    final response = await postMethod(ApiEndPoint.loginEmp, data: empLoginRequest.toJson());
    debugPrint("EMP Login response: $response");
    return response;
  }
}
