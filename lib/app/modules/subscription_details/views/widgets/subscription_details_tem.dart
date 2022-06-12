import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';

import '../../../../../app_theme.dart';

class SubscriptionDetailsItem extends StatelessWidget {
  const SubscriptionDetailsItem(
      {required this.title,
      required this.valueWidget,
      this.onTap,
      this.isEnd = false,
      Key? key})
      : super(key: key);
  final String title;
  final VoidCallback? onTap;
  final Widget valueWidget;
  final bool isEnd;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            onTap?.call();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Get.textTheme.headline3!.copyWith(color: blackColor),
              ),
              valueWidget,
            ],
          ),
        ),
        isEnd
            ? const SizedBox.shrink()
            : Padding(
                padding: EdgeInsets.symmetric(vertical: 13.5.h),
                child: const Divider(
                  color: lightGreyColor,
                ),
              ),
      ],
    );
  }
}
