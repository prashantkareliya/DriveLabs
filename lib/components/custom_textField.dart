import 'package:drive_labs/constants/app_colours/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final String hintText;
  final String? rightText;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;

  const CustomTextFormField({
    super.key,
    required this.label,
    required this.hintText,
    this.rightText,
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.suffixIcon
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.black),
        ),
        4.verticalSpace,
        Container(
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                spreadRadius: 1,
                blurRadius: 6,
                offset: const Offset(0, 3), // subtle shadow
              ),
            ],
          ),
          child: TextFormField(
            controller: controller,
            validator: validator,
            keyboardType: keyboardType,
            obscureText: obscureText,
            style: GoogleFonts.montserrat(fontSize: 15, color: Colors.black),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: GoogleFonts.montserrat(color: Colors.grey, fontSize: 16),
              contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
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
                suffixIcon: suffixIcon
            ),
          ),
        ),
        if (rightText != null) 4.verticalSpace,
        if (rightText != null)
          Align(
            alignment: Alignment.topRight,
            child: Text(
              rightText ?? "",
              style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.normal, color: AppColors.blackColor),
            ),
          ),
        8.verticalSpace,
      ],
    );
  }
}
