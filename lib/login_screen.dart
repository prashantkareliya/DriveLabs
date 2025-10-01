import 'package:drive_labs/constants/app_colours/app_colors.dart';
import 'package:drive_labs/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'components/custom_button.dart';
import 'components/custom_textField.dart';
import 'gen/assets.gen.dart';

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

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor.withValues(alpha: 0.6),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(30))
      ),
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
                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
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
              onPressed: () {},
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
              onPressed: () {},
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
    );
  }
}
