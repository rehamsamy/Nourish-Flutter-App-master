import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../app_theme.dart';

class BottomNavBarIcon extends StatelessWidget {
  const BottomNavBarIcon(
      {required this.icon, required this.isSelected, Key? key})
      : super(key: key);
  final String icon;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 4.h),
      child: SvgPicture.asset(
        icon,
        width: 22.w,
        height: 22.h,
        color: isSelected ? primaryColor : null,
      ),
    );
  }
}
