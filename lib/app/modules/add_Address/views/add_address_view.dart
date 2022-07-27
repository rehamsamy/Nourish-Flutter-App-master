import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nourish_sa/app/core/values/assets.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/data/models/add_address_model.dart';
import 'package:nourish_sa/app/data/remote_data_sources/address_apis.dart';
import 'package:nourish_sa/app/shared/custom_button.dart';
import 'package:nourish_sa/app/shared/custom_input.dart';
import 'package:nourish_sa/app/shared/map_edit_location.dart';
import 'package:nourish_sa/app_theme.dart';
import '../controllers/add_address_controller.dart';

class AddAddressView extends GetView<AddAddressController> {
  const AddAddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocalKeys.kAddAddess.tr,
          style: Get.textTheme.bodyText1,
        ),
        centerTitle: true,
        shadowColor: const Color(0xff000000).withOpacity(0.3),
        leading: const Icon(Icons.arrow_back),
      ),
      body: SingleChildScrollView(
        child: GetBuilder<AddAddressController>(
          builder: (_) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 29.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MapEditLocationPin(),
                CustomInput(
                  hint: controller.address?.name ?? "Riyadh Province , Riyadh",
                  title: LocalKeys.kAddressName.tr,
                  textEditingController: controller.addressName,
                ),
                Text(
                  LocalKeys.kAddressType.tr,
                  style: Theme.of(context).textTheme.headline3,
                ),
                SizedBox(
                  height: 12.h,
                ),
                GetBuilder<AddAddressController>(
                  builder: (controller) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          controller.addressType = "home";
                          controller.update();
                        },
                        child: Container(
                          width: 176.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(
                                  color: controller.addressType == "home"
                                      ? primaryColor
                                      : greyColor,
                                  width: controller.addressType == "home"
                                      ? 2.r
                                      : 1.r)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                Assets.kHouseIcon,
                                width: 24.w,
                                height: 21.h,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                LocalKeys.kHome.tr,
                                style: Theme.of(context).textTheme.headline3,
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.addressType = "office";
                          controller.update();
                        },
                        child: Container(
                          width: 176.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(
                                  color: controller.addressType == "office"
                                      ? primaryColor
                                      : greyColor,
                                  width: controller.addressType == "office"
                                      ? 2.r
                                      : 1.r)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                Assets.kSkyscraperIcon,
                                width: 24.w,
                                height: 21.h,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                LocalKeys.kOffice.tr,
                                style: Theme.of(context).textTheme.headline3,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 17.h,
                ),
                CustomInput(
                  hint: controller.address?.area ?? "Riyadh Province , Riyadh",
                  title: LocalKeys.kArea.tr,
                  textEditingController: controller.area,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomInput(
                      hint: controller.address?.building ?? "Al Madarah",
                      title: LocalKeys.kBuilding.tr,
                      width: 176.w,
                      textEditingController: controller.building,
                    ),
                    CustomInput(
                      hint: controller.address?.flat ?? "Flat",
                      title: LocalKeys.kFlat.tr,
                      width: 176.w,
                      textEditingController: controller.flat,
                      secondTitle: LocalKeys.kOptional.tr,
                    ),
                  ],
                ),
                CustomInput(
                  hint:
                      controller.address?.street ?? "Riyadh Province , Riyadh",
                  title: LocalKeys.kStreet.tr,
                  textEditingController: controller.street,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomInput(
                      hint: controller.address?.postalCode ?? "Al Madarah",
                      title: LocalKeys.kPostalCode.tr,
                      width: 176.w,
                      textEditingController: controller.postalCode,
                    ),
                    CustomInput(
                      hint: controller.address?.postalCode ?? "26256",
                      title: LocalKeys.kAdditionalNumber.tr,
                      width: 176.w,
                      textEditingController: controller.additionalNumber,
                    ),
                  ],
                ),
                CustomInput(
                  hint: controller.address?.deliveryInstructions ??
                      "Riyadh Province , Riyadh",
                  title: LocalKeys.kDeliveryInstructions.tr,
                  textEditingController: controller.deliveryInstructions,
                  secondTitle: LocalKeys.kOptional,
                ),
                SizedBox(
                  height: 36.h,
                ),
                CustomButton(
                  title: LocalKeys.kSave.tr,
                  onPress: () async {
                    AddAddressModel? addressModel = await AddressApis()
                        .addAddress(
                            lat: controller.location?.latitude ?? 0.0,
                            lng: controller.location?.longitude ?? 0.0,
                            name: controller.address?.name ??
                                controller.addressName.text,
                            address_type: controller.addressType,
                            area: controller.area.text,
                            building: controller.building.text,
                            flat: controller.flat.text,
                            street: controller.street.text,
                            postal_code: controller.postalCode.text,
                            additional_number: int.parse(
                                controller.address?.additionalNumber ?? '10'),
                            delivery_instructions:
                                controller.address?.deliveryInstructions ??
                                    'stresst');
                    String mes = addressModel?.data?.msg ?? '';
                    if (addressModel?.data != null) {
                      Get.back();
                      Get.snackbar(' Add Your Address', mes);
                    } else {
                      Get.log('messss    2 ' +
                          (addressModel?.data?.toString()).toString());
                      Get.snackbar('error', 'Plz Try again =>');
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
