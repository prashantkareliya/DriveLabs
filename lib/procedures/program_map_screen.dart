import 'package:drive_labs/components/context_extension.dart';
import 'package:drive_labs/components/custom_appbar.dart';
import 'package:drive_labs/constants/app_colours/app_colors.dart';
import 'package:drive_labs/main.dart';
import 'package:drive_labs/procedures/model/get_cource_response.dart';
import 'package:drive_labs/procedures/subscripation_screen.dart';
import 'package:flutter/material.dart';
import 'package:drive_labs/gen/assets.gen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'day_vice_dialog.dart';

class ProgramMapScreen extends StatefulWidget {
  Courses? courses;

  ProgramMapScreen(this.courses, {super.key});

  @override
  State<ProgramMapScreen> createState() => _ProgramMapScreenState();
}

class _ProgramMapScreenState extends State<ProgramMapScreen> {
  double progressValue = 0.8;

  @override
  Widget build(BuildContext context) {
    final double carAlignment = (progressValue * 2) - 1;

    return Scaffold(
      appBar: CustomAppBar(backgroundColor: Color(0xFFeaf4ef), widget: Assets.images.statusBar.image()),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(color: Color(0xFFeaf4ef)),
          child: Padding(
            padding: EdgeInsets.only(right: 20.sp, left: 20.sp, bottom: 70.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                10.verticalSpace,
                Text(
                  '21 Days',
                  style: GoogleFonts.montserrat(fontSize: 28.sp, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Flagship Program',
                  style: GoogleFonts.montserrat(fontSize: 28.sp, fontWeight: FontWeight.bold),
                ),
                20.verticalSpace,
                20.verticalSpace,
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(color: AppColors.whiteColor, borderRadius: BorderRadius.circular(20)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearProgressIndicator(
                          borderRadius: BorderRadius.circular(10),
                          value: progressValue,
                          backgroundColor: AppColors.whiteColor,
                          color: AppColors.green,
                          minHeight: 20,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      top: -22,
                      child: Align(alignment: Alignment(carAlignment, 0), child: Assets.images.carYellow.svg()),
                    ),
                  ],
                ),
                40.verticalSpace,

                AspectRatio(
                  aspectRatio: 1 / 2.8,
                  child: Stack(
                    children: [
                      Positioned.fill(child: Assets.images.roadSvg.svg(fit: BoxFit.contain)),
                      Assets.images.tree.image(),
                      const _MilestoneWidget(
                        alignment: Alignment(-0.95, -1.12),
                        iconPath: 'assets/images/test.png',
                        title: 'Bonding\nwith the beast.',
                        starNumber: '1',
                        isLocked: true,
                      ),
                      const _MilestoneWidget(
                        alignment: Alignment(0.58, -1.12),
                        // Top-right
                        iconPath: 'assets/images/test.png',
                        title: 'Crawl & Cuddle',
                        starNumber: '2',
                        isLocked: false,
                      ),
                      const _MilestoneWidget(
                        alignment: Alignment(-0.18, -0.73),
                        // Center
                        iconPath: 'assets/images/test.png',
                        title: 'Mirror Mirror on\nthe sides?',
                        starNumber: '3',
                        isLocked: false,
                      ),
                      const _MilestoneWidget(
                        alignment: Alignment(-0.8, 0.45),
                        // Bottom-left
                        iconPath: 'assets/images/test.png',
                        title: 'Brakes & Breathe',
                        starNumber: '4',
                        isLocked: false,
                      ),
                      const _MilestoneWidget(
                        alignment: Alignment(0.8, 0.65),
                        // Bottom-right
                        iconPath: 'assets/images/test.png',
                        title: 'Gears & Groove',
                        starNumber: '5',
                        isLocked: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigationService.push(SubscriptionScreen(widget.courses));
        },
        backgroundColor: AppColors.black,
        child: Icon(Icons.arrow_forward, color: AppColors.yellowColor, size: 30),
      ),
    );
  }
}

class _MilestoneWidget extends StatelessWidget {
  final Alignment alignment;
  final String iconPath;
  final String title;
  final String starNumber;
  final bool isLocked;

  const _MilestoneWidget({
    required this.alignment,
    required this.iconPath,
    required this.title,
    required this.starNumber,
    this.isLocked = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          barrierDismissible: true,
          barrierColor: AppColors.grayFont.withValues(alpha: 0.95),
          builder: (BuildContext context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              insetPadding: const EdgeInsets.all(20),
              child: const DayDialog(),
            );
          },
        );
      },
      child: Align(
        alignment: alignment,
        child: Column(
          mainAxisSize: MainAxisSize.min, // Important to keep the column compact
          children: [
            Image.asset(isLocked ? 'assets/images/lock.png' : iconPath, width: 110.sp, fit: BoxFit.contain),
            Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 13.sp),
            ),
          ],
        ),
      ),
    );
  }
}
