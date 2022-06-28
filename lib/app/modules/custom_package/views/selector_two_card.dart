import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/modules/custom_package/controllers/custom_package_controller.dart';

import '../../../../app_theme.dart';

class SelectorTwoCard extends GetView<CustomPackageController> {
  const SelectorTwoCard(
      {required this.title, required this.secondTitle,required this.flag,
        required Key? key})
      : super(key: key);
  final String title, secondTitle ,flag;

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
                  Get.log('llllll'+flag+controller.isPoundSelected.toString()+'    '+controller.isKilogramSelected.toString());
                  if(flag=='height'){
                    controller.setFeetSelected(true);
                    controller.setCmSelected(false);
                    controller.setHeightType('feet');
                  }else{
                    controller.setPoundSelected(true);
                    controller.setKiloGramSelected(false);
                    controller.setHeightType('pound');
                  }
                } ,
                child: Container(
                  width: 130.w,
                  height: 35.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                   // color:greyColor ,
                    color:  getCardColor1(flag),
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: Text(
                    title,
                    style: Get.textTheme.headline3!.copyWith(fontSize: 14.sp
                        ,color: getTextColor1(flag)),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  if(flag=='height') {
                    controller.setHeightType('cm');
                    controller.setFeetSelected(false);
                    controller.setCmSelected(true);
                  }else{
                    controller.setHeightType('kg');
                    controller.setPoundSelected(false);
                    controller.setKiloGramSelected(true);

                  }


                },
                child: Container(
                  height: 35.h,
                  width: 130.w,
                  decoration: BoxDecoration(
                    color:  getCardColor2(flag),
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    secondTitle,
                    style: Get.textTheme.headline3!.copyWith
                      (color:getTextColor2(flag)),
                  ),
                ),
              ),
            ],
          ),
    ),
      );
  }
  getCardColor1(String flag){
    if(flag=='height'){
     return controller.isFeetSelected.value?primaryColor:moreLightGreyColor;
    }else{
      return controller.isPoundSelected.value?primaryColor:moreLightGreyColor;
    }
  }
  getCardColor2(String flag){
    if(flag=='height'){
       return controller.isFeetSelected.value?moreLightGreyColor:primaryColor;
    }else{
      return controller.isPoundSelected.value?moreLightGreyColor:primaryColor;
    }
  }


  getTextColor1(String flag){
    if(flag=='height'){
      return controller.isFeetSelected.value?moreLightGreyColor:primaryColor;
    }else{
      return controller.isPoundSelected.value?moreLightGreyColor:primaryColor;
    }
  }
  getTextColor2(String flag){
    if(flag=='height'){
      return controller.isFeetSelected.value?primaryColor:moreLightGreyColor;
    }else{
      return controller.isPoundSelected.value?primaryColor:moreLightGreyColor;
    }
  }

}

//moreLightGreyColor