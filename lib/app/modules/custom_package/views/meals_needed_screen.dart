import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/assets.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/modules/custom_package/views/activity_screen.dart';
import 'package:nourish_sa/app/shared/custom_button.dart';
import 'package:nourish_sa/app/shared/selection_card.dart';

import '../controllers/custom_package_controller.dart';

class MealsNeededScreen extends GetView<CustomPackageController> {
  const MealsNeededScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${LocalKeys.kStep.tr} 7 ${LocalKeys.kOf.tr} 7'),
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
              LocalKeys.kMealsYouNeed.tr,
              style: Get.textTheme.headline1,
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.h, bottom: 16.h),
              child: SelectionCard(
                image: Assets.kBurgerDrinkIcon,
                isSelected: false,
                onTap: () {
                  controller.setMealsNeeded(1);
                },
                title: LocalKeys.kBreakfast.tr,
                isWithBG: true,
                isWithCheckBox: true,
              ),
            ),
            SelectionCard(
              image: Assets.kFood,
              isSelected: false,
              onTap: () {
                controller.setMealsNeeded(2);
              },
              isWithCheckBox: true,
              title: LocalKeys.kLunch.tr,
              isWithBG: true,
            ),
            SizedBox(
              height: 16.h,
            ),
            SelectionCard(
              image: Assets.kCheese,
              isSelected: false,
              onTap: () {
                controller.setMealsNeeded(3);
              },
              isWithCheckBox: true,
              isWithBG: true,
              title: LocalKeys.kDinner.tr,
            ),
            const Spacer(),
            CustomButton(
                title: LocalKeys.kContinue.tr,
                onPress: () {
                  //Get.until((route) => Get.currentRoute == Routes.HOME_PAGE);
                  Get.to(() => const ActivityScreen());
                }),
            SizedBox(
              height: 111.h,
            ),
          ],
        ),
      ),
    );
  }
}
