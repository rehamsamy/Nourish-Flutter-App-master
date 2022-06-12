import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../app_theme.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem(
      {required this.icon, required this.name, required this.onTap, Key? key})
      : super(key: key);
  final String name, icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14.5.h),
      child: InkWell(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              width: 25.w,
              height: 25.h,
              color: primaryColor,
              fit: BoxFit.contain,
            ),
            SizedBox(
              width: 12.w,
            ),
            Text(
              name,
              style: Get.textTheme.headline3,
            )
          ],
        ),
      ),
    );
  }
}
