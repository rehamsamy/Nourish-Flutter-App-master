import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/assets.dart';

import '../../app_theme.dart';

class PackageCaleroiesDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 358.w,
      margin: EdgeInsets.only(bottom: 30.h),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(5.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        direction: Axis.horizontal,
        runAlignment: WrapAlignment.center,
        spacing: 10.w,
        runSpacing: 10.h,
        children: [
          SizedBox(
            width: 160.w,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  Assets.kBookmark,
                  width: 9.w,
                  height: 11.h,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 6.w,
                ),
                Expanded(
                  child: Text(
                    "From 1145 to 2125",
                    style: Get.textTheme.button!.copyWith(
                      fontSize: 12.sp,
                      height: 1,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 160.w,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  Assets.kBookmark,
                  width: 9.w,
                  height: 11.h,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 6.w,
                ),
                Expanded(
                  child: Text(
                    "From 1145 to 2125 Calories",
                    style: Get.textTheme.button!.copyWith(
                      fontSize: 12.sp,
                      height: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 160.w,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  Assets.kBookmark,
                  width: 9.w,
                  height: 11.h,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 6.w,
                ),
                Expanded(
                  child: Text(
                    "From 1145 to 2125 Calories",
                    style: Get.textTheme.button!.copyWith(
                      fontSize: 12.sp,
                      height: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 160.w,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  Assets.kBookmark,
                  width: 9.w,
                  height: 11.h,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 6.w,
                ),
                Expanded(
                  child: Text(
                    "From 1145 to 2125 Calories",
                    style: Get.textTheme.button!.copyWith(
                      fontSize: 12.sp,
                      height: 1,
                    ),
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
