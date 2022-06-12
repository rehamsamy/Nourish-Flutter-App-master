import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app_theme.dart';

class TabBarSelector extends StatelessWidget {
  const TabBarSelector(
      {required this.firstTitle,
      required this.secondTitle,
      required this.selected,
      required this.onTap,
      this.withPadding = true,
      Key? key})
      : super(key: key);
  final String firstTitle;
  final String secondTitle;
  final int selected;
  final Function(int) onTap;
  final bool withPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 53.h,
      padding: EdgeInsets.symmetric(horizontal: withPadding ? 27.w : 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                onTap(0);
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: selected == 0 ? primaryColor : moreLightGreyColor,
                  border: Border.all(
                    color: selected == 0 ? primaryColor : lightGreyColor,
                  ),
                  borderRadius: BorderRadiusDirectional.only(
                    bottomStart: Radius.circular(8.r),
                    topStart: Radius.circular(8.r),
                  ),
                ),
                child: Text(
                  firstTitle,
                  style: selected == 0
                      ? Get.textTheme.button
                      : Get.textTheme.headline2,
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                onTap(1);
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: selected == 1 ? primaryColor : moreLightGreyColor,
                  borderRadius: BorderRadiusDirectional.only(
                    bottomEnd: Radius.circular(8.r),
                    topEnd: Radius.circular(8.r),
                  ),
                  border: Border.all(
                    color: selected == 1 ? primaryColor : lightGreyColor,
                  ),
                ),
                child: Text(
                  secondTitle,
                  style: selected == 1
                      ? Get.textTheme.button
                      : Get.textTheme.headline2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
