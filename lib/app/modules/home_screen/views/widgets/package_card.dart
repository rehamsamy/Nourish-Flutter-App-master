import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/shared/custom_button.dart';
import 'package:nourish_sa/app_theme.dart';

class PackageCard extends StatelessWidget {
  PackageCard(
      {required this.title, required this.image, required this.onTap, Key? key})
      : super(key: key);

  final String title;
  final String image;
  final double width = 324.w;
  final double height = 153.h;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsetsDirectional.only(start: 25.w),
      padding: EdgeInsets.symmetric(horizontal: 21.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.r),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: CachedNetworkImageProvider(
            image,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 11.h, top: 32.h),
            child: Text(
              title,
              style: Theme.of(context).textTheme.button,
            ),
          ),
          CustomButton(
            title: LocalKeys.kDetails.tr,
            onPress: onTap,
            height: 48.h,
            width: 100.w,
            style: Get.textTheme.caption!.copyWith(color: blackColor),
            color: const Color.fromARGB(255, 244, 206, 100),
          ),
        ],
      ),
    );
  }
}
