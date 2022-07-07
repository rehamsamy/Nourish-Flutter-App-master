import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../app_theme.dart';

class DinnerAnimatedContainer extends StatelessWidget {
  const DinnerAnimatedContainer({
    required this.isSelected,
    required this.title,
    Key? key,
  }) : super(key: key);
  final bool isSelected;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      width: isSelected ? 120.w : 100.w,
      height: isSelected ? 115.h : 93.h,
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
                Container(
                  width: 21.w,
                  height: 21.h,
                  decoration: const BoxDecoration(
                    color: greyColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.remove,
                    color: whiteColor,
                    size: 16.r,
                  ),
                ),
                Text(
                  "2",
                  style: Get.textTheme.bodyText1,
                ),
                Container(
                  width: 21.w,
                  height: 21.h,
                  decoration: const BoxDecoration(
                    color: greyColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.add,
                    color: whiteColor,
                    size: 16.r,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
