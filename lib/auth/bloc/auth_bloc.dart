import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:drive_labs/auth/data/auth_repository.dart';
import 'package:drive_labs/auth/model/login_request.dart';
import 'package:drive_labs/auth/model/login_response.dart';
import 'package:drive_labs/auth/model/registration_request.dart';
import 'package:drive_labs/auth/model/registration_response.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<LoginUserEvent>((event, emit) => loginUser(event, emit));
    on<RegistrationEvent>((event, emit) => registerUser(event, emit));
  }

  Future<void> loginUser(LoginUserEvent event, Emitter<AuthState> emit) async {
    emit(LoadingState(true));

    final response = await authRepository.loginUser(loginRequest: event.loginRequest);

    response.when(
      success: (success) {
        emit(LoadingState(false));
        emit(LoadedState<LoginResponse>(data: success));
      },
      failure: (failure) {
        emit(LoadingState(false));
        emit(FailureState(failure.toString()));
      },
    );
  }

  Future<void> registerUser(RegistrationEvent event, Emitter<AuthState> emit) async {
    emit(LoadingState(true));

    final response = await authRepository.registerUser(registrationRequest: event.registrationRequest);

    response.when(
      success: (success) {
        emit(LoadingState(false));
        emit(LoadedState<RegistrationResponse>(data: success));
      },
      failure: (failure) {
        emit(LoadingState(false));
        emit(FailureState(failure.toString()));
      },
    );
  }
}
