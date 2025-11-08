import 'package:drive_labs/components/context_extension.dart';
import 'package:drive_labs/components/custom_button.dart';
import 'package:drive_labs/constants/app_colours/app_colors.dart';
import 'package:drive_labs/constants/strings.dart';
import 'package:drive_labs/gen/assets.gen.dart';
import 'package:drive_labs/main.dart';
import 'package:drive_labs/procedures/model/get_cource_response.dart';
import 'package:drive_labs/procedures/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'choose_car_screen.dart';

class SubscriptionScreen extends StatefulWidget {
  Courses? course;

  SubscriptionScreen(this.course, {super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  final List<String> _overviewIcons = [
    "assets/images/1.png",
    "assets/images/2.png",
    "assets/images/3.png",
    "assets/images/4.png",
    "assets/images/5.png",
    "assets/images/6.png",
    "assets/images/7.png",
  ];

  @override
  void initState() {
    super.initState();
    print(widget.course);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: Stack(
        children: [
          Assets.images.programBg.image(width: context.width(), fit: BoxFit.cover),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  35.verticalSpace,
                  GestureDetector(
                    onTap: () {
                      navigationService.pop();
                    },
                    child: Icon(Icons.arrow_back_ios),
                  ),
                  10.verticalSpace,
                  Container(
                    width: context.width() * 0.90,
                    height: 96.sp,
                    padding: const EdgeInsets.only(top: 25, bottom: 15),
                    decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/0-1.png"))),
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        Stack(
                          children: [
                            Text(
                              "Rs. ${NumberFormat('#,##0').format(widget.course?.price)}",
                              style: GoogleFonts.montserrat(
                                fontSize: 40,
                                fontWeight: FontWeight.w700,
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 4
                                  ..color = AppColors.blackColor,
                              ),
                            ),
                            Text(
                              "Rs. ${NumberFormat('#,##0').format(widget.course?.price)}",
                              style: GoogleFonts.montserrat(
                                fontSize: 40,
                                fontWeight: FontWeight.w700,
                                color: AppColors.yellowColor,
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: -42,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                            decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/0-2.png"))),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Original Price ",
                                    style: GoogleFonts.montserrat(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
                                  ),
                                  TextSpan(
                                    text: "${NumberFormat('#,##0').format(widget.course?.originalPrice)}/-",
                                    style: GoogleFonts.montserrat(
                                      color: Colors.red,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      decoration: TextDecoration.lineThrough,
                                      decorationColor: Colors.red,
                                      decorationThickness: 2.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  10.verticalSpace,
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: widget.course?.overviewPoints?.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.sp),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(_overviewIcons[index], width: 60.sp, height: 60.sp),
                            10.horizontalSpace,
                            Expanded(
                              child: Text(
                                widget.course?.overviewPoints?[index] ?? "",
                                style: GoogleFonts.montserrat(
                                  color: AppColors.blackColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  10.verticalSpace,
                  CustomButton(
                    text: LabelString.labelYesIn.toUpperCase(),
                    backgroundColor: AppColors.yellowColor,
                    textColor: AppColors.blackColor,
                    onPressed: () {
                      navigationService.push(PaymentScreen());
                    },
                    borderColor: AppColors.blackColor,
                  ),
                  10.verticalSpace,
                  CustomButton(
                    text: LabelString.labelContactUs.toUpperCase(),
                    backgroundColor: AppColors.redButtonColor,
                    textColor: AppColors.whiteColor,
                    trailingIcon: Icon(Icons.phone, color: AppColors.whiteColor),
                    onPressed: () {
                      navigationService.push(ChooseCarScreen(widget.course));
                    },
                    borderColor: AppColors.blackColor,
                  ),
                  20.verticalSpace,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
