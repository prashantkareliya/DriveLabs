import 'package:drive_labs/components/context_extension.dart';
import 'package:drive_labs/constants/app_colours/app_colors.dart';
import 'package:drive_labs/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RouteTab extends StatefulWidget {
  const RouteTab({super.key});

  @override
  State<RouteTab> createState() => _RouteTabState();
}

class _RouteTabState extends State<RouteTab> {
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
                GestureDetector(
                  onTap: () {},
                  child: Assets.images.routeDetail.image(width: context.width(), fit: BoxFit.cover),
                ),
                15.verticalSpace,
                Assets.images.tempMap.image(width: context.width(), height: context.height() / 1.6),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
