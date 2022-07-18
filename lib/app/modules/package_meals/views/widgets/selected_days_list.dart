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
              itemCount: controller.selectedDays.keys.length,
              padding: EdgeInsetsDirectional.only(start: 22.w),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => controller
                      .selectDay(controller.selectedDays.keys.elementAt(index)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.w,
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 44.w,
                          height: 44.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.r),
                            color:
                                controller.selectedDays.keys.elementAt(index) ==
                                        controller.currentDay
                                    ? primaryColor
                                    : whiteColor,
                            border: Border.all(
                              color: controller.selectedDays.keys
                                          .elementAt(index) ==
                                      controller.currentDay
                                  ? primaryColor
                                  : lightGreyColor,
                            ),
                          ),
                          child: Text(
                            controller.selectedDays.keys.elementAt(index),
                            style: Get.textTheme.headline3!.copyWith(
                              color: controller.selectedDays.keys
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
                        controller.selectedDays.keys.elementAt(index) ==
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
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
