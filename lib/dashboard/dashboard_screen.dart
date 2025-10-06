import 'package:drive_labs/constants/app_colours/app_colors.dart';
import 'package:drive_labs/dashboard/pregress/progress_tab.dart';
import 'package:drive_labs/dashboard/progress_overview/progress_pverview_tab.dart';
import 'package:drive_labs/dashboard/roadmap/roadmap_tab.dart';
import 'package:drive_labs/dashboard/test_series/test_series_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home/home_tab.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 2;

  final List<Widget> _screens = [TestSeriesTab(), ProgressTab(), HomeTab(), RoadmapTab(), ProgressOverviewTab()];

  final List<String> _icons = [
    //SvgPicture.asset("assets/icons/location.svg", height: 25.sp)
    "assets/icons/zero.svg",
    "assets/icons/one.svg",
    "assets/icons/two.png",
    "assets/icons/three.svg",
    "assets/icons/four.svg",
  ];

  final List<String> _labels = ['Test Series', 'Progress', '', 'Roadmap', 'Progress'];

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.zero,
        height: 70.sp,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.black,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(5, (index) {
              if (index == 2) {
                final bool isSelected = _selectedIndex == index;
                return Column(
                  children: [
                    Container(height: 2, width: 42, color: isSelected ? Color(0xFFD3FFFF) : Colors.transparent),
                    5.verticalSpace,
                    ClipOval(
                      child: FloatingActionButton(
                        onPressed: () => _onTabTapped(index),
                        backgroundColor: Colors.white,
                        child: Image.asset("assets/icons/two.png"),
                      ),
                    ),
                  ],
                );
              } else {
                final bool isSelected = _selectedIndex == index;

                return GestureDetector(
                  onTap: () => _onTabTapped(index),
                  child: Column(
                    children: [
                      Container(height: 2, width: 42, color: isSelected ? Color(0xFFD3FFFF) : Colors.transparent),
                      15.verticalSpace,
                      SizedBox(
                        width: 52.sp,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              height: 24,
                              _icons[index],
                              colorFilter: ColorFilter.mode(isSelected ? Color(0xFFD3FFFF) : Colors.grey.shade800, BlendMode.srcIn),
                            ),
                            8.verticalSpace,
                            if (_labels[index].isNotEmpty)
                              Text(
                                isSelected ? _labels[index] : '',
                                style: GoogleFonts.montserrat(
                                  fontSize: 10,
                                  color: isSelected ? Color(0xFFD3FFFF) : Colors.grey.shade800,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
            }),
          ),
        ),
      ),
    );
  }
}
