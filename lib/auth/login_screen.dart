import 'package:drive_labs/Employee/login/emp_login.dart';
import 'package:drive_labs/auth/bloc/auth_bloc.dart';
import 'package:drive_labs/auth/data/auth_datasource.dart';
import 'package:drive_labs/auth/data/auth_repository.dart';
import 'package:drive_labs/auth/model/login_request.dart';
import 'package:drive_labs/auth/model/login_response.dart';
import 'package:drive_labs/components/context_extension.dart';
import 'package:drive_labs/components/custom_loading_wrapper.dart';
import 'package:drive_labs/components/sharedPreferences_service.dart';
import 'package:drive_labs/constants/app_colours/app_colors.dart';
import 'package:drive_labs/constants/helpers.dart';
import 'package:drive_labs/constants/strings.dart';
import 'package:drive_labs/dashboard/dashboard_screen.dart';
import 'package:drive_labs/procedures/program_screen.dart';
import 'package:drive_labs/auth/your_location_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/custom_button.dart';
import '../components/custom_textField.dart';
import '../gen/assets.gen.dart';
import '../main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final ValueNotifier<bool> _obscureTextNotifier = ValueNotifier<bool>(true);

  AuthBloc authBloc = AuthBloc(AuthRepository(authDatasource: AuthDatasource()));
  bool showSpinner = false;
  final prefs = PreferenceService().prefs;

  LoginResponse? user;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _obscureTextNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        bloc: authBloc,
        listener: (context, state) {
          if (state is FailureState) {
            showSpinner = false;
            Helpers.showSnackBar(context, state.error);
          }
          if (state is LoadingState) {
            showSpinner = true;
          }
          if (state is LoadedState) {
            showSpinner = false;
            user = state.data;
            if (user != null) {
              prefs.setString(PreferenceString.prefsUserId, user?.user?.sId ?? "");
              prefs.setString(PreferenceString.prefsToken, user?.token ?? "");
              navigationService.push(ProgramScreen());
            }
          }
        },
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              color: AppColors.whiteColor.withValues(alpha: 0.6),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(30)),
            ),
            child: LoadingWrapper(
              showSpinner: showSpinner,
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.0),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      8.verticalSpace,
                      CustomTextFormField(
                        label: LabelString.labelEmail,
                        hintText: LabelString.labelEnterEmail,
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return ErrorString.emailAddressErr;
                          }
                          if (!_emailController.text.isValidEmail) {
                            return ErrorString.emailAddressValidErr;
                          }
                          return null;
                        },
                      ),

                      ValueListenableBuilder<bool>(
                        valueListenable: _obscureTextNotifier,
                        builder: (BuildContext context, bool isObscured, Widget? child) {
                          return CustomTextFormField(
                            label: LabelString.labelPassword,
                            hintText: LabelString.labelEnterPassword,
                            controller: _passwordController,
                            keyboardType: TextInputType.text,
                            obscureText: isObscured,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return ErrorString.passwordErr;
                              }
                              return null;
                            },
                            rightText: LabelString.labelForgotPassword,
                            suffixIcon: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0),
                              child: GestureDetector(
                                onTap: () {
                                  _obscureTextNotifier.value = !isObscured;
                                },
                                child: Icon(
                                  Icons.remove_red_eye_rounded,
                                  color: isObscured ? Color(0xFF2A8D5C) : Color(0xFF2A8D5C).withValues(alpha: 0.5),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      6.verticalSpace,
                      CustomButton(
                        text: LabelString.labelStartLearning,
                        backgroundColor: AppColors.yellowColor,
                        textColor: AppColors.blackColor,
                        onPressed: () {
                          if (kDebugMode) {
                            _emailController.text = "rohit.sharma@example.com";
                            _passwordController.text = "Test@12345";
                          }
                          if (_formKey.currentState!.validate()) {
                            callAPI();
                          }
                        },
                        borderColor: AppColors.blackColor,
                      ),
                      14.verticalSpace,
                      CustomButton(
                        text: LabelString.labelSignInWith,
                        leadingIcon: Assets.images.googleImg.image(height: 22),
                        backgroundColor: AppColors.whiteColor,
                        textColor: AppColors.blackColor,
                        onPressed: () {},
                        borderColor: AppColors.blackColor,
                      ),
                      25.verticalSpace,
                      CustomButton(
                        text: LabelString.labelEmployeeLogin,
                        backgroundColor: Color(0xFFB8DBFF),
                        textColor: AppColors.blackColor,
                        onPressed: () {
                          navigationService.push(EmpLogin());
                        },
                        borderColor: AppColors.blackColor,
                      ),
                      14.verticalSpace,
                      CustomButton(
                        text: LabelString.labelFamilyLogin,
                        backgroundColor: Color(0xFFF8A8C5),
                        textColor: AppColors.blackColor,
                        onPressed: () {},
                        borderColor: AppColors.blackColor,
                      ),
                      25.verticalSpace,
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void callAPI() {
    LoginRequest loginRequest = LoginRequest(
      email: _emailController.text.toLowerCase().trim(),
      phone: _emailController.text,
      password: _passwordController.text,
    );
    authBloc.add(LoginUserEvent(loginRequest));
  }
}
