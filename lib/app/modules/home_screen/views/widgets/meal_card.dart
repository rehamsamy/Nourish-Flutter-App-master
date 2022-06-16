import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nourish_sa/app/shared/custom_network_image.dart';
import 'package:nourish_sa/app_theme.dart';

class MealCard extends StatelessWidget {
  MealCard({
    required this.title,
    required this.image,
    this.color = primaryColor,
    Key? key,
  }) : super(key: key);
  final Color color;
  final String title;
  final String image;
  final double width = 128.w;
  final double height = 99.h;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsetsDirectional.only(start: 20.w),
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
            errorWidget: Container(
              color: Colors.grey,
            ),
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
    );
  }
}
