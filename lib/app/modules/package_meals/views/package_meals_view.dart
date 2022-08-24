import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/modules/package_details/controllers/package_details_controller.dart';
import 'package:nourish_sa/app/modules/package_meals/views/widgets/selected_days_list.dart';
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
  const PackageMealsView({Key? key}) : super(key: key);
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
            child: GetBuilder<PackageMealsController>(
              builder: (_) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 24.h,
                  ),
                  PackageDetailsController().customPackageData != null
                      ? Text(LocalKeys.kResultforYour.tr,
                          style: Get.textTheme.headline1)
                      : const SizedBox(),
                  Padding(
                    padding: EdgeInsets.only(top: 11.h),
                    child: const PackageCaleroiesDetails(),
                  ),
                  GetBuilder<PackageMealsController>(
                    builder: (_) => SizedBox(
                      width: Get.width,
                      height: 102.h,
                      child: OverflowBox(
                        maxWidth: Get.width,
                        minWidth: Get.width,
                        child: SizedBox(
                          height: 115.h,
                          width: Get.width,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              const SizedBox(
                                width: 20,
                              ),
                              controller.breakfastSelected != 0
                                  ? InkWell(
                                      onTap: () {
                                        controller.changeMealSelected(
                                            2, "breakfast");
                                      },
                                      child: DinnerAnimatedContainer(
                                          isSelected:
                                              controller.isMealSelected == 2,
                                          title: LocalKeys.kBreakfast.tr,
                                          type: 'breakfast',
                                          canAddMore:
                                              controller.breakfastSelected != 0,
                                          titleValue:
                                              '${controller.breakfastSelected}'),
                                    )
                                  : const SizedBox(),

                              controller.lunchSelected != 0
                                  ? InkWell(
                                      onTap: () {
                                        controller.changeMealSelected(
                                            3, 'lunch');
                                      },
                                      child: DinnerAnimatedContainer(
                                          isSelected:
                                              controller.isMealSelected == 3,
                                          title: LocalKeys.kLunch.tr,
                                          type: 'lunch',
                                          canAddMore:
                                              controller.lunchSelected != 0,
                                          titleValue:
                                              '${controller.lunchSelected}'),
                                    )
                                  : const SizedBox(),
                              controller.dinnerSelected != 0
                                  ? InkWell(
                                      onTap: () {
                                        controller.changeMealSelected(
                                            1, "dinner");
                                      },
                                      child: DinnerAnimatedContainer(
                                          isSelected:
                                              controller.isMealSelected == 1,
                                          title: LocalKeys.kDinner.tr,
                                          type: 'dinner',
                                          canAddMore:
                                              controller.dinnerSelected != 0,
                                          titleValue:
                                              '${controller.dinnerSelected}'),
                                    )
                                  : const SizedBox(),
                              controller.snacksSelected != 0
                                  ? InkWell(
                                      onTap: () {
                                        controller.changeMealSelected(
                                            4, "snack");
                                      },
                                      child: DinnerAnimatedContainer(
                                          isSelected:
                                              controller.isMealSelected == 4,
                                          title: LocalKeys.kSnacks.tr,
                                          type: 'snack',
                                          canAddMore:
                                              controller.snacksSelected != 0,
                                          titleValue:
                                              '${controller.snacksSelected}'),
                                    )
                                  : const SizedBox(),

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
                            '${(controller.addtionalPackagePrice)} SAR',
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
                  const SelectedDaysListView(),
                  PackageDetailsController().customPackageData != null
                      ? Container(
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
                                value: Get.find<PackageDetailsController>()
                                    .carbs
                                    .toString(),
                              ),
                              DayMealBenefitsValues(
                                title: LocalKeys.kProtein.tr,
                                value: Get.find<PackageDetailsController>()
                                    .protein
                                    .toString(),
                              ),
                              DayMealBenefitsValues(
                                title: LocalKeys.kFat.tr,
                                value: Get.find<PackageDetailsController>()
                                    .fat
                                    .toString(),
                              ),
                              DayMealBenefitsValues(
                                title: LocalKeys.kCalories.tr,
                                value: Get.find<PackageDetailsController>()
                                    .calories
                                    .toString(),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(),
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
                          "${controller.totalPackagePrice} SAR",
                          style: Get.textTheme.headline1!
                              .copyWith(color: primaryColor),
                        ),
                      ],
                    ),
                  ),
                  CustomButton(
                      title: LocalKeys.kContinue.tr,
                      onPress: () async {
                        for (int i = 0;
                            i <
                                PackageMealsController
                                    .selectedMeals.keys.length;
                            i++) {
                          //check if a map contains a specific meal
                          if (PackageMealsController.selectedMeals[
                                  PackageMealsController.selectedMeals.keys
                                      .toList()[i]]["breakfast"] ==
                              "") {
                            Get.snackbar("Some meals not selected",
                                "${PackageMealsController.selectedMeals.keys.toList()[i]}'s breakfast not yet selected");
                            return;
                          }
                          if (PackageMealsController.selectedMeals[
                                  PackageMealsController.selectedMeals.keys
                                      .toList()[i]]["lunch"] ==
                              "") {
                            Get.snackbar("Some meals not selected",
                                "${PackageMealsController.selectedMeals.keys.toList()[i]}'s lunch not yet selected");
                            return;
                          }
                          if (PackageMealsController.selectedMeals[
                                  PackageMealsController.selectedMeals.keys
                                      .toList()[i]]["dinner"] ==
                              "") {
                            Get.snackbar("Some meals not selected",
                                "${PackageMealsController.selectedMeals.keys.toList()[i]}'s dinner not yet selected");
                            return;
                          }
                          if (PackageMealsController.selectedMeals[
                                  PackageMealsController.selectedMeals.keys
                                      .toList()[i]]["snack"] ==
                              "") {
                            Get.snackbar("Some meals not selected",
                                "${PackageMealsController.selectedMeals.keys.toList()[i]}'s snack not yet selected");
                            return;
                          }
                        }
                        ////
                        Get.toNamed(Routes.PACKAGE_CART, arguments: {
                          'total': controller.totalPackagePrice,
                          'isSubscribtion': false,
                          'selectedMeals': PackageMealsController.selectedMeals,
                          'selectedDays':
                              PackageMealsController.selectedDays.keys.toList()
                        });
                      }),
                  SizedBox(
                    height: 42.h,
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  getMealsProductsList() {
    int length = controller.newMealsList?.length ?? 0;
    if (length > 0) {
      return GetBuilder<PackageMealsController>(
        builder: (_) => ListView.builder(
          itemCount: controller.newMealsList?.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: 31.h),
          itemBuilder: (context, index) {
            String x = controller.newMealsList?[index].name ?? ''.toString();
            Get.log('vvvv 111 ' + x);
            return FadeInRight(
              duration: Duration(milliseconds: 100 * index),
              child: InkWell(
                onTap: () => Get.dialog(
                  MealInfoDialog(
                    image: controller.newMealsList?[index].image ?? '',
                    title: controller.newMealsList?[index].name ?? "",
                    desc: controller.newMealsList?[index].description ?? "",
                    values: {
                      'Carb': controller.newMealsList?[index].carb.toString() ??
                          '0.0',
                      'Fat':
                          controller.newMealsList?[index].fat.toString() ?? '0',
                      'Protein':
                          controller.newMealsList?[index].protein.toString() ??
                              '0',
                      'Calories':
                          controller.newMealsList?[index].calories.toString() ??
                              '0'
                    },
                  ),
                ),
                child: MealSelectCard(
                  id: controller.newMealsList?[index].id ?? 0,
                  title: controller.newMealsList?[index].name ?? '',
                  caleries:
                      controller.newMealsList?[index].calories.toString() ?? '',
                  image: controller.newMealsList?[index].image ?? '',
                  isSelected: false,
                ),
              ),
            );
          },
        ),
      );
    } else {
      return const SizedBox(
        height: 100,
        child: Center(
          child: Text('no products found'),
        ),
      );
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
