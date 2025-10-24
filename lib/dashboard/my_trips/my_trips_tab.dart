import 'package:drive_labs/components/context_extension.dart';
import 'package:drive_labs/components/custom_button.dart';
import 'package:drive_labs/constants/app_colours/app_colors.dart';
import 'package:drive_labs/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTrips extends StatefulWidget {
  const MyTrips({super.key});

  @override
  State<MyTrips> createState() => _MyTripsState();
}

class _MyTripsState extends State<MyTrips> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: Stack(
        children: [
          Assets.images.programBg.image(width: context.width(), fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  35.verticalSpace,
                  Assets.images.progress.image(width: context.width(), fit: BoxFit.cover),
                  5.verticalSpace,
                  _buildTripCard("Class 13", "27/04/2024"),
                  20.verticalSpace,
                  _buildTripCard("Class 14", "30/04/2024"),
                  20.verticalSpace,
                  _buildTripCard("Class 14", "30/04/2024"),
                  20.verticalSpace,
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTripCard(String title, String date) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        padding: const EdgeInsets.all(14.0),
        decoration: BoxDecoration(
          color: const Color(0xFFD3FFFF),
          border: Border.all(color: AppColors.black, width: 1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: GoogleFonts.montserrat(
                      fontSize: 20,
                      color: AppColors.black,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.black, width: 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    date,
                    style: GoogleFonts.montserrat(
                        fontSize: 14,
                        color: AppColors.black,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
            15.verticalSpace,
            ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Assets.images.map.image()),
            10.verticalSpace,
            RichText(
              text: TextSpan(
                text: '9 ',
                style: GoogleFonts.montserrat(
                    fontSize: 16,
                    color: AppColors.green,
                    fontWeight: FontWeight.bold),
                children: <TextSpan>[
                  TextSpan(
                      text: 'kms',
                      style: GoogleFonts.montserrat(
                          fontSize: 16,
                          color: AppColors.black,
                          fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: ' | ',
                      style: GoogleFonts.montserrat(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold)),
                  TextSpan(
                    text: '23 ',
                    style: GoogleFonts.montserrat(
                        fontSize: 16,
                        color: AppColors.green,
                        fontWeight: FontWeight.bold),),
                  TextSpan(
                      text: 'km/hr',
                      style: GoogleFonts.montserrat(
                          fontSize: 16,
                          color: AppColors.black,
                          fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: ' | ',
                      style: GoogleFonts.montserrat(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: '30 ',
                      style: GoogleFonts.montserrat(
                          fontSize: 16,
                          color: AppColors.green,
                          fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: 'mins',
                      style: GoogleFonts.montserrat(
                          fontSize: 16,
                          color: AppColors.black,
                          fontWeight: FontWeight.bold)),

                ],
              ),
            ),

            15.verticalSpace,
            CustomButton(borderColor: AppColors.black,
                text: 'CHECK STATS',
                backgroundColor: AppColors.yellowColor,
                textColor: AppColors.black,
                onPressed: () {})
          ],
        ),
      ),
    );
  }
}
