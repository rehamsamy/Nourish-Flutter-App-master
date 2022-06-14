import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/modules/home_screen/views/home_screen_view.dart';
import 'package:nourish_sa/app/modules/meals/views/meals_view.dart';
import 'package:nourish_sa/app/modules/packages/views/packages_view.dart';
import 'package:nourish_sa/app/modules/profile/views/profile_view.dart';
import 'package:nourish_sa/app_theme.dart';
import '../controllers/home_page_controller.dart';
import 'bottom_nav_bar_icon.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() => Stack(
            children: [
              BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: controller.currentIndex.value,
                onTap: controller.changeIndex,
                selectedItemColor: primaryColor,
                selectedLabelStyle: Get.textTheme.headline3!
                    .copyWith(fontSize: 11.sp, color: primaryColor),
                unselectedLabelStyle:
                    Get.textTheme.headline3!.copyWith(fontSize: 11.sp),
                items: [
                  BottomNavigationBarItem(
                    label: LocalKeys.kHome.tr,
                    icon: BottomNavBarIcon(
                      icon: Assets.kHome,
                      isSelected: controller.currentIndex.value == 0,
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: LocalKeys.kMeals.tr,
                    icon: BottomNavBarIcon(
                      icon: Assets.kMenu,
                      isSelected: controller.currentIndex.value == 1,
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: LocalKeys.kPackages.tr,
                    icon: BottomNavBarIcon(
                      icon: Assets.kFolder,
                      isSelected: controller.currentIndex.value == 2,
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: LocalKeys.kProfile.tr,
                    icon: BottomNavBarIcon(
                      icon: Assets.kUser,
                      isSelected: controller.currentIndex.value == 3,
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 0,
                width: Get.width,
                child: AnimatedAlign(
                  alignment: Alignment(
                      controller
                          .getIndicatorPosition(controller.currentIndex.value),
                      0),
                  curve: Curves.linear,
                  duration: const Duration(milliseconds: 200),
                  child: Container(
                    color: primaryColor,
                    margin: EdgeInsets.symmetric(
                      horizontal: ((Get.width / 4) - 60.w) / 2,
                    ),
                    width: 60.w,
                    height: 2.h,
                  ),
                ),
              ),
            ],
          )),
      body: Obx(
        () => IndexedStack(
          index: controller.currentIndex.value,
          children: [
             HomeScreenView(),
            MealsView(),
            const PackagesView(),
            ProfileView(),
          ],
        ),
      ),
    );
  }
}
