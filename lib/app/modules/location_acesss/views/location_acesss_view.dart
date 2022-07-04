import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/shared/custom_button.dart';
import 'package:nourish_sa/app/shared/map_edit_location.dart';
import 'package:nourish_sa/app_theme.dart';
import 'package:nourish_sa/routes/app_pages.dart';
import '../../add_Address/controllers/add_address_controller.dart';
import '../controllers/location_acesss_controller.dart';

class LocationAcesssView extends GetView<LocationAcesssController> {
  LocationAcesssView({Key? key}) : super(key: key);

  AddAddressController Controller = Get.put(AddAddressController());
  @override
  Widget build(BuildContext context) {
    Get.log('Page =>  address');
    return Scaffold(
      appBar: AppBar(
        title: Text(LocalKeys.kAddAddess.tr),
        centerTitle: true,
        shadowColor: const Color(0xff000000).withOpacity(0.3),
      ),
      body: SizedBox(
        width: context.width,
        height: context.height,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 35.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 31.h,
              ),
              Text(
                LocalKeys.kMealReceive.tr,
                style: Get.textTheme.bodyText1!.copyWith(fontSize: 16.sp),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.h, bottom: 38.h),
                child: const MapEditLocationPin(),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  LocalKeys.kAllowLocation.tr,
                  style: Get.textTheme.bodyText1,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 120.h, bottom: 34.h),
                child: CustomButton(
                  title: LocalKeys.kAllowLocationAccess.tr,
                  onPress: () async {
                    // Get.offAllNamed(Routes.LOGIN);
                    var permission = await Geolocator.checkPermission();
                    permission == PermissionStatus.granted
                        ? Get.offNamed(Routes.ADD_ADDRESS)
                        : await Geolocator.requestPermission();
                  },
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    Get.offAllNamed(Routes.LOGIN);
                  },
                  child: Text(
                    LocalKeys.kSkip.tr,
                    style: Get.textTheme.bodyText1!.copyWith(color: blackColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
