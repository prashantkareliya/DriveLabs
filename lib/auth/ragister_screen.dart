import 'package:drive_labs/main.dart';
import 'package:drive_labs/procedures/program_screen.dart';
import 'package:drive_labs/auth/your_location_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/custom_button.dart';
import '../components/custom_textField.dart';
import '../constants/app_colours/app_colors.dart';
import '../constants/strings.dart';
import '../gen/assets.gen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

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
              label: LabelString.labelFullName,
              hintText: LabelString.labelEnterFullName,
              controller: _nameController,
              keyboardType: TextInputType.name,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return ErrorString.emailAddressErr;
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
                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
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
                  return ErrorString.passwordErr;
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
                      return ErrorString.passwordErr;
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
                navigationService.push(ProgramScreen());
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
    );
  }
}
