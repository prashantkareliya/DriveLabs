import 'package:drive_labs/components/context_extension.dart';
import 'package:drive_labs/constants/app_colours/app_colors.dart';
import 'package:drive_labs/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
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
                Assets.images.home.image(width: context.width(), fit: BoxFit.cover),
                profileTile(),
                15.verticalSpace,
                Divider(color: AppColors.blackColor),
                15.verticalSpace,
                drivingProgramTile(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  profileTile() {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 15, top: 16, bottom: 0),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.yellowColor, width: 2),
                ),
                child: Assets.images.demo.image(width: 60, height: 60, fit: BoxFit.cover),
              ),
              15.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "WELCOME,",
                      style: GoogleFonts.montserrat(fontSize: 12, color: AppColors.grayFont, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "BRANDI COLLIER",
                      style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.grayFont),
                    ),
                  ],
                ),
              ),

              // Yellow arrow button
              Container(
                decoration: BoxDecoration(color: AppColors.yellowColor, shape: BoxShape.circle),
                padding: const EdgeInsets.all(12),
                child: Assets.icons.arrowNext.svg(),
              ),
            ],
          ),
          10.verticalSpace,
          Divider(color: AppColors.grayFont.withValues(alpha: 0.2)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "CAR TYPE",
                    style: GoogleFonts.montserrat(fontSize: 12, color: AppColors.grayFont, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "COMPACT",
                    style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.grayFont),
                  ),
                ],
              ),
              Assets.images.car3.image(),
            ],
          ),
        ],
      ),
    );
  }

  Widget drivingProgramTile() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFBEBEBE),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.blackColor, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 40.sp,
                width: 40.sp,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.skyBlueLight,
                  border: Border.all(color: AppColors.blackColor, width: 2),
                ),
                child: Center(
                  child: Text(
                    "01",
                    style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),
                  ),
                ),
              ),
              10.horizontalSpace,
              Text(
                "Driving",
                style: GoogleFonts.montserrat(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.blackColor),
              ),
              5.horizontalSpace,
              Assets.icons.stearing.svg(),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: AppColors.yellowColor, shape: BoxShape.circle),
                child: Icon(Icons.info_outline, color: Colors.black),
              ),
              8.horizontalSpace,
              PopupMenuButton<String>(
                onSelected: (value) {
                  if (value == 'confirm') {
                    print("Confirm Class selected");
                  } else if (value == 'slot_later') {
                    // TODO: Add logic for 'Slot Later'
                    print("Slot Later selected");
                  }
                },
                menuPadding: EdgeInsets.symmetric(vertical: 15.sp),
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 20.sp),
                    value: 'confirm',
                    child: Row(
                      children: [
                        Text(
                          'Confirm Class',
                          style: GoogleFonts.montserrat(
                            fontSize: 16.sp,
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Assets.images.confirmClass.image(height: 35),
                      ],
                    ),
                  ),
                  PopupMenuItem<String>(
                    padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 20.sp),
                    value: 'slot_later',
                    child: Row(
                      children: [
                        Text(
                          'Slot Later',
                          style: GoogleFonts.montserrat(
                            fontSize: 16.sp,
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Assets.images.cancelSlot.image(height: 35),
                      ],
                    ),
                  ),
                ],
                color: Color(0xFFE6C2BF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: BorderSide(width: 2, color: AppColors.blackColor),
                ),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                  child: Assets.icons.arrowDown.svg(),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 58.0), // Aligns with 'Driving' text
            child: Text(
              "Bonding with the beast.",
              style: GoogleFonts.montserrat(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),
            ),
          ),
          12.verticalSpace,
          Padding(
            padding: EdgeInsets.only(left: 58.0), // Aligns with 'Driving' text
            child: Row(
              children: [
                Text(
                  "15th August",
                  style: GoogleFonts.montserrat(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w600),
                ),
                Text(" | ", style: GoogleFonts.montserrat(fontSize: 14, color: Colors.black54)),
                Text(
                  "Tuesday",
                  style: GoogleFonts.montserrat(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          5.verticalSpace,
          Padding(
            padding: EdgeInsets.only(left: 58.0),
            child: Text(
              "6:30 AM - 7:20 AM",
              style: GoogleFonts.montserrat(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
