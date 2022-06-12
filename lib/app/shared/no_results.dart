import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class NoResults extends StatelessWidget {
  const NoResults(
      {required this.text,
      required this.image,
      required this.height,
      required this.width,
      Key? key})
      : super(key: key);
  final String image, text;
  final double height, width;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          image,
          width: width,
          height: height,
        ),
        SizedBox(
          height: 60.h,
        ),
        Text(
          text,
          style: Get.textTheme.bodyText2,
        ),
      ],
    );
  }
}
