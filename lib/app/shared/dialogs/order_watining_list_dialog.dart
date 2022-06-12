import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/shared/custom_button.dart';
import 'package:nourish_sa/app_theme.dart';
import 'package:nourish_sa/app/core/values/assets.dart';

class OrderWaitingListDialog extends StatelessWidget {
  const OrderWaitingListDialog({required this.packageName, Key? key})
      : super(key: key);
  final String packageName;
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
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 54.h),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 14.h),
              child: SvgPicture.asset(
                Assets.kSandSandwatchIcon,
                width: 89.w,
                height: 112.h,
              ),
            ),
            Text(
              LocalKeys.kOrderWaitingList.tr,
              style: Get.theme.textTheme.headline3,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h, bottom: 43.h),
              child: Text(
                packageName,
                style: Get.theme.textTheme.headline1,
              ),
            ),
            CustomButton(
              title: LocalKeys.kBackHome.tr,
              onPress: () {},
            ),
          ],
        ),
      ),
    );
  }
}
