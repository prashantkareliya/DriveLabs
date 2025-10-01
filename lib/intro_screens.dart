import 'package:drive_labs/constants/app_colours/app_colors.dart';
import 'package:drive_labs/main.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'constants/strings.dart';
import 'dob_screen.dart';

class IntroScreens extends StatefulWidget {
  const IntroScreens({super.key});

  @override
  State<IntroScreens> createState() => _IntroScreensState();
}

class _IntroScreensState extends State<IntroScreens> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> introData = [
    {"image": ImageString.imgIntro2},
    {"image": ImageString.imgIntro3},
    {"image": ImageString.imgIntro4},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: introData.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (context, index) {
              return Image.asset(introData[index]['image'].toString());
            },
          ),
          Positioned(
            bottom: 120,
            child: SmoothPageIndicator(
              controller: _pageController,
              count: introData.length,
              effect: WormEffect(
                dotHeight: 10,
                dotWidth: 10,
                activeDotColor: AppColors.yellowColor,
                dotColor: AppColors.gray,
                spacing: 10.0,
              ),
              onDotClicked: (index) {
                _pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: _currentPage > introData.length - 2
          ? FloatingActionButton(
              onPressed: () {
                navigationService.pushReplacement(DOBScreen());
              },
              backgroundColor: AppColors.black,
              child: Icon(Icons.start, color: AppColors.yellowColor, size: 30),
            )
          : SizedBox.shrink(),
    );
  }
}
