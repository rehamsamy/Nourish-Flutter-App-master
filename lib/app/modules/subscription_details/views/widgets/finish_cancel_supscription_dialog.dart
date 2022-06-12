import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/shared/custom_button.dart';
import 'package:nourish_sa/app/shared/custom_network_image.dart';
import 'package:nourish_sa/routes/app_pages.dart';

import '../../../../../app_theme.dart';

class FinishCancelSubscriptionDialog extends StatelessWidget {
  const FinishCancelSubscriptionDialog({
    required this.image,
    required this.title,
    required this.desc,
    required this.deliveredDays,
    required this.remainingDays,
    required this.refund,
    Key? key,
  }) : super(key: key);
  final String image;
  final String desc;
  final String title;
  final String deliveredDays;
  final String remainingDays;
  final String refund;

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
          borderRadius: BorderRadius.circular(50),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 23.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomNetworkImage(
              imageUrl: image,
              height: 135.h,
              width: 331.w,
              radius: 15.r,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.h, bottom: 7.h),
              child: Text(
                title,
                style: Get.textTheme.headline1,
              ),
            ),
            Text(
              desc,
              style: Get.textTheme.headline3!,
            ),
            SizedBox(
              height: 21.h,
            ),
            Text(
              LocalKeys.kcurrentlyunsubscribed.tr,
              textAlign: TextAlign.center,
              style: Get.textTheme.headline3!.copyWith(
                fontSize: 14.sp,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              width: 335.w,
              margin: EdgeInsets.only(top: 10.h, bottom: 27.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: greyColor),
              ),
              padding: EdgeInsets.all(20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        LocalKeys.kDeliveredDays.tr,
                        style: Get.textTheme.headline3!.copyWith(
                          color: blackColor,
                        ),
                      ),
                      Text(
                        deliveredDays,
                        style: Get.textTheme.headline3!.copyWith(
                          fontSize: 14.sp,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 26.h, bottom: 16.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          LocalKeys.kRemainingDays.tr,
                          style: Get.textTheme.headline3!.copyWith(
                            color: blackColor,
                          ),
                        ),
                        Text(
                          remainingDays,
                          style: Get.textTheme.headline3!.copyWith(
                            fontSize: 14.sp,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                    child: const Divider(
                      color: lightGreyColor,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 13.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          LocalKeys.kRefund.tr,
                          style: Get.textTheme.headline3!.copyWith(
                            color: blackColor,
                          ),
                        ),
                        Text(
                          refund,
                          style: Get.textTheme.caption!.copyWith(
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                    child: const Divider(
                      color: lightGreyColor,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 13.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          LocalKeys.kReturnPaymentMethod.tr,
                          style: Get.textTheme.headline3!.copyWith(
                            color: blackColor,
                          ),
                        ),
                        Text(
                          "Cash",
                          style: Get.textTheme.caption!.copyWith(
                            color: primaryColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            CustomButton(
              title: LocalKeys.kBackHome.tr,
              onPress: () {
                Get.until((route) => Get.currentRoute == Routes.HOME_PAGE);
              },
            )
          ],
        ),
      ),
    );
  }
}
