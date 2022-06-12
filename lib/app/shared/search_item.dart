import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app_theme.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({required this.text, Key? key}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        color: moreLightGreyColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 16.h),
      margin: EdgeInsets.only(bottom: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: Get.textTheme.caption!.copyWith(color: blackColor),
          ),
          Icon(
            Icons.close,
            size: 17.r,
            color: blackColor,
          ),
        ],
      ),
    );
  }
}
