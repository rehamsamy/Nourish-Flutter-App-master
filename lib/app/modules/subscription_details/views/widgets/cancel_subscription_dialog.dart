import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/shared/custom_button.dart';
import 'package:nourish_sa/app/core/values/assets.dart';

import '../../../../../app_theme.dart';
import 'finish_cancel_supscription_dialog.dart';

class CancelSubscriptionDialog extends StatelessWidget {
  const CancelSubscriptionDialog({Key? key}) : super(key: key);

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
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: 63.h,
            ),
            SvgPicture.asset(
              Assets.kCancelDocumentIcon,
              height: 113.h,
              width: 113.w,
            ),
            SizedBox(
              height: 38.h,
            ),
            Text(
              LocalKeys.kCancelSubscriptionDialog.tr,
              textAlign: TextAlign.center,
              style: Get.textTheme.bodyText1,
            ),
            SizedBox(
              height: 24.h,
            ),
            CustomButton(
              title: LocalKeys.kBack.tr,
              onPress: () {
                Get.back();
                Get.dialog(
                  const FinishCancelSubscriptionDialog(
                    deliveredDays: "14 days",
                    desc: "Weekly Package",
                    image: "",
                    refund: "200.00 RS",
                    remainingDays: "14 days",
                    title: "Zuppa Soup Package",
                  ),
                );
              },
            ),
            SizedBox(
              height: 17.h,
            ),
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Text(
                LocalKeys.kBack.tr,
                style: Get.textTheme.bodyText1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
