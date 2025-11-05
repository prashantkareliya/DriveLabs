import 'package:drive_labs/components/context_extension.dart';
import 'package:drive_labs/components/custom_button.dart';
import 'package:drive_labs/constants/app_colours/app_colors.dart';
import 'package:drive_labs/constants/strings.dart';
import 'package:drive_labs/dashboard/dashboard_screen.dart';
import 'package:drive_labs/gen/assets.gen.dart';
import 'package:drive_labs/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class LicensingProceduresScreen extends StatefulWidget {
  const LicensingProceduresScreen({super.key});

  @override
  State<LicensingProceduresScreen> createState() => _LicensingProceduresScreenState();
}

class _LicensingProceduresScreenState extends State<LicensingProceduresScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: Stack(
        children: [
          Assets.images.programBg.image(width: context.width(), fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                35.verticalSpace,
                Text(
                  LabelString.labelLicensingProcedures,
                  style: GoogleFonts.montserrat(fontSize: 24, fontWeight: FontWeight.w700, color: AppColors.blackColor),
                ),
                10.verticalSpace,
                _buildUploadTile(Assets.icons.licensing3.image(), title: "UPLOAD \nRECENT PHOTO", subtitle: ""),

                _buildUploadTile(Assets.icons.licensing2.image(), title: "AADHAR CARD", subtitle: "(Front-Back)"),

                _buildUploadTile(Assets.icons.licensing1.image(), title: "PROOF OF AGE", subtitle: "(Birth Certificate)"),
                20.verticalSpace,
                CustomButton(
                  text: LabelString.labelDone,
                  backgroundColor: AppColors.green,
                  textColor: AppColors.whiteColor,
                  onPressed: () {
                    navigationService.push(DashboardScreen());
                  },
                  borderColor: AppColors.blackColor,
                ),
                35.verticalSpace,
                Text(
                  "Complete your license \nrequirements in 3 easy steps",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.blackColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUploadTile(Image image, {required String title, required String subtitle}) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(color: AppColors.transparent, borderRadius: BorderRadius.circular(16)),
          child: Row(
            children: [
              CircleAvatar(radius: 50, backgroundColor: Colors.grey.shade200, child: image),
              16.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.blackColor),
                  ),
                  if (subtitle.isNotEmpty)
                    Text(
                      subtitle,
                      style: GoogleFonts.montserrat(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF1F2125)),
                    ),
                ],
              ),
            ],
          ),
        ),
        if (subtitle != "(Birth Certificate)")
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Divider(color: Colors.black26, thickness: 1),
          ),
      ],
    );
  }
}
