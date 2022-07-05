import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import '../../../../app_theme.dart';
import '../../../../routes/app_pages.dart';
import '../../../shared/custom_button.dart';
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
          child: FutureBuilder(
              future: controller.getLocation(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 31.h,
                      ),
                      Text(
                        LocalKeys.kMealReceive.tr,
                        style:
                            Get.textTheme.bodyText1!.copyWith(fontSize: 16.sp),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.h, bottom: 38.h),
                        child: GoogleMap(
                          onMapCreated: controller.onMapCreated,
                          initialCameraPosition: CameraPosition(
                            target: controller.center,
                            zoom: 15,
                          ),
                          markers: <Marker>{controller.markers},
                        ),
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
                            onPress: () async {}),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: InkWell(
                          onTap: () {
                            Get.offAllNamed(Routes.LOGIN);
                          },
                          child: Text(
                            LocalKeys.kSkip.tr,
                            style: Get.textTheme.bodyText1!
                                .copyWith(color: blackColor),
                          ),
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      LocalKeys.kLocationAccessError.tr,
                      style: Get.textTheme.bodyText1!,
                    ),
                  );
                } else {
                  return const Center(
                    child: CupertinoActivityIndicator(),
                  );
                }
              }),
        ),
      ),
    );
  }
}
