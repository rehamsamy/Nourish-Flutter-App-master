import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/assets.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/shared/custom_button.dart';
import 'package:nourish_sa/app/shared/custom_outlined_button.dart';


class NoDeliveryHereBottomSheet extends StatelessWidget {
  const NoDeliveryHereBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 301.h,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 33.h),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                Assets.kLocationIcon,
                width: 17.w,
                height: 19.h,
              ),
              SizedBox(
                width: 14.w,
              ),
              Text(
                LocalKeys.kNoDeliverHere.tr,
                style: Get.textTheme.bodyText2!.copyWith(color: Colors.red),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.h, bottom: 26.h),
            child: Text(
              LocalKeys.kKnowMoreAboutSubscriptions.tr,
              style: Get.textTheme.headline3,
            ),
          ),
          CustomButton(
              title: LocalKeys.kReceiptFromTheBranch.tr, onPress: () {}),
          SizedBox(
            height: 18.h,
          ),
          CustomOutlinedButton(
              title: LocalKeys.kAddToWaitingList.tr, onPress: () {}),
        ],
      ),
    );
  }
}
