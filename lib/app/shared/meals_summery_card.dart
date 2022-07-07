import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/assets.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/data/models/subscription_detail_model.dart';

import '../../app_theme.dart';

class MealsSummeryCard extends StatelessWidget {
  Saturday ? saturday;
  MealsSummeryCard(this.saturday);

  @override
  Widget build(BuildContext context) {
    return Container(
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
               saturday?.mealType?? LocalKeys.kBreakfast.tr,
                style: Get.textTheme.bodyText1,
              ),
            ],
          ),
          ListView.builder(
            itemCount: 2,
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(vertical: 22.h, horizontal: 27.w),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return FoodItem(
                title: saturday?.product?.name??"EGGS",
                isEnd: index == 1,
              );
            },
          ),
        ],
      ),
    );
  }
}

class FoodItem extends StatelessWidget {
  const FoodItem({required this.title, this.isEnd = false, Key? key})
      : super(key: key);
  final String title;
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
            const Text(
              "Eggs",
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
