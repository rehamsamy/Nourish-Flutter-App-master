import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';

import '../../../../../app_theme.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 2.h,
              color: lightGreyColor,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: Text(
              LocalKeys.kOr.tr,
              style: Get.textTheme.headline1,
            ),
          ),
          Expanded(
            child: Container(
              height: 2.h,
              color: lightGreyColor,
            ),
          ),
        ],
      ),
    );
  }
}
