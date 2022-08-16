import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/modules/package_meals/controllers/package_meals_controller.dart';
import '../../app_theme.dart';

class DinnerAnimatedContainer extends GetView<PackageMealsController> {
  const DinnerAnimatedContainer({
    required this.isSelected,
    required this.title,
    required this.type,
    required this.titleValue,
    required this.canAddMore,
    Key? key,
  }) : super(key: key);
  final bool isSelected;
  final String title;
  final String type;
  final String titleValue;
  final bool canAddMore;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PackageMealsController>(
      builder: (_) => AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        width: isSelected ? 115.w : 90.w,
        height: isSelected ? 100.h : 90.h,
        margin:
            EdgeInsetsDirectional.only(end: 10.w, top: isSelected ? 0.h : 9.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.r),
          border: Border.all(
            color: isSelected ? primaryColor : lightGreyColor,
            width: 2.w,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: Get.textTheme.bodyText1,
            ),
            Container(
              width: 85.w,
              height: 33.h,
              padding: EdgeInsets.all(2.w),
              margin: EdgeInsets.symmetric(horizontal: 8.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                border: Border.all(color: lightGreyColor),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      if (canAddMore) {
                        _.removeMeal(type);
                      }
                    },
                    child: Container(
                      width: 21.w,
                      height: 21.h,
                      decoration: BoxDecoration(
                        color: canAddMore ? primaryColor : greyColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.remove,
                        color: whiteColor,
                        size: 16.r,
                      ),
                    ),
                  ),
                  Text(
                    titleValue,
                    style: Get.textTheme.bodyText1,
                  ),
                  InkWell(
                    onTap: () {
                      if (canAddMore) {
                        _.addMeal(type);
                      }
                    },
                    child: Container(
                      width: 21.w,
                      height: 21.h,
                      decoration: BoxDecoration(
                        color: canAddMore ? primaryColor : greyColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.add,
                        color: whiteColor,
                        size: 16.r,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
