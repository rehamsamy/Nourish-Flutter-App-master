import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/assets.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/modules/custom_package/views/selector_two_card.dart';
import 'package:nourish_sa/app/shared/custom_button.dart';
import 'package:nourish_sa/app/shared/custom_input.dart';
import 'package:nourish_sa/app/shared/selection_card.dart';
import 'package:nourish_sa/app_theme.dart';

import 'meals_needed_screen.dart';
import 'weight_screen.dart';

class MainGoalScreen extends StatelessWidget {
  MainGoalScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('${LocalKeys.kStep.tr} 6 ${LocalKeys.kOf.tr} 7'),
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
                isSelected: true,
                isWithBG: true,
                onTap: () {},
                title: LocalKeys.kLoseWeight.tr,
              ),
            ),
            SelectionCard(
              image: Assets.kFitnessIcon,
              isSelected: false,
              isWithBG: true,
              onTap: () {},
                title: LocalKeys.kKeepFit.tr,
            ),
            const Spacer(),
            CustomButton(
                title: LocalKeys.kStart.tr,
                onPress: () {
                  Get.to(MealsNeededScreen());
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
