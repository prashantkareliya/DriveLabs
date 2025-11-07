import 'package:drive_labs/Employee/login/data/emp_login_datasource.dart';
import 'package:drive_labs/Employee/login/model/emp_login_request.dart';
import 'package:drive_labs/Employee/login/model/emp_login_response.dart';
import 'package:drive_labs/constants/constants.dart';
import 'package:drive_labs/http_actions/api_result.dart';

class EmpLoginRepository {
  EmpLoginRepository({required EmpLoginDatasource empLoginDatasource}) : _empLoginDatasource = empLoginDatasource;
  final EmpLoginDatasource _empLoginDatasource;

  Future<ApiResult<EmpLoginResponse>> loginEmp({required EmpLoginRequest empLoginRequest}) async {
    try {
      final result = await _empLoginDatasource.loginEmp(empLoginRequest: empLoginRequest);

      EmpLoginResponse empLoginResponse = EmpLoginResponse.fromJson(result);

      if (empLoginResponse.error == ResponseStatus.success) {
        return ApiResult.success(data: empLoginResponse);
      } else {
        return ApiResult.failure(error: empLoginResponse.message ?? 'Login failed');
      }
    } catch (e) {
      return ApiResult.failure(error: 'Login failed: $e');
    }
  }
}
