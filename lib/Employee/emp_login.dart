import 'package:drive_labs/components/custom_button.dart';
import 'package:drive_labs/constants/app_colours/app_colors.dart';
import 'package:drive_labs/constants/strings.dart';
import 'package:drive_labs/gen/assets.gen.dart';
import 'package:drive_labs/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/custom_textField.dart';
import 'dash/emp_dashboard.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Assets.images.empBg.image(fit: BoxFit.fill),
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(ImageString.imgEmpLogin))
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 18),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  8.verticalSpace,
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
                  6.verticalSpace,

                  25.verticalSpace,
                  CustomButton(
                    text: LabelString.labelProceed,
                    backgroundColor: Color(0xFFD3FFFF),
                    textColor: AppColors.blackColor,
                    onPressed: () {
                      navigationService.pushReplacement(EmpDashboard());
                    },
                    borderColor: AppColors.blackColor,
                  ),

                  25.verticalSpace,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
