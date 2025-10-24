import 'package:drive_labs/Employee/dash/emp_home/student_detail.dart';
import 'package:drive_labs/components/context_extension.dart';
import 'package:drive_labs/constants/app_colours/app_colors.dart';
import 'package:drive_labs/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PostClassReview extends StatefulWidget {
  const PostClassReview({super.key});

  @override
  State<PostClassReview> createState() => _PostClassReviewState();
}

class _PostClassReviewState extends State<PostClassReview> {
  final PageController _pageController = PageController();
  final int totalSteps = 4;
  int currentStep = 1;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (currentStep < totalSteps) {
      _pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    } else {
      // You can navigate to another screen or reset
      _pageController.jumpToPage(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    double progress = currentStep / totalSteps;

    return Scaffold(
      backgroundColor: AppColors.transparent,

      body: Stack(
        children: [
          Assets.images.programBg.image(width: context.width(), fit: BoxFit.fill),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              children: [
                35.verticalSpace,
                Assets.images.postClass.image(width: context.width(), fit: BoxFit.cover),
                20.verticalSpace,
                Text(
                  'SESSION COMPLETION\nREQUIRED',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black87),
                ),
                20.verticalSpace,

                // Step Text
                Text(
                  '$currentStep/$totalSteps',
                  style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.green),
                ),

                12.verticalSpace,
                // Progress Bar
                LinearProgressIndicator(
                  value: progress,
                  minHeight: 18,
                  borderRadius: BorderRadius.circular(20.0),
                  backgroundColor: AppColors.whiteColor,
                  color: AppColors.green,
                ),

                40.verticalSpace,

                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: totalSteps,
                    onPageChanged: (index) {
                      setState(() {
                        currentStep = index + 1;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Assets.images.postClass6.image(height: 50),
                          15.verticalSpace,
                          StarRating(rating: 1, maxRating: 5, iconHeight: 50),
                          80.verticalSpace,
                          Assets.images.postClass1.image(height: 50),
                          15.verticalSpace,
                          StarRating(rating: 1, maxRating: 5, iconHeight: 50),
                        ],
                      );
                    },
                  ),
                ),

                const SizedBox(height: 20),

                // Next Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFDFFFFF),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                      elevation: 0,
                    ),
                    onPressed: _nextPage,
                    child: Text(
                      currentStep == totalSteps ? 'FINISH' : 'NEXT',
                      style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
