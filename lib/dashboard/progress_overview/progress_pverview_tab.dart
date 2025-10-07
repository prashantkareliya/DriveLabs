import 'package:drive_labs/components/context_extension.dart';
import 'package:drive_labs/constants/app_colours/app_colors.dart';
import 'package:drive_labs/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  35.verticalSpace,
                  Assets.images.progressOverview.image(width: context.width(), fit: BoxFit.cover),
                  8.verticalSpace,
                  _buildProgressItem("CLUTCH CONTROL", 0.2, AppColors.errorRed),
                  _buildProgressItem("STEERING CONTROL", 0.4, AppColors.orange),
                  _buildProgressItem("GEAR SHIFTING", 0.7, AppColors.yellowColor),
                  _buildProgressItem("ROAD SENSE", 0.96, AppColors.green),
                  _buildProgressItem("INDEPENDANCE", 0.7, AppColors.yellowColor),
                  _buildProgressItem("BRAKING", 0.96, AppColors.green),
                  25.verticalSpace,
                  _buildImprovementButton(),
                  5.verticalSpace,
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildProgressItem(String title, double value, Color progressColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.montserrat(fontSize: 16, color: AppColors.black, fontWeight: FontWeight.bold),
          ),
          6.verticalSpace,
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    border: Border.all(color: AppColors.blackColor, width: 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                        borderRadius: BorderRadius.circular(10),
                        value: value, backgroundColor: Colors.white, color: progressColor, minHeight: 20),
                  ),
                ),
              ),
              15.horizontalSpace,
              Text(
                '${(value * 100).toInt()}%',
                style: GoogleFonts.montserrat(fontSize: 18, color: AppColors.black, fontWeight: FontWeight.bold),
              ),
              10.horizontalSpace,
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: AppColors.yellowColor, shape: BoxShape.circle),
                child: Assets.icons.share.image(height: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildImprovementButton() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(color: const Color(0xFFA6E5DE), borderRadius: BorderRadius.circular(25)),
      child: Text(
        'How to improve movement\nof gear and clutch',
        textAlign: TextAlign.center,
        style: GoogleFonts.montserrat(fontSize: 18.sp, height: 1.2, color: AppColors.black, fontWeight: FontWeight.bold),
      ),
    );
  }
}
