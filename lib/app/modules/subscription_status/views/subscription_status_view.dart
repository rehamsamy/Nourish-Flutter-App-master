import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/modules/subscription_details/views/widgets/pasue_subscription_dialog.dart';
import 'package:nourish_sa/app/modules/subscription_details/views/widgets/subscription_bordered_container.dart';
import 'package:nourish_sa/app/shared/custom_button.dart';
import 'package:nourish_sa/app_theme.dart';

import '../controllers/subscription_status_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubscriptionStatusView extends GetView<SubscriptionStatusController> {
  const SubscriptionStatusView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map args = Get.arguments ?? {};
    int subscripId=args['subscripId'];
    return Scaffold(
      appBar: AppBar(
        title: Text(LocalKeys.kSubscriptionStatus.tr),
        centerTitle: true,
        shadowColor: const Color(0xff000000).withOpacity(0.3),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 27.w, vertical: 30.h),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  LocalKeys.kSubscriptionStatus.tr,
                  style: Get.textTheme.headline1,
                ),
                SizedBox(
                  width: 16.w,
                ),
                Container(
                  height: 25.h,
                  color: primaryColor,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Text(
                    LocalKeys.kActive.tr + LocalKeys.kSubscription.tr,
                    style: Get.textTheme.caption!.copyWith(
                      color: whiteColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            SubscriptionBorderedContainer(
                child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 16.w,
                      height: 16.h,
                      padding: EdgeInsets.all(2.w),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: primaryColor,
                          )),
                      child: const CircleAvatar(
                        backgroundColor: primaryColor,
                      ),
                    ),
                    SizedBox(
                      width: 11.w,
                    ),
                    Text(
                      LocalKeys.kActive.tr + LocalKeys.kSubscription.tr,
                      style:
                          Get.textTheme.headline3!.copyWith(color: blackColor),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 7.5.h,
                  ),
                  child: const Divider(
                    color: lightGreyColor,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.dialog(const PauseSubscriptionDialog(),arguments: args);
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 16.w,
                        height: 16.h,
                        padding: EdgeInsets.all(2.w),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: primaryColor,
                            )),
                        child: const CircleAvatar(
                          backgroundColor: whiteColor,
                        ),
                      ),
                      SizedBox(
                        width: 11.w,
                      ),
                      Text(
                        LocalKeys.kPauseSubscription.tr,
                        style: Get.textTheme.headline3!
                            .copyWith(color: blackColor),
                      ),
                    ],
                  ),
                ),
              ],
            )),
            const Spacer(),
            CustomButton(
              title: LocalKeys.kSave.tr,
              onPress: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
