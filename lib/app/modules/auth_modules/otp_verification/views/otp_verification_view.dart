import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/assets.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/data/models/resend_otp_model.dart';
import 'package:nourish_sa/app/data/models/verify_email_model.dart';
import 'package:nourish_sa/app/data/remote_data_sources/auth_apis.dart';
import 'package:nourish_sa/app/data/services/shared_pref.dart';
import 'package:nourish_sa/app/shared/custom_button.dart';
import 'package:nourish_sa/routes/app_pages.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

import '../../../../../app_theme.dart';
import '../controllers/otp_verification_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpVerificationView extends GetView<OtpVerificationController> {
  const OtpVerificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          Assets.kLogo,
          width: 95.w,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Get.theme.scaffoldBackgroundColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 36.w),
        child: Obx(
          () => Column(
            children: [
              SizedBox(
                height: 60.h,
              ),
              Text(
                controller.isEmail.value
                    ? LocalKeys.kEmailOtp.tr
                    : LocalKeys.kFillOTP.tr,
                style: Get.textTheme.headline1,
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 14.w),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: Get.textTheme.headline3!.copyWith(fontSize: 16.sp),
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            "${LocalKeys.kSentOTPTo.tr} ${controller.isEmail.value ? LocalKeys.kEmailAddress.tr : LocalKeys.kMobileNumber.tr} ",
                        style:
                            Get.textTheme.headline3!.copyWith(fontSize: 16.sp),
                      ),
                      TextSpan(
                        text: controller.phone,
                        style: Get.textTheme.headline3!
                            .copyWith(fontSize: 16.sp, color: blackColor),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 23.w),
                child: PinInputTextField(
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
              ),
              Padding(
                padding: EdgeInsets.only(top: 39.h, bottom: 19.h),
                child: CustomButton(
                  title: LocalKeys.kContinue.tr,
                  onPress: () async {
                    VerifyEmailModel? verifyOtp = await AuthApis()
                        .verifyOtpMobile(
                            controller.phone ?? '', controller.otp.text)
                        .then((value) async {
                      // Get.forceAppUpdate();
                      await Get.find<SharedPrefService>()
                          .saveToken(value?.accessToken ?? "");

                      value?.accessToken != null ||
                              value?.accessToken?.trim() != ""
                          ? Get.offAllNamed(Routes.HOME_PAGE)
                          : Get.snackbar(
                              LocalKeys.kError, value!.errors.toString());
                      return null;
                    });
                  },
                ),
              ),
              InkWell(
                onTap: () async {
                  ResendOtpModel? otpModel =
                      await AuthApis().resendOtpMobile(controller.phone ?? '');
                  if (otpModel.data != null) {
                    Get.snackbar("Resend Otp Code", otpModel.data?.msg ?? '');
                    Get.log('ccccccc0');
                  } else {
                    Get.log('ccccccc');
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    LocalKeys.kResendOTP.tr,
                    style: Get.textTheme.headline3,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EmailCodeDialog extends GetView<OtpVerificationController> {
  const EmailCodeDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      scrollable: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      content: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 45.h),
        child: Column(
          children: [
            SvgPicture.asset(
              Assets.kEmailEnvelopeIcon,
              width: 77.w,
              height: 84.h,
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.h, bottom: 11.h),
              child: Text(
                "Verify Email",
                style: Get.textTheme.headline1,
              ),
            ),
            Text(
              "You've just receive an email continuing verification code on Jackson@gmail.com ",
              style: Get.textTheme.bodyText2,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.h, bottom: 13.h),
              child: CustomButton(
                  title: "Resend Code",
                  onPress: () async {
                    ResendOtpModel? otpModel = await AuthApis()
                        .resendOtpMobile(controller.phone ?? '');
                    if (otpModel.data != null) {
                      Get.snackbar("Resend Otp Code", otpModel.data?.msg ?? '');
                    }
                  }),
            ),
            InkWell(
              onTap: () => Get.toNamed(Routes.CHANGE_EMAIL),
              child: Text(
                "Change E-Mail",
                style: Get.textTheme.bodyText1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
