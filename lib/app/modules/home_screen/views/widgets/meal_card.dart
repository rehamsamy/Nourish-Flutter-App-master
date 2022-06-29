import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nourish_sa/app_theme.dart';

class MealCard extends StatelessWidget {
  MealCard({
    required this.title,
    required this.image,
    this.color = primaryColor,
    Key? key,
  }) : super(key: key);
  final Color color;
  final String title;
  final String image;
  final double width = 128.w;
  final double height = 99.h;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsetsDirectional.only(start: 20.w),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5.r),
            child: CachedNetworkImage(
              imageUrl: image,
              fit: BoxFit.fitWidth,
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
          SizedBox(
            height: 5.h,
          ),
          Column(
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  //height: height / 3,
                  color: Colors.black26,
                  child: Positioned(
                    bottom: 5.h,
                    left: (width / 3).w,
                    right: (width / 3).w,
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.button!.copyWith(
                          fontSize: 14.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
