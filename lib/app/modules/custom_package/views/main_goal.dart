import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/assets.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/shared/custom_button.dart';
import 'package:nourish_sa/app/shared/selection_card.dart';

import '../../../data/services/analytics_service.dart';
import '../controllers/custom_package_controller.dart';
import 'meals_needed_screen.dart';

class MainGoalScreen extends GetView<CustomPackageController> {
  const MainGoalScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${LocalKeys.kStep.tr} 6 ${LocalKeys.kOf.tr} 7'),
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
              LocalKeys.kChoosemaingoal.tr,
              style: Get.textTheme.headline1,
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.h, bottom: 16.h),
              child: SelectionCard(
                image: Assets.kkilos,
                isSelected: controller.mainGoal == 'lose_weight',
                isWithBG: true,
                onTap: () {
                  controller.mainGoal = "lose_weight";
                },
                title: LocalKeys.kLoseWeight.tr,
              ),
            ),
            SelectionCard(
              image: Assets.kFitnessIcon,
              isSelected: controller.mainGoal == 'keep_fit',
              isWithBG: true,
              onTap: () {
                controller.mainGoal = "keep_fit";
              },
              title: LocalKeys.kKeepFit.tr,
            ),
            const Spacer(),
            CustomButton(
                title: LocalKeys.kStart.tr,
                onPress: () {
                  AnalyticsService.instance.logEvent("Meals_Needed_View");
                  Get.to(() => const MealsNeededScreen());
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
