import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/assets.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app_theme.dart';
import 'package:nourish_sa/routes/app_pages.dart';

import '../controllers/subscription_details_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/cancel_subscription_dialog.dart';
import 'widgets/renew_subscription_dialog.dart';
import 'widgets/subscription_bordered_container.dart';
import 'widgets/subscription_details_tem.dart';

class SubscriptionDetailsView extends GetView<SubscriptionDetailsController> {
  const SubscriptionDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     Map args = Get.arguments ?? {};
    int subscripId=args['subscripId'];
    return Scaffold(
      appBar: AppBar(
        title:  Text(LocalKeys.kMySubscription.tr),
        centerTitle: true,
        shadowColor: const Color(0xff000000).withOpacity(0.3),
      ),
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 27.w),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 30.h),
                  width: 374.w,
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Row(
                    children: [
                      // Image.network(controller.detailModel?.data?.order?.package?.image??''),
                      SvgPicture.asset(
                        Assets.kMeal,
                        width: 73.w,
                        height: 54.h,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.detailModel?.data?.order?.package?.name.toString()??'',
                            style: Get.textTheme.headline1!
                                .copyWith(color: whiteColor),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 4.h, bottom: 9.h),
                            child: Text(
                              "${LocalKeys.kEndedAt.tr}: 2/10/2022",
                              style: Get.textTheme.headline3!
                                  .copyWith(color: whiteColor),
                            ),
                          ),
                          Text(
                            "200.00 RS",
                            style: Get.textTheme.caption!.copyWith(
                              color: const Color(0xffF4EC64),
                            ),
                          ),
                        ],
                      ))
                    ],
                  ),
                ),
                SubscriptionBorderedContainer(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      SubscriptionDetailsItem(
                        title: LocalKeys.kPickupType.tr,
                        valueWidget: Row(
                          children: [
                            Text(
                              LocalKeys.kBranch.tr,
                              style: Get.textTheme.caption,
                            ),
                            SizedBox(
                              width: 7.w,
                            ),
                            Text(
                              LocalKeys.kViewMap.tr,
                              style: Get.textTheme.caption!.copyWith(
                                  decoration: TextDecoration.underline,
                                  color: const Color(0xff4676DA)),
                            ),
                          ],
                        ),
                      ),
                      SubscriptionDetailsItem(
                        title: LocalKeys.kRemainingDays.tr,
                        valueWidget: Text(
                          '14 days',
                          style: Get.textTheme.caption,
                        ),
                      ),
                      SubscriptionDetailsItem(
                        title: LocalKeys.kRemainingDays.tr,
                        valueWidget: Text(
                          '14 days',
                          style: Get.textTheme.caption,
                        ),
                      ),
                      SubscriptionDetailsItem(
                        title: LocalKeys.kRenew.tr,
                        valueWidget: Icon(
                          Icons.arrow_forward_ios,
                          size: 15.r,
                          color: lightGreyColor,
                        ),
                        onTap: () {
                          Get.dialog(const RenewSubscriptionDialog());
                        },
                      ),
                      SubscriptionDetailsItem(
                        title: LocalKeys.kSubscriptionStatus.tr,
                        isEnd: true,
                        onTap: () => Get.toNamed(Routes.SUBSCRIPTION_STATUS,arguments: args),
                        valueWidget: Row(
                          children: [
                            Text(
                              LocalKeys.kActive.tr,
                              style: Get.textTheme.caption,
                            ),
                            SizedBox(
                              width: 7.w,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 15.r,
                              color: lightGreyColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SubscriptionBorderedContainer(
                  child: Column(
                    children: [
                      SubscriptionDetailsItem(
                        title: LocalKeys.kChangeDeliveryLocation.tr,
                        valueWidget: Row(
                          children: [
                            Text(
                              LocalKeys.koffice.tr,
                              style: Get.textTheme.caption,
                            ),
                            SizedBox(
                              width: 7.w,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 15.r,
                              color: lightGreyColor,
                            ),
                          ],
                        ),
                      ),
                      SubscriptionDetailsItem(
                        title: LocalKeys.kChangeDeliveryTime.tr,
                        isEnd: true,
                        onTap: () => Get.toNamed(Routes.DELIVERY_TIME),
                        valueWidget: Row(
                          children: [
                            Text(
                              '7 am to 11 am',
                              style: Get.textTheme.caption,
                            ),
                            SizedBox(
                              width: 7.w,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 15.r,
                              color: lightGreyColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SubscriptionBorderedContainer(
                  child: SubscriptionDetailsItem(
                    title: LocalKeys.kMealsDetails.tr,
                    isEnd: true,
                    onTap: () => Get.toNamed(
                      Routes.CART,
                      arguments: true,
                    ),
                    valueWidget: Icon(
                      Icons.arrow_forward_ios,
                      size: 15.r,
                      color: lightGreyColor,
                    ),
                  ),
                ),
                SubscriptionBorderedContainer(
                  child: SubscriptionDetailsItem(
                    title: LocalKeys.kCancelSubscribtion.tr,
                    isEnd: true,
                    valueWidget: const SizedBox.shrink(),
                    onTap: () {
                      Get.dialog(const CancelSubscriptionDialog());
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
