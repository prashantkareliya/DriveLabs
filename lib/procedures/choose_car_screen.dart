import 'package:drive_labs/components/context_extension.dart';
import 'package:drive_labs/constants/app_colours/app_colors.dart';
import 'package:drive_labs/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:drive_labs/components/custom_button.dart';
import 'package:drive_labs/gen/assets.gen.dart';
import 'package:drive_labs/main.dart';
import 'licensing_procedures_screen.dart';

class ChooseCarScreen extends StatefulWidget {
  const ChooseCarScreen({super.key});

  @override
  State<ChooseCarScreen> createState() => _ChooseCarScreenState();
}

class _ChooseCarScreenState extends State<ChooseCarScreen> {
  String selectedCar = 'SEDAN';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: Stack(
        children: [
          Assets.images.programBg.image(width: context.width(), fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Column(
              children: [
                35.verticalSpace,
                Assets.images.chooseCar1.image(),
                15.verticalSpace,
                Text(
                  LabelString.labelChooseCar,
                  style: GoogleFonts.montserrat(fontSize: 24, fontWeight: FontWeight.w700, color: AppColors.blackColor),
                ),
                carOption(image: 'assets/images/car_1.png', title1: 'LEARN IN', title2:"SEDAN", value: 'Sedan'),
                12.verticalSpace,
                carOption(image: 'assets/images/car_2.png', title1: 'LEARN IN', title2:"HATCHBACK", value: 'Hatchback'),
                12.verticalSpace,
                carOption(image: 'assets/images/car_3.png', title1: 'LEARN IN', title2:"COMPACT SUV", value: 'Compact Suv'),
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
              ],
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
        height: image != null ? 90 : 50,
        width: isSelected ? context.width() / 1.15 : context.width(),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.whiteColor : AppColors.transparent,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            if (isSelected)
              BoxShadow(color: Colors.black.withValues(alpha: 0.15), blurRadius: 12, offset: const Offset(0, 4))
            else
              BoxShadow(color: Colors.transparent, blurRadius: 8, offset: const Offset(0, 2)),
          ],
          border: Border.all(color: isSelected ? Color(0xFF1F2125) : Colors.transparent, width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            15.horizontalSpace,
            if (image != null)
            Image.asset(image, width: 65, height: 65),
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
                Text(
                  title2,
                  style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.grayFont),
                ),
              ],
            ),
            Spacer(),
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
