import 'package:drive_labs/constants/app_colours/app_colors.dart';
import 'package:drive_labs/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        height: 60.sp,
        width: 60.sp,
        decoration: BoxDecoration(color: AppColors.errorRed, borderRadius: BorderRadius.circular(12.0)),
        child: Center(child: SteeringLoadingIndicator(isShowText: true)),
      ),
    );
  }
}

class CustomLoaderForData extends StatelessWidget {
  const CustomLoaderForData({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        height: 70.sp,
        width: 70.sp,
        decoration: BoxDecoration(color: AppColors.primaryColor, borderRadius: BorderRadius.circular(12.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SteeringLoadingIndicator(isShowText: false, size: 45.sp),
            Text(
              "Loading...",
              style: GoogleFonts.montserrat(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.blackColor),
            ),
          ],
        ),
      ),
    );
  }
}
