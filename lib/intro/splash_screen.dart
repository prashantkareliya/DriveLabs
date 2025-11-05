import 'package:drive_labs/Employee/emp_login.dart';
import 'package:drive_labs/intro/intro_screens.dart';
import 'package:drive_labs/auth/login_registration_screen.dart';
import 'package:flutter/material.dart';

import '../dashboard/dashboard_screen.dart';
import '../auth/dob_screen.dart';
import '../gen/assets.gen.dart';
import '../main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //final prefs = PreferenceService().prefs;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      //navigationService.pushReplacement(IntroScreens());
      navigationService.pushReplacement(EmpLogin());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Assets.images.intro1.image(fit: BoxFit.fill),
          Positioned(bottom: 120, child: SteeringLoadingIndicator(size: 100)),
        ],
      ),
    );
  }
}
