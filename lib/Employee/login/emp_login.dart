import 'package:drive_labs/Employee/login/bloc/login_bloc.dart';
import 'package:drive_labs/Employee/login/data/emp_login_datasource.dart';
import 'package:drive_labs/Employee/login/data/emp_login_repository.dart';
import 'package:drive_labs/Employee/login/model/emp_login_request.dart';
import 'package:drive_labs/components/context_extension.dart';
import 'package:drive_labs/components/custom_button.dart';
import 'package:drive_labs/components/custom_loader.dart';
import 'package:drive_labs/components/custom_loading_wrapper.dart';
import 'package:drive_labs/components/sharedPreferences_service.dart';
import 'package:drive_labs/constants/app_colours/app_colors.dart';
import 'package:drive_labs/constants/helpers.dart';
import 'package:drive_labs/constants/strings.dart';
import 'package:drive_labs/gen/assets.gen.dart';
import 'package:drive_labs/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/custom_textField.dart';
import '../dash/emp_dashboard.dart';
import 'model/emp_login_response.dart';

class EmpLogin extends StatefulWidget {
  const EmpLogin({super.key});

  @override
  State<EmpLogin> createState() => _EmpLoginState();
}

class _EmpLoginState extends State<EmpLogin> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final ValueNotifier<bool> _obscureTextNotifier = ValueNotifier<bool>(true);

  LoginBloc loginBloc = LoginBloc(EmpLoginRepository(empLoginDatasource: EmpLoginDatasource()));
  bool showSpinner = false;
  final prefs = PreferenceService().prefs;
  EmpLoginResponse? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginBloc, LoginState>(
        bloc: loginBloc,
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
               navigationService.pushReplacement(EmpDashboard());
            }
          }
        },
        builder: (context, state) {
          return LoadingWrapper(
            showSpinner: showSpinner,
            child: Container(
              height: context.height(),
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/emp_bg.png"), fit: BoxFit.fill),
              ),
              child: Column(
                children: [
                  Spacer(),
                  Center(
                    child: Form(
                      key: _formKey,
                      child: Container(
                        height: context.height() * 0.42,
                        width: context.width(),
                        decoration: BoxDecoration(image: DecorationImage(image: AssetImage(ImageString.imgEmpLogin))),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                18.verticalSpace,
                                CustomTextFormField(
                                  label: LabelString.labelEmployeeID,
                                  hintText: LabelString.labelUname,
                                  controller: _emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return ErrorString.employeeIdErr;
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
                                25.verticalSpace,
                                CustomButton(
                                  text: LabelString.labelProceed,
                                  backgroundColor: Color(0xFFD3FFFF),
                                  textColor: AppColors.blackColor,
                                  onPressed: () {
                                    if (kDebugMode) {
                                      _emailController.text = "arjun.verma@drivelabs.com";
                                      _passwordController.text = "Instructor@123";
                                    }
                                    if (_formKey.currentState!.validate()) {
                                      callApi();
                                    }
                                  },
                                  borderColor: AppColors.blackColor,
                                ),

                                25.verticalSpace,
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void callApi() {
    EmpLoginRequest empLoginRequest = EmpLoginRequest(
      employeeId: "GT3065",
      password: _passwordController.text,
      phone: "9304012137",
      email: _emailController.text,
    );
    loginBloc.add(LoginEmpEvent(empLoginRequest));
  }
}
