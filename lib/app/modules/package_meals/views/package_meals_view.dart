import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/app_constants.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/modules/days_time/controllers/days_time_controller.dart';
import 'package:nourish_sa/app/modules/package_details/controllers/package_details_controller.dart';
import 'package:nourish_sa/app/shared/custom_button.dart';
import 'package:nourish_sa/app/modules/package_meals/views/widgets/meal_info_dialog.dart';
import 'package:nourish_sa/app/shared/dinner_animted_container.dart';
import 'package:nourish_sa/app/modules/package_meals/views/widgets/meal_select_card.dart';
import 'package:nourish_sa/app/shared/package_caleroies_details..dart';
import 'package:nourish_sa/routes/app_pages.dart';
import '../../../../app_theme.dart';
import '../controllers/package_meals_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PackageMealsView extends GetView<PackageMealsController> {
    PackageMealsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(LocalKeys.kSelectMeals.tr),
          centerTitle: true,
          shadowColor: const Color(0xff000000).withOpacity(0.3),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 27.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 24.h,
                ),
                Text(LocalKeys.kResultforYour.tr,
                    style: Get.textTheme.headline1),
                Padding(
                  padding: EdgeInsets.only(top: 11.h),
                  child: PackageCaleroiesDetails(),
                ),
                GetBuilder<PackageMealsController>(
                  builder: (_) => SizedBox(
                    width: Get.width,
                    height: 102.h,
                    child: OverflowBox(
                      maxWidth: Get.width,
                      minWidth: Get.width,
                      child: SizedBox(
                        height: 102.h,
                        width: Get.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                controller.changeMealSelected(1);
                              },
                              child: DinnerAnimatedContainer(
                                  isSelected: controller.isMealSelected == 1,
                                  title: LocalKeys.kDinner.tr,
                                  type: 'dinner',
                                  canAddMore:
                                      controller.extraDinnerPrice != null,
                                  titleValue: '${controller.dinnerSelected}'),
                            ),
                            InkWell(
                              onTap: () {
                                controller.changeMealSelected(2);
                              },
                              child: DinnerAnimatedContainer(
                                  isSelected: controller.isMealSelected == 2,
                                  title: LocalKeys.kBreakfast.tr,
                                  type: 'breakfast',
                                  canAddMore:
                                      controller.extraBreakfastPrice != null,
                                  titleValue:
                                      '${controller.breakfastSelected}'),
                            ),
                            InkWell(
                              onTap: () {
                                controller.changeMealSelected(3);
                              },
                              child: DinnerAnimatedContainer(
                                  isSelected: controller.isMealSelected == 3,
                                  title: LocalKeys.kLunch.tr,
                                  type: 'lunch',
                                  canAddMore:
                                      controller.extraLunchPrice != null,
                                  titleValue: '${controller.lunchSelected}'),
                            ),
                            // DinnerAnimatedContainer(
                            //   isSelected: false,
                            //   title: LocalKeys.kSnacks.tr,
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                GetBuilder<PackageMealsController>(
                  builder: (_) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 22.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          LocalKeys.kPriceForAdditionalPackages.tr,
                          style: Get.textTheme.headline3,
                        ),
                        Text(
                          '${controller.addtionalPackagePrice} SAR',
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: Get.width,
                  height: 2.h,
                  child: OverflowBox(
                    maxWidth: Get.width,
                    minWidth: Get.width,
                    child: const Divider(),
                  ),
                ),
                SizedBox(
                  height: 18.h,
                ),
                Text(
                  LocalKeys.kDays.tr,
                  style: Get.textTheme.headline1,
                ),
                SizedBox(
                  height: 27.h,
                ),
                SizedBox(
                  width: Get.width,
                  height: 44.w + 18.h,
                  child: OverflowBox(
                    maxWidth: Get.width,
                    minWidth: Get.width,
                    child: SizedBox(
                      height: 44.w + 18.h,
                      width: Get.width,
                      child: ListView.builder(
                        //itemCount: AppConstants.days.length,
                        itemCount: controller.selectedDays.length,
                        padding: EdgeInsetsDirectional.only(start: 22.w),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
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
                                    color: controller.selectedDays[index] == "Sat"
                                        ? primaryColor
                                        : whiteColor,
                                    border: Border.all(
                                      color: controller.selectedDays[index] == "Sat"
                                          ? primaryColor
                                          : lightGreyColor,
                                    ),
                                  ),
                                  child: Text(
                                    controller.selectedDays[index],
                                    style: Get.textTheme.headline3!.copyWith(
                                      color:controller.selectedDays[index] == "Sat"
                                          ? whiteColor
                                          : lightGreyColor,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 6.h,
                                ),
                                controller.selectedDays == "Sat"
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
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 373.w,
                  decoration: BoxDecoration(
                    border: Border.all(color: greyColor),
                  ),
                  padding: EdgeInsets.only(
                      top: 14.h, bottom: 9.h, left: 27.w, right: 27.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DayMealBenefitsValues(
                        title: LocalKeys.kCarb.tr,
                        value: "500",
                      ),
                      DayMealBenefitsValues(
                        title: LocalKeys.kProtein.tr,
                        value: "500",
                      ),
                      DayMealBenefitsValues(
                        title: LocalKeys.kProtein.tr,
                        value: "500",
                      ),
                      DayMealBenefitsValues(
                        title: LocalKeys.kCalories.tr,
                        value: "500",
                      ),
                    ],
                  ),
                ),
                getMealsProductsList(),
                Container(
                  width: Get.width,
                  height: 66.h,
                  margin: EdgeInsets.only(bottom: 56.h),
                  padding: EdgeInsets.symmetric(horizontal: 13.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: primaryColor),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        LocalKeys.kPackagePrice.tr,
                        style: Get.textTheme.headline3!
                            .copyWith(color: primaryColor),
                      ),
                      Text(
                        "2000 SAR",
                        style: Get.textTheme.headline1!
                            .copyWith(color: primaryColor),
                      ),
                    ],
                  ),
                ),
                CustomButton(
                    title: LocalKeys.kContinue.tr,
                    onPress: () {
                      // Get.toNamed(Routes.CART, arguments: {'isSubscribtion':false});
                      Get.log('vvvvv  ' +
                          controller.addtionalPackagePrice.toString());
                      Get.toNamed(Routes.PAYMENT_METHODS, arguments: {
                        'total': controller.addtionalPackagePrice
                      });
                    }),
                SizedBox(
                  height: 42.h,
                ),
              ],
            ),
          ),
        ));
  }

  getMealsProductsList() {
    int length=controller.newMealsList?.length??0;
    if(length>0){
      return   GetBuilder<PackageMealsController>(
        builder: (_)=>ListView.builder(
          itemCount: controller.newMealsList?.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: 31.h),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => Get.dialog(
                MealInfoDialog(
                  image: controller.newMealsList?[index].image??'',
                  title: controller.newMealsList?[index].name,
                  desc:controller.newMealsList?[index].description,
                  values: {
                    LocalKeys.kCarb.tr: controller.newMealsList?[index].carb.toString()??'0.0',
                    LocalKeys.kProtein.tr: controller.newMealsList?[index].fat.toString()??'0',
                    LocalKeys.kProtein.tr: controller.newMealsList?[index].protein.toString()??'0',
                    LocalKeys.kCalories.tr: controller.newMealsList?[index].calories.toString()??'0'
                  },
                ),
              ),
              child:  MealSelectCard(
                caleries: controller.newMealsList?[index].calories.toString()??'',
                image: controller.newMealsList?[index].image??'',
                isSelected: false,
                title: controller.newMealsList?[index].name??'',
              ),
            );
          },
        ),
      );
    }else{
      return SizedBox(height: 100,child: Center(child: Text('no products found'),),);
    }

  }
}

