import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nourish_sa/app/shared/custom_network_image.dart';

import '../../../../../app_theme.dart';

class SelectedMenu extends StatelessWidget {
  SelectedMenu({
    required this.title,
    required this.image,
    required this.isSelected,
    this.color = primaryColor,
    Key? key,
  }) : super(key: key);
  final Color color;
  final String title;
  final String image;
  final bool isSelected;

  final double width = 128.w;
  final double height = 99.h;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(start: 12.w),
      padding: EdgeInsets.all(6.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.r),
        border: Border.all(color: isSelected ? color : Colors.transparent),
      ),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomNetworkImage(
              imageUrl: image,
              radius: 5.r,
              width: 83.w,
              height: 58.h,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.button!.copyWith(
                    fontSize: 14.sp,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
