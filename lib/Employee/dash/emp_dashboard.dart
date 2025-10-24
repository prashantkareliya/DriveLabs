import 'package:drive_labs/constants/app_colours/app_colors.dart';
import 'package:drive_labs/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'emp_home/home.dart';
import 'emp_profile/profile.dart';
import 'emp_route/route.dart';

class EmpDashboard extends StatefulWidget {
  const EmpDashboard({super.key});

  @override
  State<EmpDashboard> createState() => _EmpDashboardState();
}

class _EmpDashboardState extends State<EmpDashboard> {
  int _selectedIndex = 1;

  final List<Widget> _screens = [ProfileTab(), HomeTab(), RouteTab()];

  final List<String> _icons = ["assets/icons/emp_profile.svg", "assets/icons/emp_home.svg", "assets/icons/route.svg"];

  final List<String> _labels = ['Profile', '', 'Route'];

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
            color: AppColors.yellowColor,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(3, (index) {
              if (index == 1) {
                return ClipOval(
                  child: FloatingActionButton(
                    onPressed: () => _onTabTapped(index),
                    backgroundColor: Colors.white,
                    child: Assets.icons.empHome.svg(),
                  ),
                );
              } else {
                final bool isSelected = _selectedIndex == index;

                return GestureDetector(
                  onTap: () => _onTabTapped(index),
                  child: SizedBox(
                    width: 50.sp,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        10.verticalSpace,
                        SvgPicture.asset(
                          height: 28,
                          _icons[index],
                          colorFilter: ColorFilter.mode(isSelected ? AppColors.blackColor : Colors.grey.shade800, BlendMode.srcIn),
                        ),
                        2.verticalSpace,
                        if (_labels[index].isNotEmpty)
                          Text(
                            isSelected ? _labels[index] : '',
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              color: isSelected ? AppColors.blackColor : Colors.grey.shade800,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                      ],
                    ),
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
