import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nourish_sa/app/core/values/assets.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/data/models/address_model.dart';
import 'package:nourish_sa/app/data/remote_data_sources/address_apis.dart';
import 'package:nourish_sa/app/shared/custom_button.dart';
import 'package:nourish_sa/app/shared/selection_check_box.dart';
import 'package:nourish_sa/app_theme.dart';
import 'package:nourish_sa/routes/app_pages.dart';
import '../controllers/delivery_addresses_controller.dart';

class DeliveryAddressesView extends GetView<DeliveryAddressesController> {
  const DeliveryAddressesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 27.w),
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: Get.width,
                  height: 214.h,
                  child: Image.asset(
                    Assets.kAddressBg,
                  ),
                ),
                PositionedDirectional(
                  top: 50.h,
                  // start: 25.w,
                  child: InkWell(
                    onTap: () => Get.back(),
                    child: const Icon(
                      Icons.arrow_back_outlined,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 66.h,
                bottom: 46.h,
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    Assets.kDeliveryBox,
                    width: 29.w,
                    height: 28.h,
                    color: primaryColor,
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Text(
                    LocalKeys.kDelivery.tr,
                    style:
                        Get.textTheme.headline1!.copyWith(color: primaryColor),
                  )
                ],
              ),
            ),
            GetBuilder<DeliveryAddressesController>(
              builder: (_) => SizedBox(
                height: 400.h,
                child: FutureBuilder(
                    future: AddressApis().getAddress(),
                    builder: (_, snap) {
                      if (snap.hasData) {
                        List<AddressItem>? list =
                            snap.data as List<AddressItem>;
                        Get.log('xxx  '+snap.data.toString());
                        if (list.isNotEmpty) {
                          return ListView.builder(
                              itemCount: list.length,
                              itemBuilder: (_, index) {
                                return Column(
                                  children: [
                                    SelectionCheckBox(
                                      title: list[index].name ?? "Title",
                                      isSelected:
                                          controller.isChecked?[index] ?? false,
                                      onTap: (val) {
                                        controller.changeCheckBoxSelected(
                                            val ?? false, index);
                                        //Get.offNamed(Routes.ADD_ADDRESS,arguments: {'addressModel':list[index]});
                                      },
                                    ),
                                    SizedBox(
                                      height: 21.h,
                                    ),
                                  ],
                                );
                              });
                        } else {
                          return const SizedBox(
                            height: 200,
                            child: Center(
                              child: Text('no address found'),
                            ),
                          );
                        }
                      }else{
                        Timer.run(() =>
                            Get.snackbar('error ', 'error => no data found'));
                        return const SizedBox(
                          height: 200,
                        );
                      }
                    }),
              ),
            ),
            //  ListView.builder(itemBuilder: (_,index))

            // SelectionCheckBox(
            //   title: "Title",
            //   isSelected: true,
            //   onTap: (fsafsa) {},
            // ),
            // SizedBox(
            //   height: 21.h,
            // ),
            // SelectionCheckBox(
            //   title: "Title",
            //   isSelected: false,
            //   onTap: (fsafsa) {},
            // ),
            // SizedBox(
            //   height: 21.h,
            // ),
            // SelectionCheckBox(
            //   title: "Title",
            //   isSelected: false,
            //   onTap: (fsafsa) {},
            // ),
            InkWell(
              onTap: () => Get.offNamed(Routes.ADD_ADDRESS),
              child: Padding(
                padding: EdgeInsetsDirectional.only(top: 12.h),
                child: Row(
                  children: [
                    Text(
                      LocalKeys.kAddnewaddress.tr,
                      style: Get.textTheme.headline2!
                          .copyWith(color: primaryColor),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    CircleAvatar(
                      backgroundColor: primaryColor,
                      maxRadius: 10.r,
                      child: Icon(
                        Icons.add,
                        size: 15.r,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 42.h),
              child: CustomButton(
                  title: LocalKeys.kContinue.tr,
                  onPress: () {
                    Get.toNamed(Routes.DAYS_TIME,);
                    // Get.bottomSheet(const NoDeliveryHereBottomSheet());
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
