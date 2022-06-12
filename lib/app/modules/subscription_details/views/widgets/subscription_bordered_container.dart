import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

import '../../../../../app_theme.dart';

class SubscriptionBorderedContainer extends StatelessWidget {
  const SubscriptionBorderedContainer({required this.child, Key? key})
      : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 374.w,
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 21.w),
      margin: EdgeInsets.only(bottom: 20.h),
      decoration: BoxDecoration(
        border: Border.all(color: lightGreyColor),
        borderRadius: BorderRadius.circular(
          10.r,
        ),
      ),
      child: child,
    );
  }
}
