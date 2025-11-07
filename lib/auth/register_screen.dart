import 'package:drive_labs/auth/bloc/auth_bloc.dart';
import 'package:drive_labs/auth/data/auth_datasource.dart';
import 'package:drive_labs/auth/data/auth_repository.dart';
import 'package:drive_labs/auth/model/registration_request.dart';
import 'package:drive_labs/components/context_extension.dart';
import 'package:drive_labs/components/custom_loading_wrapper.dart';
import 'package:drive_labs/components/sharedPreferences_service.dart';
import 'package:drive_labs/constants/helpers.dart';
import 'package:drive_labs/main.dart';
import 'package:drive_labs/procedures/program_screen.dart';
import 'package:drive_labs/auth/your_location_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/custom_button.dart';
import '../components/custom_textField.dart';
import '../constants/app_colours/app_colors.dart';
import '../constants/strings.dart';
import '../gen/assets.gen.dart';
import 'model/registration_response.dart';

class RegisterScreen extends StatefulWidget {
  DateTime? dob;
  String? state, city, streetAddress, pinCode;

  RegisterScreen(this.dob, this.state, this.city, this.streetAddress, this.pinCode, {super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final ValueNotifier<bool> _obscureTextNotifierNew = ValueNotifier<bool>(true);
  final ValueNotifier<bool> _obscureTextNotifierConfirm = ValueNotifier<bool>(true);

  AuthBloc authBloc = AuthBloc(AuthRepository(authDatasource: AuthDatasource()));
  RegistrationResponse? userdata;
  bool showSpinner = false;
  final prefs = PreferenceService().prefs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
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
            userdata = state.data;
            if (userdata != null) {
              prefs.setString(PreferenceString.prefsUserId, userdata?.user?.sId ?? "");
              prefs.setString(PreferenceString.prefsToken, userdata?.token ?? "");
              navigationService.push(ProgramScreen());
            }
          }
        },
        builder: (context, state) {
          return LoadingWrapper(
            showSpinner: showSpinner,
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.whiteColor.withValues(alpha: 0.6),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(30)),
                ),
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.0),
                    child: Column(
                      children: [
                        8.verticalSpace,
                        CustomTextFormField(
                          label: LabelString.labelFullName,
                          hintText: LabelString.labelEnterFullName,
                          controller: _nameController,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return ErrorString.fullNameErr;
                            }
                            return null;
                          },
                        ),
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
                        CustomTextFormField(
                          label: LabelString.labelPhoneNumber,
                          hintText: LabelString.labelEnterPhoneNumber,
                          controller: _phoneController,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return ErrorString.phoneErr;
                            }
                            if (!_phoneController.text.isValidPhone) {
                              return ErrorString.phoneValidErr;
                            }
                            return null;
                          },
                        ),
                        ValueListenableBuilder<bool>(
                          valueListenable: _obscureTextNotifierNew,
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
                              suffixIcon: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                child: GestureDetector(
                                  onTap: () {
                                    _obscureTextNotifierNew.value = !isObscured;
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
                        ValueListenableBuilder<bool>(
                          valueListenable: _obscureTextNotifierConfirm,
                          builder: (BuildContext context, bool isObscured, Widget? child) {
                            return CustomTextFormField(
                              label: LabelString.labelConfirmPassword,
                              hintText: LabelString.labelEnterConfirmPassword,
                              controller: _confirmPasswordController,
                              keyboardType: TextInputType.text,
                              obscureText: isObscured,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return ErrorString.confirmPasswordErr;
                                }
                                if (value != _passwordController.text) {
                                  return ErrorString.passwordErr1;
                                }
                                return null;
                              },
                              suffixIcon: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                child: GestureDetector(
                                  onTap: () {
                                    _obscureTextNotifierConfirm.value = !isObscured;
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
                        14.verticalSpace,
                        CustomButton(
                          text: LabelString.labelStartLearning,
                          backgroundColor: AppColors.yellowColor,
                          textColor: AppColors.blackColor,
                          onPressed: () {
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
                      ],
                    ),
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
    RegistrationRequest registrationRequest = RegistrationRequest(
      name: _nameController.text,
      email: _emailController.text.toLowerCase().trim(),
      phone: _phoneController.text.trim(),
      password: _confirmPasswordController.text,
      address: Address(city: widget.city, pincode: widget.pinCode, state: widget.state, street: widget.streetAddress),
      dateOfBirth: widget.dob.toString(),
    );
    print(registrationRequest);
    authBloc.add(RegistrationEvent(registrationRequest));
  }
}
