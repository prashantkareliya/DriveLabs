import 'package:drive_labs/components/context_extension.dart';
import 'package:drive_labs/constants/app_colours/app_colors.dart';
import 'package:drive_labs/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,

      body: Stack(
        children: [
          Assets.images.programBg.image(width: context.width(), fit: BoxFit.cover),
          Column(
            children: [
              35.verticalSpace,
              GestureDetector(
                onTap: () {},
                child: Assets.images.teachingSchedule.image(width: context.width(), fit: BoxFit.cover),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
