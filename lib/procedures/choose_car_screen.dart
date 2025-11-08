import 'package:drive_labs/components/context_extension.dart';
import 'package:drive_labs/constants/app_colours/app_colors.dart';
import 'package:drive_labs/constants/strings.dart';
import 'package:drive_labs/procedures/model/get_cource_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:drive_labs/components/custom_button.dart';
import 'package:drive_labs/gen/assets.gen.dart';
import 'package:drive_labs/main.dart';
import 'licensing_procedures_screen.dart';

class ChooseCarScreen extends StatefulWidget {
  final Courses? courses;

  const ChooseCarScreen(this.courses, {super.key});

  @override
  State<ChooseCarScreen> createState() => _ChooseCarScreenState();
}

class _ChooseCarScreenState extends State<ChooseCarScreen> {
  String? selectedCar;

  @override
  void initState() {
    super.initState();
    // Set the first car type as the default selection if the list is not empty
    if (widget.courses?.carTypes?.isNotEmpty ?? false) {
      selectedCar = widget.courses?.carTypes?.first.type;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Safely get the list of car types
    final carTypes = widget.courses?.carTypes ?? [];

    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: Stack(
        children: [
          Assets.images.programBg.image(width: context.width(), fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  35.verticalSpace,
                  Assets.images.chooseCar1.image(),
                  15.verticalSpace,
                  Text(
                    LabelString.labelChooseCar,
                    style: GoogleFonts.montserrat(fontSize: 24, fontWeight: FontWeight.w700, color: AppColors.blackColor),
                  ),
                  25.verticalSpace,

                  ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: carTypes.length,
                    itemBuilder: (context, index) {
                      final carType = carTypes[index];

                      // Dynamic image selection based on car type
                      String carImage;
                      final typeString = carType.type?.toLowerCase() ?? '';

                      if (typeString.contains('suv')) {
                        carImage = Assets.images.car1.path; // SUV image
                      } else if (typeString.contains('hatchback')) {
                        carImage = Assets.images.car2.path; // Hatchback image
                      } else if (typeString.contains('sedan')) {
                        carImage = Assets.images.car3.path; // Sedan image
                      } else {
                        carImage = Assets.images.car1.path; // Default image
                      }

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: carOption(
                          image: carImage,
                          title1: 'LEARN IN',
                          title2: carType.type?.toUpperCase() ?? 'UNKNOWN',
                          value: carType.type ?? '', // Use the full type as the unique value
                        ),
                      );
                    },
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Divider(thickness: 2, color: Colors.black12),
                  ),
                  carOption(title1: 'I DON’T HAVE CAR', value: 'No Car'),
                  12.verticalSpace,
                  CustomButton(
                    text: LabelString.labelNext.toUpperCase(),
                    backgroundColor: AppColors.yellowColor,
                    textColor: AppColors.blackColor,
                    onPressed: () {
                      navigationService.push(LicensingProceduresScreen());
                    },
                    borderColor: AppColors.blackColor,
                  ),
                  20.verticalSpace,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget carOption({String? image, String? title1, String? title2, required String value}) {
    final bool isSelected = selectedCar == value;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCar = value;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        width: context.width(),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.whiteColor : AppColors.transparent,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: isSelected ? const Color(0xFF1F2125) : Colors.transparent, width: 1.5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            15.horizontalSpace,
            if (image != null) Image.asset(image, width: 90, height: 55, fit: BoxFit.contain),
            if (image != null) 20.horizontalSpace,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title1 != null)
                  Text(
                    title1,
                    style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.grayFont),
                  ),
                if (title2 != null)
                  SizedBox(
                    width: context.width() * 0.3,
                    child: Text(
                      title2,
                      style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.grayFont),
                    ),
                  ),
              ],
            ),
            const Spacer(),
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: isSelected ? AppColors.green : Colors.grey.shade400, width: 3),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(color: AppColors.green, shape: BoxShape.circle),
                      ),
                    )
                  : null,
            ),
            15.horizontalSpace,
          ],
        ),
      ),
    );
  }
}
