import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/modules/package_meals/controllers/package_meals_controller.dart';
import 'package:nourish_sa/app/shared/custom_network_image.dart';

import '../../../../../app_theme.dart';

class MealSelectCard extends StatefulWidget {
  MealSelectCard({
    required this.id,
    required this.title,
    required this.image,
    required this.caleries,
    required this.isSelected,

    Key? key,
  }) : super(key: key);
  final int id;
  final String image;
  final String title;
  final String caleries;
  bool isSelected;

  @override
  State<MealSelectCard> createState() => _MealSelectCardState();
}

class _MealSelectCardState extends State<MealSelectCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      width: 357.w,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13.r),
        ),
        child: GetBuilder<PackageMealsController>(
          builder: (controller) => Column(
            children: [
              CustomNetworkImage(
                imageUrl: widget.image,
                height: 150.h,
                width: double.infinity,
                radius: 13.r,
                radiusOnlyTop: true,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.16),
                        blurRadius: 12,
                        offset: const Offset(0, 3),
                      )
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: Get.textTheme.headline1!.copyWith(
                            color: primaryColor,
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          widget.caleries + " caleries",
                          style: Get.textTheme.caption!.copyWith(
                            color: blueGreyColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 103.w,
                      height: 38.h,
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            widget.isSelected = true;
                            PackageMealsController
                                    .selectedDays[controller.currentDay]
                                [controller.selectedMeal] = [widget.id];
                            PackageMealsController.selectedDays1[controller.currentDay]
                            [controller.selectedMeal]=widget.title;
                            Get.log('nnnn '+PackageMealsController.selectedDays1.toString()+widget.title.toString());

                            // PackageMealsController.selectedDays1={
                            //   PackageMealsController.selectedDays[controller.currentDay]:
                            //   [controller.selectedMeal]
                            // };


                          });
                          print(PackageMealsController.selectedDays);
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            widget.isSelected ? primaryColor : Colors.white,
                          ),
                          side: MaterialStateProperty.all<BorderSide>(
                            const BorderSide(
                              color: primaryColor,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 23.w,
                              height: 23.h,
                              margin: EdgeInsetsDirectional.only(end: 10.w),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: widget.isSelected
                                    ? Colors.white
                                    : Colors.transparent,
                                border: Border.all(
                                  color: widget.isSelected
                                      ? Colors.white
                                      : primaryColor,
                                ),
                              ),
                              child: Icon(
                                widget.isSelected ? Icons.done : Icons.add,
                                color: primaryColor,
                                size: 16.r,
                              ),
                            ),
                            Text(
                              "Select",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: widget.isSelected
                                    ? Colors.white
                                    : primaryColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 15.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
