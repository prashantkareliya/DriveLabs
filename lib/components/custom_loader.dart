import 'package:drive_labs/constants/app_colours/app_colors.dart';
import 'package:drive_labs/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        child: Center(child: SteeringLoadingIndicator()),
      ),
    );
  }
}
