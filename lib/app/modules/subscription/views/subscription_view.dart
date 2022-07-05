import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/data/models/subscription_detail_model.dart';
import 'package:nourish_sa/app/data/models/subscription_model.dart';
import 'package:nourish_sa/app/data/remote_data_sources/sbscription_apis.dart';
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
        title: Text(LocalKeys.kMySubscription.tr),
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
                      Get.log('subb  index  ==> ');
                    },
                  ),
                ),
                Expanded(
                  child: FutureBuilder(
                      future: SubscriptionApis().getSubscriptionAccordingType(
                          controller.selected == 0
                              ? 'myCurrentSubscriptions'
                              : 'myPreviousSubscriptions'),
                      builder: (_, snap) {
                        if (snap.hasData) {
                          List<SubscriptionItem>? list =
                              snap.data as List<SubscriptionItem>;
                          if (list.isNotEmpty) {
                            return ListView.builder(
                              itemCount: list.length,
                              padding: EdgeInsets.only(bottom: 35.h),
                              itemBuilder: (context, index) {
                                return controller.selected.value == 0
                                    ? InkWell(
                                        onTap: () async {
                                          SubscriptionDetailModel detailModel =
                                              await SubscriptionApis()
                                                  .subscriptionDetails(
                                                      subscripId:
                                                          list[index].id).catchError((err)=>print('errrrrrr '+err));
                                          if (detailModel.data != null) {
                                            Get.toNamed(
                                                Routes.SUBSCRIPTION_DETAILS,
                                                arguments: {
                                                  'detailModel': detailModel,
                                                  'subscripId': list[index].id
                                                });
                                          } else {
                                            null;
                                          }
                                        },
                                        child: PackageInfoCard(
                                          image: list[index].package?.image ??
                                              'https://thumbs.dreamstime.com/z/brown-packages-13927988.jpg',
                                          options: const ["sdads", "saddsa"],
                                          title:
                                              list[index].package?.name ?? '',
                                          priceWithVat: list[index]
                                                  .package
                                                  ?.priceWithTax
                                                  .toString() ??
                                              '',
                                        ),
                                      )
                                    : InkWell(
                                        onTap: () {
                                          Get.dialog(
                                            PackageInfoDialog(
                                              days: list[index]
                                                  .package
                                                  ?.daysNumberOfWeek as String,
                                              endDate: "12/12/2020",
                                              image: list[index]
                                                      .package
                                                      ?.image ??
                                                  'https://thumbs.dreamstime.com/z/brown-packages-13927988.jpg',
                                              options: const [
                                                "dsasad",
                                                "asdas",
                                                "saddsa"
                                              ],
                                              packageName:
                                                  list[index].packageName ?? '',
                                              packageType: list[index]
                                                      .package
                                                      ?.descriptions?[index]
                                                      .desc ??
                                                  'diet',
                                              paymentMethod: "Cash",
                                              price: list[index]
                                                      .package
                                                      ?.priceWithTax
                                                      ?.toString() ??
                                                  '',
                                              subTitle:
                                                  list[index].branchName ?? '',
                                            ),
                                          );
                                        },
                                        child: SupscriptionCard(
                                          image: "",
                                          days: list[index]
                                                  .package
                                                  ?.daysNumberOfWeek
                                                  .toString() ??
                                              '',
                                          title: list[index].packageName ?? '',
                                          price: list[index]
                                                  .package
                                                  ?.priceWithTax
                                                  .toString() ??
                                              '',
                                          endDate: "15/2/2022",
                                        ),
                                      );
                              },
                            );
                          } else {
                            return const SizedBox(
                              height: 300,
                              child: Center(
                                child: Text('empty subscription'),
                              ),
                            );
                          }
                        } else {
                          return const SizedBox(
                            height: 300,
                          );
                        }
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
