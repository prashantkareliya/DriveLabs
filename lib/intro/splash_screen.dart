import 'package:drive_labs/Employee/login/emp_login.dart';
import 'package:drive_labs/auth/dob_screen.dart';
import 'package:drive_labs/dashboard/dashboard_screen.dart';
import 'package:drive_labs/intro/intro_screens.dart';
import 'package:drive_labs/procedures/program_map_screen.dart';
import 'package:drive_labs/procedures/program_screen.dart';
import 'package:flutter/material.dart';

import 'package:drive_labs/gen/assets.gen.dart';
import 'package:drive_labs/main.dart';

import '../dashboard/home/profile_detail.dart';

class SplashScreen extends StatefulWidget {
  bool? hasSeenIntro;

  SplashScreen({super.key, required this.hasSeenIntro});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //final prefs = PreferenceService().prefs;

  @override
  void initState() {
    super.initState();
    if (widget.hasSeenIntro ?? false) {
      Future.delayed(Duration(seconds: 5), () {
        navigationService.pushReplacement(DashboardScreen());
        //navigationService.pushReplacement(EmpLogin());
        //navigationService.pushReplacement(DOBScreen());

      });
    } else {
      Future.delayed(Duration(seconds: 5), () {
        navigationService.pushReplacement(IntroScreens());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Assets.images.intro1.image(fit: BoxFit.fill),
          Positioned(bottom: 120, child: SteeringLoadingIndicator(size: 100, isShowText: true)),
        ],
      ),
    );
  }
}
