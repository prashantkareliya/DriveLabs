import 'package:drive_labs/Employee/dash/emp_home/post_class_review.dart';
import 'package:drive_labs/components/context_extension.dart';
import 'package:drive_labs/components/custom_button.dart';
import 'package:drive_labs/components/custom_textField.dart';
import 'package:drive_labs/constants/app_colours/app_colors.dart';
import 'package:drive_labs/constants/strings.dart';
import 'package:drive_labs/gen/assets.gen.dart';
import 'package:drive_labs/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentDetail extends StatefulWidget {
  const StudentDetail({super.key});

  @override
  State<StudentDetail> createState() => _StudentDetailState();
}

class _StudentDetailState extends State<StudentDetail> {
  final _notesController = TextEditingController();
  final _msgController = TextEditingController();

  final List<Map<String, dynamic>> parameters = const [
    {"label": "Clutch", "rating": 4},
    {"label": "Steering", "rating": 4},
    {"label": "Gear Shifting", "rating": 4},
    {"label": "Road Sense", "rating": 4},
    {"label": "Independence", "rating": 4},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,

      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              navigationService.pop();
            },
            child: Assets.images.programBg.image(width: context.width(), fit: BoxFit.cover),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                35.verticalSpace,
                GestureDetector(
                  onTap: () {},
                  child: Assets.images.studentDetail.image(width: context.width(), fit: BoxFit.cover),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.red,
                            child: Icon(Icons.person, color: Colors.white, size: 28),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Felix Daugherty',
                                  style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.blackColor),
                                ),

                                Text(
                                  '6:30 AM - 7:20 AM',
                                  style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.blackColor),
                                ),
                              ],
                            ),
                          ),
                          Assets.icons.phone1.svg(height: 45),
                        ],
                      ),
                      15.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Assets.icons.timer.svg(),
                          const SizedBox(width: 16),
                          Text(
                            '00:30:00',
                            style: GoogleFonts.montserrat(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.blackColor),
                          ),
                        ],
                      ),
                      15.verticalSpace,
                      Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              text: "START CLASS",
                              fontSize: 14,
                              backgroundColor: AppColors.skyBlueLight,
                              textColor: AppColors.blackColor,
                              onPressed: () {},
                            ),
                          ),
                          5.horizontalSpace,
                          Expanded(
                            child: CustomButton(
                              text: "END CLASS",
                              fontSize: 14,
                              backgroundColor: AppColors.redColor,
                              textColor: AppColors.whiteColor,
                              onPressed: () {
                                navigationService.push(PostClassReview());
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                30.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextFormField(
                        label: LabelString.labelLastClassNotes,
                        hintText: LabelString.labelEnterNotes,
                        controller: _notesController,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return ErrorString.notesErr;
                          }
                          return null;
                        },
                      ),
                      8.verticalSpace,
                      CustomTextFormField(
                        label: LabelString.labelStudentMessage,
                        hintText: LabelString.labelStudentMessage,
                        controller: _msgController,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return ErrorString.msgErr;
                          }
                          return null;
                        },
                      ),
                      20.verticalSpace,
                      Text(
                        LabelString.labelTotalRating,
                        style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.blackColor),
                      ),
                      8.verticalSpace,

                      StarRating(rating: 4),
                    ],
                  ),
                ),
                30.verticalSpace,
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  height: context.height() * 0.357,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(ImageString.imgStudentDetailBtm), fit: BoxFit.fill),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Parameters",
                              style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.blackColor),
                            ),
                            Text(
                              "Average Rating",
                              style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.blackColor),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),

                        // Parameters List
                        ...parameters.map(
                          (param) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  param["label"],
                                  style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.blackColor),
                                ),
                                StarRating(rating: param["rating"]),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StarRating extends StatelessWidget {
  final int rating;
  final int maxRating;
  final double iconHeight;
  const StarRating({super.key, required this.rating, this.maxRating = 5, this.iconHeight = 25});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(maxRating, (index) {
        return index < rating
            ? Padding(padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 1), child: Assets.icons.starYellow.svg(height: iconHeight))
            : Assets.icons.star.svg(height: iconHeight);
      }),
    );
  }
}
