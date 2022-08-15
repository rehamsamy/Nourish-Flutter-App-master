import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/assets.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/shared/custom_button.dart';
import 'package:nourish_sa/app_theme.dart';
import 'package:nourish_sa/routes/app_pages.dart';

import '../controllers/success_order_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuccessOrderView extends GetView<SuccessOrderController> {
  const SuccessOrderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 27.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 129.h,
              ),
              SvgPicture.asset(
                Assets.kDone,
                width: 147.w,
                height: 147.h,
              ),
              Padding(
                padding: EdgeInsets.only(top: 29.h, bottom: 12.h),
                child: Text(
                  LocalKeys.kCongratulation.tr,
                  style: Get.textTheme.headline1,
                ),
              ),
              Text(
                LocalKeys.kSubscriptionSubmitted.tr,
                style: Get.textTheme.bodyText1!.copyWith(color: blueGreyColor),
              ),
              Container(
                width: 374.w,
                margin: EdgeInsets.only(top: 106.h, bottom: 38.h),
                padding: EdgeInsets.all(14.w),
                decoration: BoxDecoration(
                  color: moreLightGreyColor,
                  border: Border.all(color: lightGreyColor),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          LocalKeys.kPackageDetails.tr,
                          style: Get.textTheme.bodyText1!
                              .copyWith(color: primaryColor),
                        ),
                      ],
                    ),
                    Container(
                      width: Get.width,
                      height: 2.h,
                      margin: EdgeInsets.only(bottom: 19.h, top: 14.h),
                      child: OverflowBox(
                        maxWidth: 374.w,
                        minWidth: 374.w,
                        maxHeight: 2.h,
                        child: Container(
                          width: 374.w,
                          height: 1.h,
                          color: lightGreyColor,
                        ),
                      ),
                    ),
                    Text(
                      controller.packageDetailModel.data?.name ?? "",
                      style: Get.textTheme.bodyText1,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.h, bottom: 8.h),
                      child: Text(
                        "${LocalKeys.kStartDate.tr}: ${controller.startDate}",
                        style: Get.textTheme.bodyText1!.copyWith(
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    Text(
                      controller.selectedPlanType,
                      style: Get.textTheme.bodyText1!.copyWith(
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(
                      height: 21.h,
                    ),
                    Text(
                      LocalKeys.kNoteFollowMailReceiveReceipt.tr,
                      style: Get.textTheme.bodyText1!.copyWith(
                        fontSize: 17.sp,
                      ),
                    ),
                  ],
                ),
              ),
              CustomButton(
                title: LocalKeys.kBackHome.tr,
                onPress: () {
                  Get.offAllNamed(Routes.HOME_SCREEN);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