class TrianglePainter extends CustomPainter {
  final Color strokeColor;
  final PaintingStyle paintingStyle;
  final double strokeWidth;

  TrianglePainter(
      {this.strokeColor = Colors.black,
      this.strokeWidth = 3,
      this.paintingStyle = PaintingStyle.stroke});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = strokeColor
      ..strokeWidth = strokeWidth
      ..style = paintingStyle;

    canvas.drawPath(getTrianglePath(size.width, size.height), paint);
  }

  Path getTrianglePath(double x, double y) {
    return Path()
      ..moveTo(0, y)
      ..lineTo(x / 2, 0)
      ..lineTo(x, y)
      ..lineTo(0, y);
  }

  @override
  bool shouldRepaint(TrianglePainter oldDelegate) {
    return oldDelegate.strokeColor != strokeColor ||
        oldDelegate.paintingStyle != paintingStyle ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}

class DayMealBenefitsValues extends StatelessWidget {
  const DayMealBenefitsValues(
      {required this.title, required this.value, Key? key})
      : super(key: key);
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 49.w,
          height: 49.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.r),
            border: Border.all(color: blueGreyColor),
          ),
          child: Text(value,
              style: Get.textTheme.bodyText2!.copyWith(color: primaryColor)),
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(title, style: Get.textTheme.caption!.copyWith(color: blackColor)),
      ],
    );
  }
}
