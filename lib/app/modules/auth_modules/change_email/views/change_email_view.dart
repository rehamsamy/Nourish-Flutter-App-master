import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/assets.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/shared/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nourish_sa/app/shared/custom_input.dart';
import 'package:nourish_sa/routes/app_pages.dart';
import '../controllers/change_email_controller.dart';

class ChangeEmailView extends GetView<ChangeEmailController> {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              LocalKeys.kChangeYourEmail.tr,
              style: Get.textTheme.headline1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 44.h),
              child: CustomInput(
                hint: LocalKeys.kEmail.tr,
                textEditingController: controller.email,
                title: LocalKeys.kEmail.tr,
                suffixIcon: Assets.kEmailIcon,
                validator: (value) {
                  if (value != null && value.trim().isEmpty) {
                    return LocalKeys.kRequiredField.tr;
                  } else if (value != null &&
                      !value.contains('@') &&
                      value.endsWith(".com")) {
                    return LocalKeys.kEmailInvalid.tr;
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 39.h, bottom: 19.h),
              child: CustomButton(
                title: LocalKeys.kSave.tr,
                onPress: () {
                  Get.offAllNamed(Routes.HOME_PAGE);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
