import 'package:drive_labs/components/context_extension.dart';
import 'package:drive_labs/components/custom_loading_wrapper.dart';
import 'package:drive_labs/constants/helpers.dart';
import 'package:drive_labs/main.dart';
import 'package:drive_labs/procedures/bloc/procedures_bloc.dart';
import 'package:drive_labs/procedures/data/procedures_datasource.dart';
import 'package:drive_labs/procedures/data/procedures_repository.dart';
import 'package:drive_labs/procedures/model/get_cource_response.dart';
import 'package:drive_labs/procedures/program_map_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/custom_button.dart';
import '../constants/app_colours/app_colors.dart';
import '../constants/strings.dart';
import '../gen/assets.gen.dart';
import 'subscripation_screen.dart';

class ProgramScreen extends StatefulWidget {
  const ProgramScreen({super.key});

  @override
  State<ProgramScreen> createState() => _ProgramScreenState();
}

class _ProgramScreenState extends State<ProgramScreen> {
  ProceduresBloc proceduresBloc = ProceduresBloc(ProcedureRepository(procedureDataSource: ProcedureDataSource()));
  bool showSpinner = false;

  GetAllCourseResponse? courseData;

  // List of colors for the tiles
  final List<Color> _tileColors = [const Color(0xFFD3FFFF), const Color(0xFFE896DF), const Color(0xFFFEDD00)];

  // List of colors for the tags
  final List<Color> _tagColors = [
    const Color(0xFFFEDD00), // Yellow
    const Color(0xFF82B1FF), // Blue
    const Color(0xFF98FB98), // Pale Green
  ];

  @override
  void initState() {
    super.initState();
    getAllCourse();
  }

  void getAllCourse() {
    proceduresBloc.add(GetAllCoursesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Assets.images.programBg.image(fit: BoxFit.cover, height: context.height(), width: context.width()),
          BlocConsumer<ProceduresBloc, ProceduresState>(
            bloc: proceduresBloc,
            listener: (context, state) {
              if (state is FailureState) {
                showSpinner = false;
                Helpers.showSnackBar(context, state.error);
              }
              if (state is LoadingState) {
                showSpinner = true;
              }
              if (state is LoadedState) {
                showSpinner = false;
                courseData = state.data;
              }
            },
            builder: (context, state) {
              return LoadingWrapper(
                showSpinner: showSpinner,
                // Use SingleChildScrollView to allow the whole page to scroll
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Column(
                      children: [
                        45.verticalSpace,
                        Assets.images.coursesText.image(height: 120),
                        10.verticalSpace,
                        Assets.images.ourCourses.image(height: 35),
                        30.verticalSpace,
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: courseData?.courses?.length ?? 0,
                          // Handle null case
                          itemBuilder: (context, index) {
                            final tileColor = _tileColors[index % _tileColors.length];
                            final tagColor = _tagColors[index % _tagColors.length];

                            return GestureDetector(
                              onTap: () {
                                navigationService.push(ProgramMapScreen(courseData?.courses?[index]));
                                //navigationService.push(SubscriptionScreen(courseData?.courses?[index]));
                              },
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 18.sp),
                                    child: Container(
                                      width: context.width(),
                                      decoration: BoxDecoration(
                                        color: tileColor,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(color: const Color(0xFF1F2125), width: 1.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,

                                          children: [
                                            20.verticalSpace,
                                            Text(
                                              courseData?.courses?[index].name?.toUpperCase() ?? '',
                                              style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.bold),
                                            ),
                                            4.verticalSpace,
                                            Text(
                                              courseData?.courses?[index].tagline ?? "",
                                              style: GoogleFonts.montserrat(fontSize: 10, fontWeight: FontWeight.w600),
                                            ),
                                            4.verticalSpace,
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  "₹ ${courseData?.courses?[index].price ?? '10,000'}",
                                                  style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.bold),
                                                ),
                                                Assets.icons.arrowRight.image(height: 35),
                                              ],
                                            ),
                                            10.verticalSpace,
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (index == 0)
                                    Positioned(
                                      top: -17,
                                      left: 22,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                                        decoration: BoxDecoration(
                                          color: tagColor, // Use the dynamic tag color here
                                          borderRadius: BorderRadius.circular(20),
                                          border: Border.all(color: const Color(0xFF1F2125), width: 1.0),
                                        ),
                                        child: Text(
                                          "For Beginners",
                                          style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            );
                          },
                        ),
                        10.verticalSpace,
                        //Invite friends
                        Container(
                          width: context.width(),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFEFDF9),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: const Color(0xFF1F2125), width: 1.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Column(
                              children: [
                                12.verticalSpace,
                                Text(
                                  "Invite Friends!".toUpperCase(),
                                  style: GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                5.verticalSpace,
                                Text(
                                  "Lorem ipsum dolor sit amet. Nulla eget \negestas aliquam nunc",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.montserrat(fontSize: 10, fontWeight: FontWeight.w600),
                                ),
                                14.verticalSpace,
                                CustomButton(
                                  text: LabelString.labelReferFriend.toUpperCase(),
                                  backgroundColor: AppColors.yellowColor,
                                  textColor: AppColors.blackColor,
                                  onPressed: () {},
                                  borderColor: AppColors.blackColor,
                                ),
                                10.verticalSpace,
                              ],
                            ),
                          ),
                        ),
                        15.verticalSpace,
                        Assets.images.courseGiftCard.image(),
                        15.verticalSpace,
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
