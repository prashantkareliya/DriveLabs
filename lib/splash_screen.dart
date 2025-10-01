import 'package:drive_labs/intro_screens.dart';
import 'package:flutter/material.dart';

import 'dob_screen.dart';
import 'gen/assets.gen.dart';
import 'main.dart';

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
      navigationService.pushReplacement(IntroScreens());
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
