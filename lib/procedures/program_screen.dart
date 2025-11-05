import 'package:drive_labs/components/context_extension.dart';
import 'package:drive_labs/main.dart';
import 'package:drive_labs/procedures/program_map_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/custom_button.dart';
import '../constants/app_colours/app_colors.dart';
import '../constants/strings.dart';
import '../gen/assets.gen.dart';

class ProgramScreen extends StatefulWidget {
  const ProgramScreen({super.key});

  @override
  State<ProgramScreen> createState() => _ProgramScreenState();
}

class _ProgramScreenState extends State<ProgramScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Assets.images.programBg.image(fit: BoxFit.cover, height: context.height(), width: context.width()),
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 18),
            children: [
              45.verticalSpace,
              Assets.images.coursesText.image(height: 120),
              10.verticalSpace,
              Assets.images.ourCourses.image(height: 35),
              35.verticalSpace,
              GestureDetector(
                onTap: () {
                  navigationService.push(ProgramMapScreen());
                },
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: context.width(),
                      decoration: BoxDecoration(
                        color: Color(0xFFD3FFFF),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Color(0xFF1F2125), width: 1.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              20.verticalSpace,
                              Text(
                                "21 Days Flagship \nProgram".toUpperCase(),
                                style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              10.verticalSpace,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("₹ 10,000", style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.bold)),
                                  Assets.icons.arrowRight.image(height: 35),
                                ],
                              ),
                              10.verticalSpace,
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: -17,
                      left: 22,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        decoration: BoxDecoration(
                          color: Color(0xFFFEDD00),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Color(0xFF1F2125), width: 1.0),
                        ),
                        child: Text("For Beginners", style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ],
                ),
              ),
              15.verticalSpace,
              Container(
                width: context.width(),
                decoration: BoxDecoration(
                  color: Color(0xFFE896DF),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Color(0xFF1F2125), width: 1.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        12.verticalSpace,
                        Text("14 Days Thrills".toUpperCase(), style: GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.bold)),
                        5.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("₹ 7500", style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.bold)),
                            Assets.icons.arrowRight.image(height: 35),
                          ],
                        ),
                        10.verticalSpace,
                      ],
                    ),
                  ),
                ),
              ),
              15.verticalSpace,
              Container(
                width: context.width(),
                decoration: BoxDecoration(
                  color: Color(0xFFFEDD00),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Color(0xFF1F2125), width: 1.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        12.verticalSpace,
                        Text("12 Days Retraining".toUpperCase(), style: GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.bold)),
                        5.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("₹ 6000", style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.bold)),
                            Assets.icons.arrowRight.image(height: 35),
                          ],
                        ),
                        10.verticalSpace,
                      ],
                    ),
                  ),
                ),
              ),
              15.verticalSpace,
              Container(
                width: context.width(),
                decoration: BoxDecoration(
                  color: Color(0xFFFEFDF9),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Color(0xFF1F2125), width: 1.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        12.verticalSpace,
                        Text("Invite Friends!".toUpperCase(), style: GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.bold)),
                        5.verticalSpace,
                        Text(
                          "Lorem ipsum dolor sit amet. Nulla eget \negestas aliquam nunc",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(fontSize: 10, fontWeight: FontWeight.w600),
                        ),
                        14.verticalSpace,
                        CustomButton(
                          text: LabelString.labelReferFriend.toUpperCase(),
                          backgroundColor: AppColors.yellowColor,
                          textColor: AppColors.blackColor,
                          onPressed: () {},
                          borderColor: AppColors.blackColor,
                        ),
                        10.verticalSpace,
                      ],
                    ),
                  ),
                ),
              ),
              15.verticalSpace,
              Assets.images.courseGiftCard.image(),
              15.verticalSpace,
            ],
          ),
        ],
      ),
    );
  }
}
