import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/assets.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/data/models/package_detail_model.dart';
import 'package:nourish_sa/app/shared/custom_button.dart';
import 'package:nourish_sa/app/shared/custom_network_image.dart';
import 'package:nourish_sa/app/shared/dialogs/enable_location_dialog.dart';
import 'package:nourish_sa/app/shared/package_caleroies_details..dart';
import 'package:nourish_sa/app/shared/selection_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../controllers/package_details_controller.dart';

class PackageDetailsView extends GetView<PackageDetailsController> {
 static PackageDetailModel? packageDetailModel;
  @override
  Widget build(BuildContext context) {
    packageDetailModel=controller.packageDetailModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocalKeys.kPackageDetails.tr,
          style: Get.textTheme.bodyText1,
        ),
        centerTitle: true,
        shadowColor: const Color(0xff000000).withOpacity(0.3),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 42.h, horizontal: 35.w),
        child: Column(
          children: [
            CustomNetworkImage(
              imageUrl: controller.packageDetailModel?.data?.image??'https://wallpaperaccess.com/full/3758411.jpg',
              height: 180.h,
              width: 180.w,
              radius: 4.r,
            ),
            Padding(
              padding: EdgeInsets.only(top: 11.h, bottom: 18.h),
              child:  Text(controller.packageDetailModel?.data?.name??"American Package"),
            ),
            PackageCaleroiesDetails(),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                LocalKeys.kPlanType.tr,
                style: Get.textTheme.headline3,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.h, bottom: 14.h),
              child: SelectionCard(
                image: Assets.kRestaurantIcon,
                isSelected: true,
                onTap: () {},
                title: LocalKeys.kFromBranch.tr,
              ),
            ),
            SelectionCard(
              image: Assets.kDeliveryCarFood,
              isSelected: false,
              onTap: () {},
              title: LocalKeys.kDelivery.tr,
            ),
            const Spacer(),
            CustomButton(
              title: LocalKeys.kContinue.tr,
              onPress: () {
                Get.dialog(const EnableLocationDialog());
              },
            ),
          ],
        ),
      ),
    );
  }
}
