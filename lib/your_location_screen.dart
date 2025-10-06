import 'package:drive_labs/login_registration_screen.dart';
import 'package:drive_labs/main.dart';
import 'package:drive_labs/program_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'components/custom_button.dart';
import 'components/custom_textField.dart';
import 'constants/app_colours/app_colors.dart';
import 'constants/strings.dart';
import 'gen/assets.gen.dart';

class YourLocationScreen extends StatefulWidget {
  const YourLocationScreen({super.key});

  @override
  State<YourLocationScreen> createState() => _YourLocationScreenState();
}

class _YourLocationScreenState extends State<YourLocationScreen> {
  final _locationController = TextEditingController();
  final _pinCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Assets.images.locationBg.image(fit: BoxFit.fill),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Column(
              children: [
                SizedBox(height: 280),
                Assets.images.locationText.image(height: 70),
                14.verticalSpace,
                CustomTextFormField(
                  label: LabelString.labelEnterYourPincode,
                  hintText: LabelString.labelEnterPincode,
                  controller: _pinCodeController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ErrorString.passwordErr;
                    }
                    return null;
                  },
                ),
                4.verticalSpace,
                CustomTextFormField(
                  label: LabelString.labelFullAddress,
                  hintText: LabelString.labelEnterFullAddress,
                  controller: _locationController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ErrorString.passwordErr;
                    }
                    return null;
                  },
                  suffixIcon: Assets.icons.icMap.image(),
                ),
                14.verticalSpace,
                CustomButton(
                  text: LabelString.labelSubmit,
                  backgroundColor: AppColors.yellowColor,
                  textColor: AppColors.blackColor,
                  onPressed: () {
                    navigationService.push(LoginRegistrationScreen());
                  },
                  borderColor: AppColors.blackColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
