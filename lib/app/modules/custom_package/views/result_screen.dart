import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/assets.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/modules/custom_package/views/result_meals.dart';
import 'package:nourish_sa/app/shared/custom_button.dart';
import 'package:nourish_sa/app_theme.dart';
import 'package:nourish_sa/routes/app_pages.dart';

import '../../../data/services/analytics_service.dart';
import '../controllers/custom_package_controller.dart';

class ResultScreen extends GetView<CustomPackageController> {
  Map<String, dynamic> map = Get.arguments;
  @override
  Widget build(BuildContext context) {
    print("Result :" +
        (controller.packageModel?.data?.responseData?.calories ?? 2.0)
            .toString());
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          Assets.kLogo,
          width: 91.w,
          height: 32.h,
        ),
        centerTitle: true,
        elevation: 0,
        shadowColor: const Color(0xff000000).withOpacity(0.3),
      ),
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 27.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 75.h,
                ),
                Text(
                  LocalKeys.kYourResulat.tr,
                  style: Get.textTheme.headline1,
                ),
                Container(
                  width: 374.w,
                  margin: EdgeInsets.symmetric(vertical: 26.h),
                  padding:
                      EdgeInsets.symmetric(vertical: 30.h, horizontal: 23.w),
                  decoration: BoxDecoration(
                    border: Border.all(color: lightGreyColor),
                    borderRadius: BorderRadius.circular(13.r),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "",
                        style:
                            Get.textTheme.headline3!.copyWith(fontSize: 14.sp),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30.h, bottom: 3.h),
                        child: Text(
                          '${controller.packageModel?.data?.responseData?.calories ?? '0.0'}',
                          style: Get.textTheme.headline6,
                        ),
                      ),
                      Text(
                        LocalKeys.kCaloriesDay.tr,
                        style: Get.textTheme.headline3,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 35.h, bottom: 33.h),
                        child: Text(
                          LocalKeys.kTargetMacronutrientsRange.tr,
                          style: Get.textTheme.headline3,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 60.h,
                                width: 100.w,
                                margin: EdgeInsets.only(bottom: 10.h),
                                decoration: BoxDecoration(
                                  border: Border.all(color: lightGreyColor),
                                  borderRadius: BorderRadius.circular(13.r),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  '${controller.packageModel?.data?.responseData?.carbs ?? '0.0'}',
                                  style: Get.textTheme.bodyText1,
                                ),
                              ),
                              Text(
                                "Carb",
                                style: Get.textTheme.headline3,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 60.h,
                                width: 100.w,
                                margin: EdgeInsets.only(bottom: 10.h),
                                decoration: BoxDecoration(
                                  border: Border.all(color: lightGreyColor),
                                  borderRadius: BorderRadius.circular(13.r),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  '${controller.packageModel?.data?.responseData?.fat ?? '0.0'}',
                                  style: Get.textTheme.bodyText1!
                                      .copyWith(color: primaryColor),
                                ),
                              ),
                              Text(
                                "Fat",
                                style: Get.textTheme.headline3,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 60.h,
                                width: 100.w,
                                margin: EdgeInsets.only(bottom: 10.h),
                                decoration: BoxDecoration(
                                  border: Border.all(color: lightGreyColor),
                                  borderRadius: BorderRadius.circular(13.r),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  '${controller.packageModel?.data?.responseData?.protein ?? '0.0'}',
                                  style: Get.textTheme.bodyText1!
                                      .copyWith(color: const Color(0xff2BB07B)),
                                ),
                              ),
                              Text(
                                "Protein",
                                style: Get.textTheme.headline3,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "",
                      style: Get.textTheme.headline3!.copyWith(fontSize: 14.sp),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          Assets.kEdit,
                          width: 13.w,
                          height: 13.h,
                          color: primaryColor,
                        ),
                        Text(
                          "", //LocalKeys.kEdit.tr,
                          style: Get.textTheme.caption!
                              .copyWith(color: primaryColor),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 100.h,
                ),
                CustomButton(
                    title: LocalKeys.kContinue.tr,
                    onPress: () {
                      AnalyticsService.instance.logEvent("Main_Goal_View");
                      Get.to(() => MyMealResults(
                            package: controller.packageModel,
                          ));
                    }),
                SizedBox(
                  height: 18.h,
                ),
                InkWell(
                  onTap: () {
                    Get.until((route) => Get.currentRoute == Routes.HOME_PAGE);
                  },
                  child: Text(
                    LocalKeys.kBackHome.tr,
                    style: Get.textTheme.caption!.copyWith(color: primaryColor),
                  ),
                ),
                SizedBox(
                  height: 19.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
