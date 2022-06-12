import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../app_theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.title,
    required this.onPress,
    this.color,
    this.width,
    this.height,
    this.icon,
    this.style,
    Key? key,
  }) : super(key: key);

  final String title;
  final double? width;
  final double? height;
  final Function onPress;
  final Color? color;
  final String? icon;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width,
      height: height ?? 60.h,
      child: ElevatedButton(
        onPressed: () {
          onPress();
        },
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(color ?? primaryColor),
        ),
        child: Row(
          mainAxisAlignment: icon != null
              ? MainAxisAlignment.spaceEvenly
              : MainAxisAlignment.center,
          children: [
            icon == null
                ? const SizedBox.shrink()
                : SvgPicture.asset(
                    icon!,
                    height: 16.h,
                    width: 16.w,
                    color: Colors.white,
                  ),
            Text(
              " $title",
              style: style ?? Theme.of(context).textTheme.button!,
            ),
          ],
        ),
      ),
    );
  }
}
