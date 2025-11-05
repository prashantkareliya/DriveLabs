import 'package:drive_labs/Employee/dash/emp_home/student_detail.dart';
import 'package:drive_labs/components/context_extension.dart';
import 'package:drive_labs/components/custom_button.dart';
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
                  style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.green),
                ),

                12.verticalSpace,
                // Progress Bar
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    border: Border.all(color: AppColors.whiteColor, width: 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 18,
                    borderRadius: BorderRadius.circular(20.0),
                    backgroundColor: AppColors.whiteColor,
                    color: AppColors.green,
                  ),
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
                      Widget stepWidget;
                      switch (index) {
                        case 0:
                          stepWidget = Column(
                            children: [
                              Assets.images.postClass6.image(height: 50),
                              10.verticalSpace,
                              StarRating(rating: 1, maxRating: 5, iconHeight: 50),
                              80.verticalSpace,
                              Assets.images.postClass1.image(height: 50),
                              10.verticalSpace,
                              StarRating(rating: 1, maxRating: 5, iconHeight: 50),
                            ],
                          );
                          break;

                        case 1:
                          stepWidget = Column(
                            children: [
                              Assets.images.postClass2.image(height: 50),
                              10.verticalSpace,
                              StarRating(rating: 1, maxRating: 5, iconHeight: 50),
                              80.verticalSpace,
                              Assets.images.postClass5.image(height: 50),
                              10.verticalSpace,
                              StarRating(rating: 1, maxRating: 5, iconHeight: 50),
                            ],
                          );
                          break;

                        case 2:
                          stepWidget = Column(
                            children: [
                              Assets.images.postClass3.image(height: 50),
                              10.verticalSpace,
                              StarRating(rating: 1, maxRating: 5, iconHeight: 50),
                              80.verticalSpace,
                              Assets.images.postClass4.image(height: 50),
                              10.verticalSpace,
                              StarRating(rating: 1, maxRating: 5, iconHeight: 50),
                            ],
                          );
                          break;

                        case 3:
                          stepWidget = Column(
                            children: [
                              Assets.images.mapMyIndia.image(height: 50),
                              15.verticalSpace,

                            ],
                          );
                          break;

                        default:
                          stepWidget = const SizedBox(); // fallback for safety
                      }

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 40),
                        child: stepWidget,
                      );
                    },
                  ),
                ),

                const SizedBox(height: 20),

                // Next Button
                CustomButton(
                  borderColor: AppColors.blackColor,
                  fontSize: 18,
                  onPressed: _nextPage,
                  text: currentStep == totalSteps ? 'COMPLETE' : 'NEXT',
                  backgroundColor: currentStep == totalSteps ? AppColors.green :AppColors.skyBlueLight,
                  textColor: currentStep == totalSteps ? AppColors.whiteColor :AppColors.blackColor,
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
