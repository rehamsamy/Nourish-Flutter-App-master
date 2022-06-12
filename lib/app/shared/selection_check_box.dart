import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app_theme.dart';
import 'package:nourish_sa/app/core/values/assets.dart';

class SelectionCheckBox extends StatelessWidget {
  const SelectionCheckBox({
    required this.title,
    required this.isSelected,
    required this.onTap,
    Key? key,
  }) : super(key: key);
  final bool isSelected;
  final Function(bool?)? onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 374.w,
      height: 84.h,
      decoration: BoxDecoration(
        color: isSelected ? primaryColor : moreLightGreyColor,
        borderRadius: BorderRadius.circular(4.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 8.h),
      child: Row(
        children: [
          Checkbox(
            value: isSelected,
            onChanged: onTap,
            activeColor: Colors.black,
          ),
          SizedBox(width: 16.w),
          Text(
            title,
            style: Get.textTheme.headline3!.copyWith(
              color: blackColor,
            ),
          ),
          const Spacer(),
          SvgPicture.asset(
            Assets.kMore,
            width: 29.w,
            height: 29.h,
          ),
        ],
      ),
    );
  }
}
