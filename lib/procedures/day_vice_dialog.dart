import 'package:drive_labs/components/custom_button.dart';
import 'package:drive_labs/constants/app_colours/app_colors.dart';
import 'package:drive_labs/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DayDialog extends StatelessWidget {
  const DayDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'DAY 1',
            style: GoogleFonts.montserrat(fontSize: 24.sp, fontWeight: FontWeight.w700, color: AppColors.black),
          ),
          const SizedBox(height: 8),
          Text(
            'Bonding with the beast',
            style: GoogleFonts.montserrat(fontSize: 18.sp, fontWeight: FontWeight.w700, color: Color(0xFFFF3131)),
          ),
          const SizedBox(height: 12),
          Text(
            'Yourr first touch with the car. Learn how to start, adjust mirrors, and get settled, Its like Hiccup bonding with Toothless',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.grayFont, height: 1.4),
          ),
          const SizedBox(height: 24),
          CustomButton(
            text: "BACK TO HOME",
            backgroundColor: AppColors.yellowColor,
            textColor: AppColors.black,
            onPressed: () {
              navigationService.pop();
            },
            borderColor: AppColors.black,
          ),
        ],
      ),
    );
  }
}
