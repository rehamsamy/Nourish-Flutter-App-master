import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/modules/payment_methods/views/widgets/or.dart';
import 'package:nourish_sa/app/modules/payment_methods/views/widgets/payment_method_item.dart';
import 'package:nourish_sa/app/shared/custom_button.dart';
import 'package:nourish_sa/routes/app_pages.dart';

import '../controllers/payment_methods_controller.dart';

class PaymentMethodsView extends GetView<PaymentMethodsController> {
  const PaymentMethodsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocalKeys.kPaymentMethod.tr),
        centerTitle: true,
        shadowColor: const Color(0xff000000).withOpacity(0.3),
      ),
      body: Padding(
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
                      Text("\$117", style: Get.textTheme.button)
                    ],
                  ),
                ),
              ),
              Text(
                LocalKeys.kSelectPaymentMethod.tr,
                style: Get.textTheme.headline1,
              ),
              ListView.builder(
                itemCount: 7,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return const PaymentMethodItem(
                    image: "",
                    name: "masterCard",
                    isSelected: false,
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 26.h),
                child: const OrDivider(),
              ),
              PaymentMethodItem(
                image: "",
                name: LocalKeys.kcashondelivery.tr,
                isSelected: true,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 46.h),
                child: CustomButton(
                  title: LocalKeys.kCheckout.tr,
                  onPress: () {
                    Get.offNamedUntil(
                        Routes.SUCCESS_ORDER, (route) => route.isFirst);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
