import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/shared/custom_network_image.dart';

import '../../../../../app_theme.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem(
      {required this.name,
      required this.image,
      this.isSelected = false,
      Key? key})
      : super(key: key);
  final String name, image;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 376.w,
      height: 73.h,
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 19.h),
      padding: EdgeInsets.symmetric(horizontal: 22.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: isSelected ? primaryColor : lightGreyColor,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: Get.textTheme.headline3),
          CustomNetworkImage(
            imageUrl: image,
            height: 44.h,
            width: 75.w,
            radius: 5.r,
          )
        ],
      ),
    );
  }
}
