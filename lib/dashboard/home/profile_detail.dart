import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:drive_labs/components/context_extension.dart';
import 'package:drive_labs/components/custom_button.dart';
import 'package:drive_labs/components/custom_textField.dart';
import 'package:drive_labs/constants/app_colours/app_colors.dart';
import 'package:drive_labs/gen/assets.gen.dart';
import 'package:drive_labs/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileDetail extends StatefulWidget {
  const ProfileDetail({super.key});

  @override
  State<ProfileDetail> createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  // Method to show the "About Us" bottom sheet
  void _showAboutUsSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),

      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'About Instructor',
                    style: GoogleFonts.montserrat(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                      height: 1.8,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      navigationService.pop();
                    },
                    child: Assets.icons.close.svg(height: 25.sp),
                  ),
                ],
              ),
              10.verticalSpace,
              Text(
                'Lorem ipsum dolor sit amet. Nulla eget egestas aliquam nunc scelerisque odio. Sit sed eget feugiat mattis enim nulla a nibh. Ornare est sagittis duis ipsum congue tortor. Quisque praesent leo justo et. Lorem ipsum dolor sit consectetur. Nulla eget egestas aliquam nunc scelerisque odio. Sit sed eget feugiat mattis enim nulla a nibh. Ornare est sagittis duis ipsum congue tortor. Quisque praesent leo justo et.',
                style: GoogleFonts.montserrat(color: AppColors.blackColor, fontWeight: FontWeight.w500, fontSize: 16.sp),
              ),
            ],
          ),
        );
      },
    );
  }

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
              // Wrap in SingleChildScrollView to prevent overflow with different screen sizes
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  35.verticalSpace,
                  GestureDetector(
                    onTap: () {
                      navigationService.pop();
                    },
                    child: Assets.images.home.image(width: context.width(), fit: BoxFit.cover),
                  ),
                  profileTile(),
                  20.verticalSpace,
                  customText("Date of Birth", "20-10-2001"),
                  20.verticalSpace,
                  customText("Address", "Lorem ipsum dolor sit amet."),
                  20.verticalSpace,
                  customText(
                    "About",
                    "Lorem ipsum dolor sit amet. Nulla eget egestas aliquam nunc scelerisque odio. Sit sed eget feugiat mattis enim nulla a nibh. Ornare est sagittis duis ipsum congue tortor. Quisque praesent leo justo et.",
                  ),
                  10.verticalSpace,
                  Text(
                    "Documents",
                    style: GoogleFonts.montserrat(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                      height: 1.8,
                    ),
                  ),
                  10.verticalSpace, // Added space before images
                  Row(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(10), // Added border radius
                        ),
                        padding: EdgeInsets.all(10.sp),
                        child: ClipRRect(
                          // Clip the image to the container's border radius
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            imageUrl: "https://www.indifi.com/blog/wp-content/uploads/2021/06/Aadhar-Card-400x300.jpeg",
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) => Icon(Icons.error),
                          ),
                        ),
                      ),
                      15.horizontalSpace,
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(10), // Added border radius
                        ),
                        padding: EdgeInsets.all(10.sp),
                        child: ClipRRect(
                          // Clip the image to the container's border radius
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            imageUrl: "https://media.ahmedabadmirror.com/am/uploads/mediaGallery/image/1739822695291.jpg-org",
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) => Icon(Icons.error),
                          ),
                        ),
                      ),
                    ],
                  ),
                  10.verticalSpace,
                  Text(
                    "Referral code",
                    style: GoogleFonts.montserrat(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                      height: 1.8,
                    ),
                  ),
                  10.verticalSpace, // Added space before referral field
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CustomTextFormField(hintText: "Referral code", label: ''),
                      ),
                      10.horizontalSpace, // Add some space between the field and the button
                      Container(
                        padding: EdgeInsets.only(top: 12.sp),
                        width: 110.w,
                        height: 55.sp,
                        child: CustomButton(
                          text: "SHARE",
                          backgroundColor: AppColors.green,
                          textColor: AppColors.whiteColor,
                          fontSize: 16.sp,
                          onPressed: () {},
                          borderColor: AppColors.blackColor,
                        ),
                      ),
                    ],
                  ),
                  10.verticalSpace,
                  Divider(color: AppColors.grayFont.withOpacity(0.2)),
                  10.verticalSpace,
                  Text(
                    "Instructor Detail",
                    style: GoogleFonts.montserrat(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                      height: 1.8,
                    ),
                  ),
                  5.verticalSpace,
                  Container(
                    height: 130.sp,
                    width: context.width(),
                    decoration: BoxDecoration(
                      color: AppColors.skyBlueLight,
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: AppColors.blackColor, width: 1),
                    ),
                  ),
                  20.verticalSpace,
                  GestureDetector(
                    onTap: _showAboutUsSheet, // Call the method to show the bottom sheet
                    child: Assets.images.aboutUs.image(),
                  ),
                  20.verticalSpace,
                  Assets.images.logout.image(),
                  20.verticalSpace,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  RichText customText(text1, text2) {
    return RichText(
      text: TextSpan(
        text: text1,
        style: GoogleFonts.montserrat(fontSize: 16.sp, fontWeight: FontWeight.w700, color: AppColors.black, height: 1.3),
        children: [
          TextSpan(
            text: "\n$text2",
            style: GoogleFonts.montserrat(color: AppColors.blackColor, fontWeight: FontWeight.w500, fontSize: 16.sp),
          ),
        ],
      ),
    );
  }

  profileTile() {
    return GestureDetector(
      onTap: () {
        // Avoid pushing the same screen onto itself
        // navigationService.push(ProfileDetail());
      },
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 15, top: 14, bottom: 0),
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
              ],
            ),
            10.verticalSpace,
            Divider(color: AppColors.grayFont.withOpacity(0.2)), // Use withOpacity instead of deprecated withValues
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
      ),
    );
  }
}
