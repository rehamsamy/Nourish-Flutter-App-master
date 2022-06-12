import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/shared/custom_button.dart';
import 'package:nourish_sa/app_theme.dart';
import 'package:nourish_sa/app/core/values/assets.dart';
import 'package:nourish_sa/routes/app_pages.dart';

class EnableLocationDialog extends StatelessWidget {
  const EnableLocationDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      scrollable: true,
      contentPadding: EdgeInsets.zero,
      content: Container(
        width: 341.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 25.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 20.h,
            ),
            SvgPicture.asset(
              Assets.kLocationIcon,
              width: 117.w,
              height: 150.h,
            ),
            Padding(
              padding: EdgeInsets.only(top: 28.h, bottom: 11.h),
              child: Text(
                LocalKeys.kLocation.tr,
                style: Get.textTheme.headline1,
              ),
            ),
            Text(
              LocalKeys.kEnablePinyourLocation.tr,
              style: Get.textTheme.bodyText2!.copyWith(
                color: blueGreyColor,
              ),
            ),
            SizedBox(
              height: 48.h,
            ),
            CustomButton(
              title: LocalKeys.kEnable.tr,
              onPress: () {
                Get.back();
                Get.toNamed(Routes.DELIVERY_ADDRESSES);
              },
            ),
          ],
        ),
      ),
    );
  }
}
