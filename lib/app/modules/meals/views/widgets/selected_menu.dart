import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../app_theme.dart';

class SelectedMenu extends StatelessWidget {
  SelectedMenu({
    required this.title,
    required this.image,
    required this.isSelected,
    this.color = primaryColor,
    Key? key,
  }) : super(key: key);
  final Color color;
  final String title;
  final String image;
  final bool isSelected;

  final double width = 128.w;
  final double height = 99.h;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(start: 12.w),
      padding: EdgeInsets.all(6.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.r),
        border: Border.all(color: isSelected ? color : Colors.transparent),
      ),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.r),
                child: CachedNetworkImage(
                  imageUrl: image,
                  fit: BoxFit.contain,
                  height: height - 20,
                  width: width,
                  errorWidget: (context, url, error) => Container(
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: const CupertinoActivityIndicator(),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  //height: height / 3,

                  padding: EdgeInsets.only(
                    top: 3.h,
                    bottom: 3.h,
                  ),
                  child: Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .button!
                        .copyWith(fontSize: 14.sp, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
