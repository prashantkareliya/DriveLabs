import 'package:drive_labs/components/context_extension.dart';
import 'package:drive_labs/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'choose_car_screen.dart';
import 'components/custom_button.dart';
import 'components/custom_textField.dart';
import 'constants/app_colours/app_colors.dart';
import 'constants/strings.dart';
import 'gen/assets.gen.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String selectedPayment = 'PhonePe';

  final _enterCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: Stack(
        children: [
          Assets.images.programBg.image(width: context.width(), fit: BoxFit.cover),
          ListView(
            physics: BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            children: [
              35.verticalSpace,
              GestureDetector(
                onTap: () {
                  navigationService.pop();
                },
                child: Assets.images.paymentWith.image(width: context.width(), fit: BoxFit.cover),
              ),
              paymentOption(image: 'assets/icons/gpay.png', title: 'Pay With GooglePay', value: 'GooglePay'),
              12.verticalSpace,
              paymentOption(image: 'assets/icons/phone_pay.png', title: 'Pay With PhonePe', value: 'PhonePe'),
              12.verticalSpace,
              paymentOption(image: 'assets/icons/master_card.png', title: 'Pay With Master Card', value: 'MasterCard'),
              12.verticalSpace,
              CustomTextFormField(
                label: LabelString.labelEnterReferralCode,
                hintText: LabelString.labelEnterCode,
                controller: _enterCodeController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return ErrorString.emailAddressErr;
                  }
                  return null;
                },
                suffixIcon: SizedBox(
                  width: context.width() * 0.34,
                  child: CustomButton(
                    text: LabelString.labelApply,
                    backgroundColor: AppColors.green,
                    textColor: AppColors.whiteColor,
                    onPressed: () {},
                    borderColor: AppColors.blackColor,
                  ),
                ),
              ),
              80.verticalSpace,
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: AppColors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 2))],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildRow('21 Days Program', '₹ 10000.00'),
                    5.verticalSpace,
                    _buildRow('Discount', '₹ 0.00'),
                    5.verticalSpace,
                    _buildRow('GIFT Coupon', '₹ 500.00'),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Divider(thickness: 2, color: Colors.black12),
                    ),
                    _buildRow('Total', '₹ 9500.00', isBold: true),
                  ],
                ),
              ),
              10.verticalSpace,
              CustomButton(
                text: LabelString.labelPayNow.toUpperCase(),
                backgroundColor: AppColors.yellowColor,
                textColor: AppColors.blackColor,
                onPressed: () {
                  navigationService.push(ChooseCarScreen());
                },
                borderColor: AppColors.blackColor,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget paymentOption({required String image, required String title, required String value}) {
    final bool isSelected = selectedPayment == value;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPayment = value;
        });
      },
      child: Container(
        height: 90,
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
            Image.asset(image, width: 55, height: 55),
            20.horizontalSpace,
            Text(
              title,
              style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black87),
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

  Widget _buildRow(String title, String amount, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.montserrat(fontSize: 15, fontWeight: isBold ? FontWeight.w700 : FontWeight.w500, color: AppColors.blackColor),
        ),
        Text(
          amount,
          style: GoogleFonts.montserrat(fontSize: 15, fontWeight: isBold ? FontWeight.w700 : FontWeight.w500, color: Colors.black),
        ),
      ],
    );
  }
}
