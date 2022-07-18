import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/data/models/change_order_period_model.dart';
import 'package:nourish_sa/app/data/remote_data_sources/order_apis.dart';
import 'package:nourish_sa/app/modules/subscription_details/views/widgets/subscription_bordered_container.dart';
import 'package:nourish_sa/app/shared/custom_button.dart';

import '../../../../app_theme.dart';
import '../controllers/delivery_time_controller.dart';

class DeliveryTimeView extends GetView<DeliveryTimeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocalKeys.kDeliverytime.tr),
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
                  LocalKeys.kDeliverytime.tr,
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
                    controller.workTime?[0].period ?? "7 am to 11 am",
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
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.workTime?.length,
                    itemBuilder: (_, index) {
                      return Column(
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
                                controller.workTime?[index].period ??
                                    'ffffffff',
                                style: Get.textTheme.headline3!
                                    .copyWith(color: blackColor),
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
                        ],
                      );
                    })),
            const Spacer(),
            CustomButton(
              title: LocalKeys.kContinue.tr,
              onPress: () async {
                ChangeOrderPeriodModel? periodModel = await OrderApis()
                        .changeOrderPeriod(
                            controller.orderId, controller.periodId)
                    as ChangeOrderPeriodModel;
                if (periodModel.data != null) {
                  Get.snackbar(
                      "Change Order Period", periodModel.data?.msg ?? '');
                  // Get.back();
                } else {
                  Get.snackbar('Change Order Period', 'error => plz try again');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
