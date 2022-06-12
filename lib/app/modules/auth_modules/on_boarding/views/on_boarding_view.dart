import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/data/services/shared_pref.dart';
import 'package:nourish_sa/app/shared/custom_button.dart';
import 'package:nourish_sa/app/core/values/assets.dart';
import 'package:nourish_sa/app_theme.dart';
import 'package:nourish_sa/routes/app_pages.dart';

import '../controllers/on_boarding_controller.dart';

class OnBoardingView extends GetView<OnBoardingController> {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 133.h,
            ),
            Image.asset(
              Assets.kOnBoard,
              width: 307.w,
              height: 359.h,
            ),
            Expanded(
              child: Center(
                child: PageView.builder(
                  controller: controller.pageController,
                  itemCount: controller.data.length,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (value) =>
                      controller.currentPage.value = value,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 18.h),
                              child: Text(
                                controller.data[index].title,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                            Text(
                              controller.data[index].subtitle,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 12.h,
                bottom: 39.h,
              ),
              child: SizedBox(
                height: 5.h,
                width: 60.w,
                child: ListView.builder(
                    itemCount: controller.data.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Obx(
                        () => Container(
                          width: controller.currentPage.value == index
                              ? 22.w
                              : 12.w,
                          height: 5.h,
                          margin: EdgeInsetsDirectional.only(end: 4.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.r),
                            color: controller.currentPage.value == index
                                ? primaryColor
                                : blueGreyColor,
                          ),
                        ),
                      );
                    }),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 25.h.h,
                horizontal: 25.w,
              ),
              child: Obx(() => CustomButton(
                    title: controller.currentPage.value == 2
                        ? LocalKeys.kGetStarted.tr
                        : LocalKeys.kNext.tr,
                    onPress: () {
                      if ((controller.currentPage.value + 1) !=
                          controller.data.length) {
                        controller.pageController
                            .jumpToPage(controller.currentPage.value + 1);
                      } else {
                        Get.find<SharedPrefService>().saveIsFirstTime();
                        Get.offAllNamed(Routes.LOCATION_ACESSS);
                      }
                    },
                  )),
            ),
            Obx(
              () => controller.currentPage.value == 2
                  ? SizedBox(
                      height: 48.h,
                    )
                  : TextButton(
                      onPressed: () {
                        Get.find<SharedPrefService>().saveIsFirstTime();
                        Get.offAllNamed(Routes.LOGIN);
                      },
                      child: Text(
                        LocalKeys.kSkip.tr,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 15.sp),
                      ),
                    ),
            ),
            SizedBox(
              height: 15.h,
            ),
          ],
        ),
      ),
    );
  }
}
