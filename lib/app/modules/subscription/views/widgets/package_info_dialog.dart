import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/shared/custom_network_image.dart';
import 'package:nourish_sa/app/core/values/assets.dart';

import '../../../../../app_theme.dart';

class PackageInfoDialog extends StatelessWidget {
  const PackageInfoDialog(
      {required this.packageName,
      required this.image,
      required this.subTitle,
      required this.packageType,
      required this.options,
      required this.days,
      required this.endDate,
      required this.paymentMethod,
      required this.price,
      Key? key})
      : super(key: key);
  final String image;

  final String packageName;
  final String subTitle;
  final String packageType;
  final int days;
  final int price;
  final String paymentMethod;
  final String endDate;
  final List<String> options;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      scrollable: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      content: Container(
        width: 362.w,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 35.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomNetworkImage(
              imageUrl: image,
              height: 94.h,
              width: 128,
              radius: 10.r,
            ),
            SizedBox(
              height: 14.h,
            ),
            Text(
              packageName,
              style: Get.theme.textTheme.headline1,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h, bottom: 24.h),
              child: Text(
                subTitle,
                style: Get.theme.textTheme.headline3,
              ),
            ),
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.start,
              direction: Axis.horizontal,
              runAlignment: WrapAlignment.spaceBetween,
              spacing: 34.w,
              runSpacing: 10.h,
              children: options
                  .map((e) => Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            Assets.kBookmark,
                            width: 9.w,
                            height: 11.h,
                            color: primaryColor,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            e,
                            style: Get.textTheme.headline3!
                                .copyWith(fontSize: 12.sp),
                          ),
                        ],
                      ))
                  .toList(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40.h, bottom: 16.h),
              child: SizedBox(
                width: Get.width,
                height: 2.h,
                child: OverflowBox(
                  maxWidth: 362.h,
                  minWidth: 362.h,
                  maxHeight: 2.h,
                  child: const Divider(
                    color: lightGreyColor,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    Text('$days',
                      style: Get.theme.textTheme.headline3,
                    ),
                  ],
                ),
                Text('$price',
                  style: Get.theme.textTheme.headline3!
                      .copyWith(color: primaryColor),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.h, bottom: 20.h),
              child: SizedBox(
                width: Get.width,
                height: 2.h,
                child: OverflowBox(
                  maxWidth: 362.h,
                  minWidth: 362.h,
                  maxHeight: 2.h,
                  child: const Divider(
                    color: lightGreyColor,
                  ),
                ),
              ),
            ),
            Text(
              "${LocalKeys.kPaymentMethod.tr} : $paymentMethod",
              style: Get.theme.textTheme.headline3,
            ),
            Text(
              "${LocalKeys.kEndedAt.tr} $endDate",
              style: Get.theme.textTheme.headline3,
            ),
          ],
        ),
      ),
    );
  }
}
