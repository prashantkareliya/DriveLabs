import 'package:drive_labs/Employee/dash/emp_home/student_detail.dart';
import 'package:drive_labs/components/context_extension.dart';
import 'package:drive_labs/components/custom_button.dart';
import 'package:drive_labs/components/custom_textField.dart';
import 'package:drive_labs/constants/app_colours/app_colors.dart';
import 'package:drive_labs/constants/strings.dart';
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

  int _carControlRating = 0;
  int _roadSenseRating = 0;
  int _trafficRulesRating = 0;
  int _maneuversRating = 0;
  int _spatialAwarenessRating = 0;
  int _defensiveDrivingRating = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (currentStep < totalSteps) {
      _pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    } else {
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
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              children: [
                30.verticalSpace,
                Assets.images.postClass.image(width: context.width(), fit: BoxFit.cover),
                10.verticalSpace,
                Text(
                  'SESSION COMPLETION\nREQUIRED',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black87),
                ),
                10.verticalSpace,

                Text(
                  '$currentStep/$totalSteps',
                  style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.green),
                ),

                10.verticalSpace,
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
                              StarRating(
                                onRatingChanged: (rating) => setState(() => _carControlRating = rating),
                                initialRating: _carControlRating,
                              ),
                              80.verticalSpace,
                              Assets.images.postClass1.image(height: 50),
                              10.verticalSpace,
                              StarRating(
                                onRatingChanged: (rating) => setState(() => _roadSenseRating = rating),
                                initialRating: _roadSenseRating,
                              ),
                            ],
                          );
                          break;

                        case 1:
                          stepWidget = Column(
                            children: [
                              Assets.images.postClass2.image(height: 50),
                              10.verticalSpace,
                              StarRating(
                                onRatingChanged: (rating) => setState(() => _trafficRulesRating = rating),
                                initialRating: _trafficRulesRating,
                              ),
                              80.verticalSpace,
                              Assets.images.postClass5.image(height: 50),
                              10.verticalSpace,
                              StarRating(
                                onRatingChanged: (rating) => setState(() => _maneuversRating = rating),
                                initialRating: _maneuversRating,
                              ),
                            ],
                          );
                          break;

                        case 2:
                          stepWidget = Column(
                            children: [
                              Assets.images.postClass3.image(height: 50),
                              10.verticalSpace,
                              StarRating(
                                onRatingChanged: (rating) => setState(() => _spatialAwarenessRating = rating),
                                initialRating: _spatialAwarenessRating,
                              ),
                              80.verticalSpace,
                              Assets.images.postClass4.image(height: 50),
                              10.verticalSpace,
                              StarRating(
                                onRatingChanged: (rating) => setState(() => _defensiveDrivingRating = rating),
                                initialRating: _defensiveDrivingRating,
                              ),
                            ],
                          );
                          break;

                        case 3:
                          stepWidget = SingleChildScrollView(
                            child: Column(
                              children: [
                                Assets.images.mapMyIndia.image(height: 50),
                                25.verticalSpace,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Assets.icons.timer.svg(),
                                    const SizedBox(width: 16),
                                    Text(
                                      '00:30:00',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.blackColor,
                                      ),
                                    ),
                                  ],
                                ),
                                10.verticalSpace,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Assets.icons.routeBlack.svg(height: 50),
                                    const SizedBox(width: 55),
                                    Text(
                                      '7 kms',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.blackColor,
                                      ),
                                    ),
                                  ],
                                ),
                                10.verticalSpace,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Assets.icons.stearing.svg(height: 50),
                                    const SizedBox(width: 16),
                                    Text(
                                      '21 km/hr',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.blackColor,
                                      ),
                                    ),
                                  ],
                                ),
                                15.verticalSpace,
                                CustomTextFormField(label: LabelString.labelAddComments, hintText: "Write Here", maxLines: 4),
                              ],
                            ),
                          );
                          break;

                        default:
                          stepWidget = const SizedBox(); // fallback for safety
                      }

                      return Padding(padding: const EdgeInsets.symmetric(vertical: 40), child: stepWidget);
                    },
                  ),
                ),

                // Next Button
                CustomButton(
                  borderColor: AppColors.blackColor,
                  fontSize: 18,
                  onPressed: _nextPage,
                  text: currentStep == totalSteps ? 'COMPLETE' : 'NEXT',
                  backgroundColor: currentStep == totalSteps ? AppColors.green : AppColors.skyBlueLight,
                  textColor: currentStep == totalSteps ? AppColors.whiteColor : AppColors.blackColor,
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

class StarRating extends StatefulWidget {
  final int maxRating;
  final Function(int) onRatingChanged;
  final double iconHeight;
  final int initialRating;

  const StarRating({super.key, this.maxRating = 5, required this.onRatingChanged, this.iconHeight = 50, this.initialRating = 0});

  @override
  State<StarRating> createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  late int _currentRating;

  @override
  void initState() {
    super.initState();
    _currentRating = widget.initialRating;
  }

  @override
  void didUpdateWidget(covariant StarRating oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialRating != _currentRating) {
      setState(() {
        _currentRating = widget.initialRating;
      });
    }
  }

  Widget _buildStar(int index) {
    final isSelected = index < _currentRating;
    return GestureDetector(
      onTap: () {
        final newRating = index + 1;
        setState(() {
          _currentRating = newRating;
        });
        widget.onRatingChanged(newRating);
        print(_currentRating);
      },
      child: isSelected
          ? Assets.icons.starYellow.svg(height: widget.iconHeight)
          : Assets.icons.star.svg(height: widget.iconHeight),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.maxRating, (index) {
        return Padding(padding: const EdgeInsets.symmetric(horizontal: 4.0), child: _buildStar(index));
      }),
    );
  }
}
