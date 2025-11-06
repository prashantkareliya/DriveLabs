import 'package:country_state_city_pro/country_state_city_pro.dart';
import 'package:drive_labs/auth/login_registration_screen.dart';
import 'package:drive_labs/constants/helpers.dart';
import 'package:drive_labs/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/custom_button.dart';
import '../components/custom_textField.dart';
import '../constants/app_colours/app_colors.dart';
import '../constants/strings.dart';
import '../gen/assets.gen.dart';

class YourLocationScreen extends StatefulWidget {
  DateTime? selectedDay;

  YourLocationScreen(this.selectedDay, {super.key});

  @override
  State<YourLocationScreen> createState() => _YourLocationScreenState();
}

class _YourLocationScreenState extends State<YourLocationScreen> {
  final _formKey = GlobalKey<FormState>();

  final _locationController = TextEditingController();
  final _pinCodeController = TextEditingController();

  TextEditingController country = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController city = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Assets.images.locationBg.image(fit: BoxFit.fill),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: ListView(
                children: [
                  SizedBox(height: 280),
                  Assets.images.locationText.image(height: 70),
                  14.verticalSpace,
                  CustomTextFormField(
                    label: LabelString.labelFullAddress,
                    hintText: LabelString.labelEnterFullAddress,
                    controller: _locationController,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return ErrorString.addressErr;
                      }
                      return null;
                    },
                    suffixIcon: Assets.icons.icMap.image(),
                  ),
                  CustomTextFormField(
                    label: LabelString.labelEnterYourPincode,
                    hintText: LabelString.labelEnterPincode,
                    controller: _pinCodeController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return ErrorString.pinCodeErr;
                      }
                      return null;
                    },
                  ),
                  CountryStateCityPicker(
                    country: country,
                    state: state,
                    city: city,
                    dialogColor: Colors.grey.shade200,
                    textFieldDecoration: InputDecoration(
                      fillColor: AppColors.whiteColor,
                      filled: true,
                      suffixIcon: const Icon(Icons.keyboard_arrow_down_outlined),
                      border: const OutlineInputBorder(borderSide: BorderSide(color: AppColors.black, width: 1.5)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.blackColor, width: 1.5),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.blackColor, width: 1.5),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.errorRed, width: 1.2),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                  ),

                  14.verticalSpace,
                  CustomButton(
                    text: LabelString.labelSubmit,
                    backgroundColor: AppColors.yellowColor,
                    textColor: AppColors.blackColor,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (country.text.isEmpty) {
                          Helpers.showSnackBar(context, "Please select country", isError: true);
                        } else if (state.text.isEmpty) {
                          Helpers.showSnackBar(context, "Please select state", isError: true);
                        } else if (city.text.isEmpty) {
                          Helpers.showSnackBar(context, "Please select city", isError: true);
                        } else {
                          navigationService.push(
                            LoginRegistrationScreen(
                              widget.selectedDay,
                              state.text,
                              city.text,
                              _locationController.text,
                              _pinCodeController.text,
                            ),
                          );
                        }
                      }
                    },
                    borderColor: AppColors.blackColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
