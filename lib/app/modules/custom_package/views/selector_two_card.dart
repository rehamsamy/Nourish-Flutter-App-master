import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/modules/custom_package/controllers/custom_package_controller.dart';

import '../../../../app_theme.dart';

class SelectorTwoCard extends GetView<CustomPackageController> {
  const SelectorTwoCard(
      {required this.title, required this.secondTitle, Key? key})
      : super(key: key);
  final String title, secondTitle;
  @override
  Widget build(BuildContext context) {
    return
      Obx(
        ()=>
         Container(
          width: 276.w,
          height: 44.h,
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          decoration: BoxDecoration(
             color: moreLightGreyColor,
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(color: greyColor)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap:(){
                  controller.setFeetSelected(true);
                  controller.setCmSelected(false);
                  controller.setHeightType('feet');
                } ,
                child: Container(
                  width: 130.w,
                  height: 35.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                   // color:greyColor ,
                    color:  controller.isFeetSelected.value?primaryColor:moreLightGreyColor,
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: Text(
                    title,
                    style: Get.textTheme.headline3!.copyWith(fontSize: 14.sp,color: controller.isFeetSelected.value?moreLightGreyColor:primaryColor),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  controller.setHeightType('cm');
                  controller.setFeetSelected(false);
                  controller.setCmSelected(true);
                },
                child: Container(
                  height: 35.h,
                  width: 130.w,
                  decoration: BoxDecoration(
                    color:  controller.isFeetSelected.value?moreLightGreyColor:primaryColor,
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    secondTitle,
                    style: Get.textTheme.headline3!.copyWith(color:controller.isFeetSelected.value?primaryColor:moreLightGreyColor),
                  ),
                ),
              ),
            ],
          ),
    ),
      );
  }
}

//moreLightGreyColor