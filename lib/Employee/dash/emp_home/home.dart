import 'package:drive_labs/Employee/dash/emp_home/student_detail.dart';
import 'package:drive_labs/components/context_extension.dart';
import 'package:drive_labs/constants/app_colours/app_colors.dart';
import 'package:drive_labs/gen/assets.gen.dart';
import 'package:drive_labs/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
          Column(
            children: [
              35.verticalSpace,
              GestureDetector(
                onTap: () {},
                child: Assets.images.teachingSchedule.image(width: context.width(), fit: BoxFit.cover),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ListView(
                    padding: const EdgeInsets.all(0.0),
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF2A8D5C), Color(0xFF0A6B3B)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(width: 1.5),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Trainer Name',
                                      style: GoogleFonts.montserrat(color: AppColors.whiteColor, fontSize: 16, fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Brandi Collier',
                                      style: GoogleFonts.montserrat(color: Color(0xFFD3FFFF), fontSize: 20, fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                const CircleAvatar(
                                  radius: 28,
                                  backgroundColor: Colors.red,
                                  child: Icon(Icons.person, color: Colors.white, size: 32),
                                ),
                              ],
                            ),
                            5.verticalSpace,
                            Divider(color: AppColors.whiteColor, height: 25, thickness: 0.5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Car Type',
                                      style: GoogleFonts.montserrat(color: AppColors.whiteColor, fontSize: 16, fontWeight: FontWeight.w600),
                                    ),
                                    2.verticalSpace,
                                    Text(
                                      'Compact SUV',
                                      style: GoogleFonts.montserrat(color: Color(0xFFD3FFFF), fontSize: 20, fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                Assets.images.car3.image(color: AppColors.whiteColor),
                              ],
                            ),
                          ],
                        ),
                      ),
                      20.verticalSpace,

                      // Today's Class Title
                      Text(
                        "Today's Class",
                        style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.blackColor),
                      ),
                      8.verticalSpace,
                      _buildClassCard(name: 'Felix Daugherty', time: '6:30 AM - 7:20 AM', isToday: true),
                      Divider(height: 40, color: Colors.grey.shade400),

                      _buildParkingClassCard(name: 'Jeff Kozey', date: '20th August', day: 'Saturday', time: '8:30 AM - 9:20 AM'),
                      14.verticalSpace,

                      _buildClassCard(name: 'Felix Daugherty', date: '20th August', day: 'Saturday', time: '8:30 AM - 9:20 AM'),
                      14.verticalSpace,

                      _buildClassCard(name: 'Felix Daugherty', date: '20th August', day: 'Saturday', time: '8:30 AM - 9:20 AM'),
                      12.verticalSpace,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildClassCard({required String name, required String time, String? date, String? day, bool isToday = false}) {
    return Container(
      decoration: BoxDecoration(
        color: isToday ? const Color(0xFFBEBEBE) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black, width: 1.5),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 28,
            backgroundColor: Colors.red,
            child: Icon(Icons.person, color: Colors.white, size: 32),
          ),
          12.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                ),

                if (date != null && day != null)
                  Text(
                    '$date | $day',
                    style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87),
                  ),

                Text(
                  time,
                  style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87),
                ),
                12.verticalSpace,
                Row(
                  children: [
                    _buildIconButton("assets/icons/info.svg", AppColors.skyBlueLight),
                    const SizedBox(width: 8),
                    _buildIconButton("assets/icons/map.svg", AppColors.skyBlueLight),
                    const SizedBox(width: 8),
                    _buildIconButton("assets/icons/setting.svg", AppColors.skyBlueLight),
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              navigationService.push(StudentDetail());
            },
            child: Container(
              decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle, border: Border.all(width: 1.5)),
              child: Assets.icons.arrowRight.image(height: 40),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildParkingClassCard({required String name, required String date, required String day, required String time}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFE4CFA9),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black, width: 1.5),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(radius: 28, backgroundImage: NetworkImage('https://via.placeholder.com/150')),
                    12.horizontalSpace,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
                          ),

                          Text(
                            '$date | $day',
                            style: GoogleFonts.montserrat(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.black87),
                          ),
                          Text(
                            time,
                            style: GoogleFonts.montserrat(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                12.verticalSpace,
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: AppColors.skyBlueLight,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: AppColors.blackColor, width: 1.5),
                  ),
                  child: Center(
                    child: Text(
                      'PARKING CLASS',
                      style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.blackColor),
                    ),
                  ),
                ),
                8.verticalSpace,
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFF2E1),
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: Colors.black, width: 1.5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Student not available',
                        style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          12.horizontalSpace,
          Column(
            children: [
              _buildIconButton("assets/icons/info.svg", AppColors.skyBlueLight),
              12.verticalSpace,
              _buildIconButton("assets/icons/map.svg", AppColors.skyBlueLight),
              12.verticalSpace,
              _buildIconButton("assets/icons/phone_1.svg", AppColors.skyBlueLight),
              12.verticalSpace,
              _buildIconButton("assets/icons/setting.svg", AppColors.skyBlueLight),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(String icon, Color backgroundColor) {
    return SvgPicture.asset(icon, height: 35);
  }
}
