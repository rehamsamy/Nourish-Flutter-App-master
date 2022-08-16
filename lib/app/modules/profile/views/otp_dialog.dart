import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/modules/profile/controllers/profile_controller.dart';
import 'package:nourish_sa/app/shared/custom_button.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

import '../../../../../app_theme.dart';

class OTPDialog extends GetView<ProfileController> {
  const OTPDialog(this.phoneNumber, {Key? key}) : super(key: key);
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      scrollable: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      content: Container(
        width: 362.w,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.symmetric(horizontal: 29.w, vertical: 34.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              LocalKeys.kFillOTP.tr,
              style: Get.textTheme.headline1,
            ),
            Padding(
              padding: EdgeInsets.only(top: 17.5.h, bottom: 20.5.h),
              child: SizedBox(
                width: Get.width,
                height: 1.h,
                child: OverflowBox(
                  maxWidth: 342.w,
                  minWidth: 342.w,
                  maxHeight: 1.h,
                  child: Container(
                    width: Get.width,
                    color: lightGreyColor,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 21.5.w),
              child: Text(
                "${LocalKeys.kSentOTPTo.tr} ${LocalKeys.kMobileNumber.tr} $phoneNumber",
                textAlign: TextAlign.center,
                style: Get.textTheme.headline3,
              ),
            ),
            PinInputTextField(
              pinLength: 4,
              decoration: BoxLooseDecoration(
                gapSpace: 29.w,
                textStyle: Get.textTheme.bodyText2,
                strokeColorBuilder: PinListenColorBuilder(
                  lightGreyColor,
                  lightGreyColor,
                ),
                bgColorBuilder: PinListenColorBuilder(
                  Colors.white,
                  Colors.white,
                ),
              ),
              controller: controller.otp,
              textInputAction: TextInputAction.go,
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.characters,
              onSubmit: (pin) {},
              onChanged: (pin) {},
              enableInteractiveSelection: false,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 52.h,
                bottom: 15.h,
              ),
              child: CustomButton(
                title: LocalKeys.kConfirm.tr,
                onPress: () {
                  Get.back();
                },
              ),
            ),
            InkWell(
              child: Text(
                LocalKeys.kResendOTP.tr,
                style: Get.textTheme.bodyText1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
