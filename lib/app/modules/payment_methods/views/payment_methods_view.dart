import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/data/models/add_order_model.dart';
import 'package:nourish_sa/app/data/models/payment_model.dart';
import 'package:nourish_sa/app/data/remote_data_sources/order_apis.dart';
import 'package:nourish_sa/app/data/remote_data_sources/payment_apis.dart';
import 'package:nourish_sa/app/modules/days_time/controllers/days_time_controller.dart';
import 'package:nourish_sa/app/modules/delivery_addresses/views/delivery_addresses_view.dart';
import 'package:nourish_sa/app/modules/package_details/controllers/package_details_controller.dart';
import 'package:nourish_sa/app/modules/package_details/views/package_details_view.dart';
import 'package:nourish_sa/app/modules/package_meals/controllers/package_meals_controller.dart';
import 'package:nourish_sa/app/modules/payment_methods/views/widgets/or.dart';
import 'package:nourish_sa/app/modules/payment_methods/views/widgets/payment_method_item.dart';
import 'package:nourish_sa/app/shared/custom_button.dart';
import 'package:nourish_sa/routes/app_pages.dart';

import '../../../data/models/package_detail_model.dart';
import '../../branch_select/controllers/branch_select_controller.dart';
import '../controllers/payment_methods_controller.dart';

class PaymentMethodsView extends GetView<PaymentMethodsController> {
  const PaymentMethodsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int? selectedPaymentId;
    return Scaffold(
      appBar: AppBar(
        title: Text(LocalKeys.kPaymentMethod.tr),
        centerTitle: true,
        shadowColor: const Color(0xff000000).withOpacity(0.3),
      ),
      body: GetBuilder<PaymentMethodsController>(
        builder: (_) => Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 27.w,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 24.h, bottom: 13.h),
                  child: Container(
                    width: 373.w,
                    height: 84.h,
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    color: const Color(0xff00707A),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(LocalKeys.kTotalPayment.tr,
                            style: Get.textTheme.button),
                        Text("${controller.total}", style: Get.textTheme.button)
                      ],
                    ),
                  ),
                ),
                Text(
                  LocalKeys.kSelectPaymentMethod.tr,
                  style: Get.textTheme.headline1,
                ),
                FutureBuilder(
                    future: controller.getPayments,
                    builder: (_, snapshot) {
                      if (snapshot.hasData) {
                        List<PaymentItem>? list =
                            snapshot.data as List<PaymentItem>;
                        if (list.isNotEmpty) {
                          return ListView.builder(
                            itemCount: list.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              selectedPaymentId = list[index].id;
                              if (list[index].name == "Cash") {
                                controller.cashOnDeliveryPayment = list[index];
                                controller.hasCashPayment = true;

                                return const SizedBox();
                              }
                              return InkWell(
                                onTap: () {
                                  controller.changeSelectedPaymentIndex(
                                      list[index].id ?? 0);
                                },
                                child: PaymentMethodItem(
                                  image: list[index].logo ??
                                      'https://ecommercenews.eu/wp-content/uploads/2013/06/most_common_payment_methods_in_europe.png',
                                  name: list[index].name ?? "masterCard",
                                  isSelected: controller.selectPaymentId ==
                                      list[index].id,
                                ),
                              );
                            },
                          );
                        } else {
                          return const SizedBox(
                            height: 200,
                            child: Center(
                              child: Text('no payment found'),
                            ),
                          );
                        }
                      } else {
                        return const SizedBox(
                          height: 200,
                        );
                      }
                    }),
                GetBuilder<PaymentMethodsController>(builder: ((controller) {
                  return controller.hasCashPayment
                      ? Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 26.h),
                              child: const OrDivider(),
                            ),
                            InkWell(
                              onTap: () {
                                controller.changeSelectedPaymentIndex(
                                    controller.cashOnDeliveryPayment?.id ?? 0);
                              },
                              child: PaymentMethodItem(
                                image: controller.cashOnDeliveryPayment?.logo ??
                                    "",
                                name: controller.cashOnDeliveryPayment?.name ??
                                    LocalKeys.kcashondelivery.tr,
                                isSelected: controller.selectPaymentId ==
                                    controller.cashOnDeliveryPayment?.id,
                              ),
                            ),
                          ],
                        )
                      : SizedBox();
                })),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 46.h),
                  child: CustomButton(
                    title: LocalKeys.kCheckout.tr,
                    onPress: () async {
                      AddOrderModel? orderModel = await OrderApis().addOrder(
                        delivery_type:
                            PackageDetailsController.selectedPlanType,
                        package_id:
                            PackageDetailsView.packageDetailModel?.data?.id ??
                                0,
                        address_id:
                            DeliveryAddressesView.selectedAddressId ?? 0,
                        payment_id: selectedPaymentId ?? 0,
                        branch_id: BranchSelectController.branchId,
                        start_date: DaysTimeController.startDate ?? '',
                        period_id:
                            DaysTimeController.selectedBranchPeriodId ?? 1,
                        selectedDays: PackageMealsController.selectedDays,
                      );
                      if (orderModel?.data == null) {
                        Get.offNamedUntil(
                            Routes.SUCCESS_ORDER, (route) => route.isFirst,
                            arguments: {
                              'addOrderModel': orderModel ?? AddOrderModel(),
                              'packageDetailModel':
                                  PackageDetailsView.packageDetailModel ??
                                      PackageDetailModel(),
                              'selectedPlanType':
                                  PackageDetailsController.selectedPlanType,
                              'startDate': DaysTimeController.startDate,
                            });
                      } else {}
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
