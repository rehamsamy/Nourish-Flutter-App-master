import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:nourish_sa/app/core/values/assets.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/shared/custom_network_image.dart';

import '../../../../../app_theme.dart';

class CategoryProductCard extends StatelessWidget {
  const CategoryProductCard(
      {required this.image,
      required this.productName,
      required this.productCalories,
      Key? key})
      : super(key: key);
  final String image;
  final String productName;
  final String productCalories;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 374.w,
      height: 103.h,
      margin: EdgeInsets.only(bottom: 19.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.r),
        color: Colors.white,
        border: Border.all(
          color: lightBlueColor,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff636363).withOpacity(0.17),
            offset: const Offset(0, 5),
            blurRadius: 9,
          )
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
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
                Text(
                  productName,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      Assets.kCalories,
                      width: 15.w,
                      height: 21.55.h,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      productCalories + " ${LocalKeys.kCalories.tr}",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(color: blueGreyColor),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
