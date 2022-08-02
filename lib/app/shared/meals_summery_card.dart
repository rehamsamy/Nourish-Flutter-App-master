import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/assets.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/data/models/subscription_detail_model.dart';
import 'package:nourish_sa/app/modules/package_meals/controllers/package_meals_controller.dart';

import '../../app_theme.dart';
import '../modules/package_cart/controllers/package_cart_controller.dart';

class MealsSummeryCard extends GetView<PackageCartController> {
  int index;
  MealsSummeryCard(this.index);

  @override
  Widget build(BuildContext context) {
    Get.log('nnnn ' + controller.currentDay);
    Map x = {
      'sat': {'dinner': '123', 'breakfast': '450', 'lunch': '888'}
    };

    return GetBuilder<PackageCartController>(
      builder: (_) => Container(
        width: 374.w,
        margin: EdgeInsets.only(bottom: 18.h),
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 11.h),
        decoration: BoxDecoration(
            color: lightBlueColor,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: primaryColor)),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  Assets.kMealItem,
                  width: 15.w,
                  height: 15.h,
                  color: primaryColor,
                ),
                SizedBox(
                  width: 12.w,
                ),
                Text(
                  (PackageMealsController()
                      .selectedDays1[controller.currentDay]
                      .keys
                      .elementAt(index)),
                  // x['sat'].keys.elementAt(index),
                  style: Get.textTheme.bodyText1,
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            FoodItem(
              title:
                  //x['sat'].values.elementAt(index)
                  PackageMealsController()
                      .selectedDays1[controller.currentDay]
                      .values
                      .elementAt(index)
                      .toString(),
              desc: '',
              isEnd: index == -1,
            ),
            const SizedBox(
              height: 5,
            ),

            // ListView.builder(
            //   itemCount: 1,
            //   shrinkWrap: true,
            //   padding: EdgeInsets.symmetric(vertical: 22.h, horizontal: 27.w),
            //   physics: const NeverScrollableScrollPhysics(),
            //   itemBuilder: (context, index) {
            //     Get.log('pppp  '+PackageMealsController.selectedDays1[controller.currentDay].values.elementAt(0).toString());
            //     return FoodItem(
            //       title:
            //       //x['sat'].values.elementAt(index)
            //       PackageMealsController.selectedDays1[controller.currentDay].values.elementAt(index).toString()
            //       ,desc :'',
            //       isEnd: index == 1,
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}

class FoodItem extends StatelessWidget {
  const FoodItem(
      {required this.title, required this.desc, this.isEnd = false, Key? key})
      : super(key: key);
  final String title;
  final String desc;
  final bool isEnd;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 10.w,
              height: 10.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: primaryColor,
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              title,
            ),
          ],
        ),
        isEnd
            ? const SizedBox.shrink()
            : Padding(
                padding: EdgeInsetsDirectional.only(start: 4.5.w),
                child: DottedLine(
                  direction: Axis.vertical,
                  lineLength: 35.h,
                  lineThickness: 2.h,
                  dashColor: primaryColor,
                ),
              )
      ],
    );
  }
}
