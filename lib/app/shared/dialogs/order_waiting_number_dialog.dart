import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/assets.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';

import '../../../app_theme.dart';
import '../custom_button.dart';

class OrderWaitingNumberDialog extends StatelessWidget {
  const OrderWaitingNumberDialog(
      {required this.packageName,
      required this.startDate,
      required this.packageType,
      Key? key})
      : super(key: key);
  final String packageName;
  final String startDate;
  final String packageType;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      scrollable: true,
      content: Container(
        width: 341.w,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(25),
        ),
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 19.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 19.h),
              child: SvgPicture.asset(
                Assets.kClockWaitingIcon,
                width: 114.w,
                height: 114.h,
              ),
            ),
            Text(
              LocalKeys.kOrderWaitingList.tr,
              style: Get.theme.textTheme.headline3,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h, bottom: 24.h),
              child: Text(
                packageName,
                style: Get.theme.textTheme.headline1,
              ),
            ),
            CustomButton(
              title:  LocalKeys.kSwitchToBranch.tr,
              onPress: () {},
            ),
            Padding(
              padding: EdgeInsets.only(top: 24.h, bottom: 18.h),
              child: SizedBox(
                width: Get.width,
                height: 2.h,
                child: OverflowBox(
                  maxWidth: 369.h,
                  minWidth: 369.h,
                  maxHeight: 2.h,
                  child: const Divider(
                    color: lightGreyColor,
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    packageName,
                    style: Get.theme.textTheme.headline3,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: Text(
                      startDate,
                      style: Get.theme.textTheme.bodyText2,
                    ),
                  ),
                  Text(
                    packageType,
                    style: Get.theme.textTheme.bodyText2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
