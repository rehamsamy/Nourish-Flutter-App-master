import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/assets.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/modules/custom_package/views/birth_Date_screen.dart';
import 'package:nourish_sa/app/shared/custom_button.dart';
import 'package:nourish_sa/app/shared/selection_card.dart';

import '../controllers/custom_package_controller.dart';

class CustomPackageView extends GetView<CustomPackageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('${LocalKeys.kStep.tr} 1 ${LocalKeys.kOf.tr} 7'),
        centerTitle: true,
        elevation: 0,
        shadowColor: const Color(0xff000000).withOpacity(0.3),
      ),
      body: GetBuilder<CustomPackageController>(
        builder: (_)=>
         Padding(
          padding: EdgeInsets.symmetric(horizontal: 35.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 70.h,
              ),
              Text(
                LocalKeys.kChooseGender.tr,
                style: Get.textTheme.headline1,
              ),
              SizedBox(
                height: 49.h,
              ),
              SelectionCard(
                image: Assets.kFemale,
                isSelected: controller.isFemaleSelected,
                isWithBG: true,
                title: LocalKeys.kWoman.tr,
                onTap: () {
                  controller.changeFemale(true);
                  controller.changeMale(false);
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.h),
                child: SelectionCard(
                  image: Assets.kMale,
                  isSelected: controller.isMaleSelected,
                  isWithBG: true,
                  title: LocalKeys.kMan.tr,
                  onTap: () {
                    controller.changeFemale(false);
                    controller.changeMale(true);
                  },
                ),
              ),
              const Spacer(),
              CustomButton(
                title: LocalKeys.kContinue.tr,
                onPress: () {
                  String? gender=(controller.isMaleSelected)==true?'male':'female';
                  Get.log('1111111'+gender.toString());
                  Get.to( BirthDateScreen());
                },
              ),
              SizedBox(
                height: 111.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
