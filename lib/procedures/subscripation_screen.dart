import 'package:drive_labs/components/context_extension.dart';
import 'package:drive_labs/components/custom_button.dart';
import 'package:drive_labs/constants/app_colours/app_colors.dart';
import 'package:drive_labs/constants/strings.dart';
import 'package:drive_labs/gen/assets.gen.dart';
import 'package:drive_labs/main.dart';
import 'package:drive_labs/procedures/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: Stack(
        children: [
          Assets.images.programBg.image(width: context.width(), fit: BoxFit.cover),
          ListView(
            physics: BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            children: [
              45.verticalSpace,
              Assets.images.subscription1.image(width: context.width(), fit: BoxFit.cover),
              25.verticalSpace,
              Assets.images.subscription2.image(width: context.width(), fit: BoxFit.cover),
              10.verticalSpace,
              Assets.images.subscription3.image(width: context.width(), fit: BoxFit.cover),
              10.verticalSpace,
              Assets.images.subscription4.image(width: context.width(), fit: BoxFit.cover),
              10.verticalSpace,
              Assets.images.subscription5.image(width: context.width(), fit: BoxFit.cover),
              10.verticalSpace,
              Assets.images.subscription6.image(width: context.width(), fit: BoxFit.cover),
              10.verticalSpace,
              Assets.images.subscription7.image(width: context.width(), fit: BoxFit.cover),
              10.verticalSpace,
              Assets.images.subscription8.image(width: context.width(), fit: BoxFit.cover),
              20.verticalSpace,
              CustomButton(
                text: LabelString.labelYesIn.toUpperCase(),
                backgroundColor: AppColors.yellowColor,
                textColor: AppColors.blackColor,
                onPressed: () {
                  navigationService.push(PaymentScreen());
                },
                borderColor: AppColors.blackColor,
              ),
              10.verticalSpace,
              CustomButton(
                text: LabelString.labelContactUs.toUpperCase(),
                backgroundColor: AppColors.redButtonColor,
                textColor: AppColors.whiteColor,
                trailingIcon: Icon(Icons.phone,color: AppColors.whiteColor),
                onPressed: () {

                },
                borderColor: AppColors.blackColor,
              ),
              20.verticalSpace,
            ],
          ),
        ],
      )
    );
  }
}
