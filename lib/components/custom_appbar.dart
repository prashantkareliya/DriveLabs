import 'package:drive_labs/constants/app_colours/app_colors.dart';
import 'package:drive_labs/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? widget;
  final Color? backgroundColor;


  CustomAppBar({
    super.key,
    this.widget,
    this.backgroundColor
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      title:  GestureDetector(
        onTap: () {
          navigationService.pop();
        },
        child: widget,
      ),
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}