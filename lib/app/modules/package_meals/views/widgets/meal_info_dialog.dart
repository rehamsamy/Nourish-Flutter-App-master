import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/shared/custom_network_image.dart';
import 'package:nourish_sa/app_theme.dart';

class MealInfoDialog extends StatelessWidget {
  const MealInfoDialog(
      {required this.image,
      required this.title,
      required this.desc,
      required this.values,
      Key? key})
      : super(key: key);
  final String? image;
  final String? title;
  final String? desc;
  final Map<String, String>? values;

  @override
  Widget build(BuildContext context) {
    String carb = values?['Carb'] as String;

    return AlertDialog(
      scrollable: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      content: Container(
        width: 362.w,
        margin: EdgeInsets.only(bottom: 23.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomNetworkImage(
                imageUrl: image ??
                    'https://image.shutterstock.com/image-vector/little-boy-happy-eat-spaghetti-260nw-687046024.jpg',
                height: 144.h,
                width: 331,
                radius: 15.r),
            Padding(
              padding: EdgeInsets.only(top: 39.h, bottom: 27.h),
              child: Text(
                title ?? '',
                style: Get.textTheme.headline1,
              ),
            ),
            Text(
              desc ?? '',
              style: Get.textTheme.headline3!.copyWith(
                fontSize: 12.sp,
              ),
              maxLines: 4,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 26.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MealKeyValue(
                  valueKey: "Carb",
                  value: values?['Carb'] ?? "",
                ),
                MealKeyValue(
                  valueKey: "Fat",
                  value: values?["Fat"] ?? "",
                ),
                MealKeyValue(
                  valueKey: "Protein",
                  value: values?["Protein"] ?? "",
                ),
                MealKeyValue(
                  valueKey: "Calories",
                  value: values?["Calories"] ?? "",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MealKeyValue extends StatelessWidget {
  const MealKeyValue({required this.value, required this.valueKey, Key? key})
      : super(key: key);
  final String? value;
  final String? valueKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 6.w, left: 6.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 49.w,
            height: 49.w,
            margin: EdgeInsets.only(bottom: 6.h),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              border: Border.all(
                color: blueGreyColor,
              ),
            ),
            child: Text(
              value ?? '',
              style: Get.textTheme.bodyText2!.copyWith(
                color: primaryColor,
              ),
            ),
          ),
          Text(
            valueKey ?? '',
            style: Get.textTheme.bodyText2,
          ),
        ],
      ),
    );
  }
}
