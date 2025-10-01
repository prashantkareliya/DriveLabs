import 'package:drive_labs/constants/app_colours/app_colors.dart';
import 'package:drive_labs/constants/strings.dart';
import 'package:drive_labs/ragister_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'gen/assets.gen.dart';
import 'login_screen.dart';

class LoginRegistrationScreen extends StatefulWidget {
  const LoginRegistrationScreen({super.key});

  @override
  State<LoginRegistrationScreen> createState() => _LoginRegistrationScreenState();
}

class _LoginRegistrationScreenState extends State<LoginRegistrationScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController; // Declare TabController

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this); // Initialize TabController
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              Assets.images.loginRegistration2.path,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              215.verticalSpace,
              SizedBox(
                height: 55,
                child: TabBar(
                  dividerHeight: 0,
                  dividerColor: AppColors.whiteColor.withValues(alpha: 0.5),
                  indicatorColor: AppColors.whiteColor.withValues(alpha: 0.5),
                  labelColor: AppColors.whiteColor.withValues(alpha: 0.5),
                  overlayColor: WidgetStatePropertyAll(AppColors.whiteColor.withValues(alpha: 0.5)),
                  automaticIndicatorColorAdjustment: true,
                  indicatorWeight: 0,
                  indicatorPadding: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  controller: _tabController,
                  indicator: BoxDecoration(
                    image: DecorationImage(
                      image: _tabController.index == 0 ? AssetImage(ImageString.imgLogin) : AssetImage(ImageString.imgRegister),
                    ),
                  ),
                  labelPadding: EdgeInsets.zero,
                  isScrollable: false,
                  tabs: [
                    Container(
                      decoration: _tabController.index == 1
                          ? BoxDecoration(image: DecorationImage(image: AssetImage(ImageString.imgLoginInactive)))
                          : BoxDecoration(),
                    ),
                    Container(
                      decoration: _tabController.index == 0
                          ? BoxDecoration(image: DecorationImage(image: AssetImage(ImageString.imgRegisterInactive)))
                          : BoxDecoration(),
                    ),
                  ],
                  onTap: (index) {
                    setState(() {});
                  },
                ),
              ),
              10.verticalSpace,
              Expanded(
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                    controller: _tabController, children: [LoginScreen(), RegisterScreen()]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
