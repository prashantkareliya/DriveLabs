import 'package:drive_labs/components/context_extension.dart';
import 'package:drive_labs/constants/app_colours/app_colors.dart';
import 'package:drive_labs/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgressTab extends StatefulWidget {
  const ProgressTab({super.key});

  @override
  State<ProgressTab> createState() => _ProgressTabState();
}

class _ProgressTabState extends State<ProgressTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: Stack(
        children: [
          Assets.images.programBg.image(width: context.width(), fit: BoxFit.cover),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              children: [
                35.verticalSpace,
                Assets.images.progress.image(width: context.width(), fit: BoxFit.cover),
              ],
            ),
          )
        ],
      ),
    );
  }
}
