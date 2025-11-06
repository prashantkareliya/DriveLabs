import 'package:drive_labs/auth/model/login_request.dart';
import 'package:drive_labs/auth/model/login_response.dart';
import 'package:drive_labs/auth/model/registration_request.dart';
import 'package:drive_labs/auth/model/registration_response.dart';
import 'package:drive_labs/constants/constants.dart';
import 'package:drive_labs/http_actions/api_result.dart';

import 'auth_datasource.dart';

class AuthRepository {
  AuthRepository({required AuthDatasource authDatasource}) : _authDatasource = authDatasource;
  final AuthDatasource _authDatasource;

  Future<ApiResult<LoginResponse>> loginUser({required LoginRequest loginRequest}) async {
    try {
      final result = await _authDatasource.loginUser(loginRequest: loginRequest);

      LoginResponse loginResponse = LoginResponse.fromJson(result);

      if (loginResponse.error == ResponseStatus.success) {
        return ApiResult.success(data: loginResponse);
      } else {
        return ApiResult.failure(error: loginResponse.message ?? 'Login failed');
      }
    } catch (e) {
      return ApiResult.failure(error: 'Login failed: $e');
    }
  }

  Future<ApiResult<RegistrationResponse>> registerUser({required RegistrationRequest registrationRequest}) async {
    try {
      final result = await _authDatasource.registerUser(registrationRequest: registrationRequest);

      RegistrationResponse registrationResponse = RegistrationResponse.fromJson(result);

      if (registrationResponse.error == ResponseStatus.success) {
        return ApiResult.success(data: registrationResponse);
      } else {
        return ApiResult.failure(error: registrationResponse.message ?? 'Registration failed');
      }
    } catch (e) {
      return ApiResult.failure(error: 'Registration failed: $e');
    }
  }
}
