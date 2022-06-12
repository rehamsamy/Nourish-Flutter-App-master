import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app_theme.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    required this.title,
    required this.onPress,
    this.width,
    this.height,
    this.widget,
    this.borderColor,
    this.textColor,
    this.fontSize,
    Key? key,
  }) : super(key: key);

  final String title;
  final Widget? widget;

  final double? width;
  final double? height;
  final Function onPress;
  final Color? borderColor;
  final Color? textColor;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width,
      height: height ?? 52.h,
      child: OutlinedButton(
        onPressed: () {
          onPress();
        },
        style: ButtonStyle(
          side: MaterialStateProperty.all<BorderSide>(
            BorderSide(
              color: borderColor ?? primaryColor,
              // width: 2.w,
            ),
          ),
        ),
        child: widget ??
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColor ,
                fontWeight: FontWeight.w300,
                fontSize: fontSize ?? 15.sp,
              ),
            ),
      ),
    );
  }
}
