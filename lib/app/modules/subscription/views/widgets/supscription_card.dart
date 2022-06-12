import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/assets.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';

import '../../../../../app_theme.dart';
import '../../../../shared/custom_network_image.dart';

class SupscriptionCard extends StatelessWidget {
  const SupscriptionCard({
    required this.image,
    required this.days,
    required this.title,
    required this.price,
    required this.endDate,
    Key? key,
  }) : super(key: key);
  final String image;
  final String title;
  final String days;
  final String price;
  final String endDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 366.w,
      height: 145.h,
      margin: EdgeInsets.symmetric(vertical: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 11.5.h),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(9.r),
        border: Border.all(color: greyColor),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff000000).withOpacity(0.16),
            offset: const Offset(0, 1),
            blurRadius: 6.w,
          )
        ],
      ),
      child: Row(
        children: [
          CustomNetworkImage(
            imageUrl: image,
            height: 120.h,
            width: 120.w,
            radius: 10.r,
          ),
          SizedBox(
            width: 7.w,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      Assets.kCalendar,
                      width: 17.w,
                      height: 19.h,
                      color: primaryColor,
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text(
                      days,
                      style: Get.theme.textTheme.headline3,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 12.h, bottom: 8.h),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                Text(
                  price,
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(color: primaryColor),
                ),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text(
                    "${LocalKeys.kEndedAt.tr} $endDate",
                    style: Get.theme.textTheme.headline3!
                        .copyWith(fontSize: 14.sp),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
