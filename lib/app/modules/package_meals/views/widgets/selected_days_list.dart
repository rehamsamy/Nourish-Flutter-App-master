import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/modules/package_meals/controllers/package_meals_controller.dart';
import 'package:nourish_sa/app_theme.dart';

import '../package_meals_view.dart';

class SelectedDaysListView extends StatelessWidget {
  const SelectedDaysListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 44.w + 18.h,
      child: OverflowBox(
        maxWidth: Get.width,
        minWidth: Get.width,
        child: SizedBox(
          height: 44.w + 18.h,
          width: Get.width,
          child: GetBuilder<PackageMealsController>(
            builder: (PackageMealsController controller) => ListView.builder(
              //itemCount: AppConstants.days.length,
              itemCount: PackageMealsController.selectedDays.keys.length,
              padding: EdgeInsetsDirectional.only(start: 22.w),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return FadeIn(
                  child: GestureDetector(
                    onTap: () => controller.selectDay(PackageMealsController
                        .selectedDays.keys
                        .elementAt(index)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.w,
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: 55.w,
                            height: 44.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.r),
                              color: PackageMealsController.selectedMeals[
                                                  controller.currentDay]
                                              [controller.selectedMeal] !=
                                          "" &&
                                      PackageMealsController.selectedDays.keys
                                              .elementAt(index) ==
                                          controller.currentDay
                                  ? greyColor
                                  : PackageMealsController.selectedDays.keys
                                              .elementAt(index) ==
                                          controller.currentDay
                                      ? primaryColor
                                      : whiteColor,
                              border: Border.all(
                                color: PackageMealsController.selectedDays.keys
                                            .elementAt(index) ==
                                        controller.currentDay
                                    ? primaryColor
                                    : lightGreyColor,
                              ),
                            ),
                            child: Text(
                              PackageMealsController.selectedDays.keys
                                  .elementAt(index)
                                  .substring(0, 3),
                              style: Get.textTheme.headline3!.copyWith(
                                color: PackageMealsController.selectedDays.keys
                                            .elementAt(index) ==
                                        controller.currentDay
                                    ? whiteColor
                                    : lightGreyColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          PackageMealsController.selectedDays.keys
                                      .elementAt(index) ==
                                  controller.currentDay
                              ? CustomPaint(
                                  painter: TrianglePainter(
                                    strokeColor: greyColor,
                                    strokeWidth: 10,
                                    paintingStyle: PaintingStyle.fill,
                                  ),
                                  child: SizedBox(
                                    height: 12.h,
                                    width: 16.w,
                                  ),
                                )
                              : const SizedBox.shrink(),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
