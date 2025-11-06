import 'package:drive_labs/auth/model/login_request.dart';
import 'package:drive_labs/auth/model/registration_request.dart';
import 'package:drive_labs/constants/constants.dart';
import 'package:drive_labs/http_actions/app_http.dart';
import 'package:flutter/material.dart';

class AuthDatasource extends HttpActions {
  Future<dynamic> loginUser({required LoginRequest loginRequest}) async {
    final response = await postMethod(ApiEndPoint.loginUser, data: loginRequest.toJson());
    debugPrint("Login response: $response");
    return response;
  }

  Future<dynamic> registerUser({required RegistrationRequest registrationRequest}) async {
    final response = await postMethod(ApiEndPoint.registerUser, data: registrationRequest.toJson());
    debugPrint("Register response: $response");
    return response;
  }
}
