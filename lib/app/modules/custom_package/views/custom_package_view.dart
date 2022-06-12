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
      body: Padding(
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
              isSelected: true,
              isWithBG: true,
              title: LocalKeys.kWoman.tr,
              onTap: () {},
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.h),
              child: SelectionCard(
                image: Assets.kMale,
                isSelected: false,
                isWithBG: true,
                title: LocalKeys.kMan.tr,
                onTap: () {},
              ),
            ),
            const Spacer(),
            CustomButton(
              title: LocalKeys.kContinue.tr,
              onPress: () {
                Get.to(const BirthDateScreen());
              },
            ),
            SizedBox(
              height: 111.h,
            ),
          ],
        ),
      ),
    );
  }
}
