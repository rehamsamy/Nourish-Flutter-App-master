import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/modules/packages/views/package_info_card.dart';
import 'package:nourish_sa/app/shared/tab_bar_selector.dart';
import 'package:nourish_sa/routes/app_pages.dart';
import '../controllers/subscription_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/package_info_dialog.dart';
import 'widgets/supscription_card.dart';

class SubscriptionView extends GetView<SubscriptionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(LocalKeys.kMySubscription.tr),
        centerTitle: true,
        shadowColor: const Color(0xff000000).withOpacity(0.3),
      ),
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 27.w),
          child: Obx(
            () => Column(
              children: [
                SizedBox(
                  height: 35.h,
                ),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    LocalKeys.kMySubscription.tr,
                    style: Get.textTheme.headline1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: TabBarSelector(
                    firstTitle: LocalKeys.kCurrent.tr,
                    secondTitle: LocalKeys.kPrevious.tr,
                    withPadding: false,
                    selected: controller.selected.value,
                    onTap: (value) {
                      controller.selected.value = value;
                    },
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 7,
                    padding: EdgeInsets.only(bottom: 35.h),
                    itemBuilder: (context, index) {
                      return controller.selected.value == 0
                          ? InkWell(
                              onTap: () {
                                Get.toNamed(Routes.SUBSCRIPTION_DETAILS);
                              },
                              child: const PackageInfoCard(
                                image: "",
                                options: ["sdads", "saddsa"],
                                title: "title",
                                priceWithVat: "150",
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                Get.dialog(
                                  const PackageInfoDialog(
                                    days: "7 Days",
                                    endDate: "12/12/2020",
                                    image: "",
                                    options: ["dsasad", "asdas", "saddsa"],
                                    packageName: "Package Name",
                                    packageType: "Package Type",
                                    paymentMethod: "Cash",
                                    price: "220",
                                    subTitle: "Sub Title",
                                  ),
                                );
                              },
                              child: const SupscriptionCard(
                                image: "",
                                days: "7 Days",
                                title: "sadasd",
                                price: "205",
                                endDate: "15/2/2022",
                              ),
                            );
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
