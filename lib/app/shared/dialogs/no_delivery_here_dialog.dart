import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/assets.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/shared/custom_button.dart';
import 'package:nourish_sa/app/shared/custom_outlined_button.dart';
import 'package:nourish_sa/app/shared/dialogs/order_waiting_number_dialog.dart';

class NoDeliveryHereBottomSheet extends StatelessWidget {
  const NoDeliveryHereBottomSheet(
      {Key? key,
      required this.packageName,
      required this.startDate,
      required this.packageType,
      required this.onBranchPress,
      r})
      : super(key: key);
  final String packageName;
  final String startDate;
  final String packageType;
  final Function onBranchPress;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 301.h,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
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
              title: LocalKeys.kReceiptFromTheBranch.tr,
              onPress: onBranchPress),
          SizedBox(
            height: 18.h,
          ),
          CustomOutlinedButton(
              title: LocalKeys.kAddToWaitingList.tr,
              onPress: () {
                Get.dialog(OrderWaitingNumberDialog(
                  packageName: packageName,
                  startDate: startDate,
                  packageType: packageType,
                  onBranchPress: onBranchPress,
                ));
              }),
        ],
      ),
    );
  }
}
