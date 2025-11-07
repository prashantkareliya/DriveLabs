import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:drive_labs/Employee/login/data/emp_login_repository.dart';
import 'package:drive_labs/Employee/login/model/emp_login_request.dart';
import 'package:drive_labs/Employee/login/model/emp_login_response.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  EmpLoginRepository empLoginRepository;

  LoginBloc(this.empLoginRepository) : super(LoginInitial()) {
    on<LoginEmpEvent>((event, emit) => loginEmp(event, emit));
  }

  Future<void> loginEmp(LoginEmpEvent event, Emitter<LoginState> emit) async {
    emit(LoadingState(true));

    final response = await empLoginRepository.loginEmp(empLoginRequest: event.empLoginRequest);

    response.when(
      success: (success) {
        emit(LoadingState(false));
        emit(LoadedState<EmpLoginResponse>(data: success));
      },
      failure: (failure) {
        emit(LoadingState(false));
        emit(FailureState(failure.toString()));
      },
    );
  }
}
