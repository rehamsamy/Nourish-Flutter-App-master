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
    Get.log(
        'Vvvvv   ${controller.detailModel.data?.meals?.saturday?[0].toString() ?? ''}');
    bool status = controller.detailModel.data?.order?.activeStatus ?? true;
    getDeliveryTime(
        controller.detailModel.data?.order?.branch?.deliveryPeriods?[0].period);
    String statusType;
    if (status == true) {
      statusType = LocalKeys.kActive.tr;
    } else {
      statusType = 'Pause';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(LocalKeys.kMySubscription.tr),
        centerTitle: true,
        shadowColor: const Color(0xff000000).withOpacity(0.3),
      ),
      body: GetBuilder<SubscriptionDetailsController>(
        builder: (_)=> SizedBox(
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
                              controller.detailModel.data?.order?.package?.name
                                      .toString() ??
                                  '',
                              style: Get.textTheme.headline1!
                                  .copyWith(color: whiteColor),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 4.h, bottom: 9.h),
                              child: Text(
                                "${LocalKeys.kEndedAt.tr}: ${controller.detailModel.data?.order?.endDate ?? ''}",
                                style: Get.textTheme.headline3!
                                    .copyWith(color: whiteColor),
                              ),
                            ),
                            Text(
                              "${controller.detailModel.data?.order?.package?.priceWithTax.toString() ?? ''} RS",
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
                          onTap: () => Get.toNamed(Routes.DELIVERY_ADDRESSES,
                              arguments: {
                                'branchData',
                                controller.detailModel.data?.order?.branch
                              }),
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
                            '${controller.remainingDays} days',
                            style: Get.textTheme.caption,
                          ),
                        ),
                        // SubscriptionDetailsItem(
                        //   title: LocalKeys.kRemainingDays.tr,
                        //   valueWidget: Text(
                        //     '14 days',
                        //     style: Get.textTheme.caption,
                        //   ),
                        // ),
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
                          onTap: () => Get.toNamed(Routes.SUBSCRIPTION_STATUS,
                              arguments: args),
                          valueWidget: Row(
                            children: [
                              Text(statusType, style: Get.textTheme.caption),
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
                          onTap: () => Get.toNamed(Routes.DELIVERY_ADDRESSES),
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
                          onTap: () {
                            Get.toNamed(Routes.DELIVERY_TIME, arguments: {
                              'deliveryPeriods': controller.detailModel.data
                                  ?.order?.branch?.deliveryPeriods,
                              'periodId':
                                  controller.detailModel.data?.order?.periodId,
                              'orderId': controller.detailModel.data?.order?.id,
                            });
                          },
                          valueWidget: Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child: Text(
                                  controller.detailModel.data?.order?.branch
                                          ?.workTimes?[0].dataEn??
                                      '7 am to 11 am',
                                  style: Get.textTheme.caption,
                                ),
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
                      onTap: () => Get.toNamed(Routes.CART, arguments: {
                        'isSubscribtion': false,
                        'detailModel': controller.detailModel
                      }),
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
      ),
    );
  }

  void getDeliveryTime(String? period) {
    //  "period": "7 morning - 4 evening",
    String? amPeriod = period?.replaceRange(2, 7, 'am');
    String? pmPeriod = period?.replaceRange(2, 7, 'am');
  }



}
