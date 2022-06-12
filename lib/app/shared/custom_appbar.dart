import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/assets.dart';
import 'package:nourish_sa/routes/app_pages.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  CustomAppBar({
    required this.scaffoldKey,
    Key? key,
  })  : preferredSize = Size.fromHeight(60.0.h),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image.asset(
        Assets.kLogo,
        width: 91.w,
        height: 32.h,
      ),
      centerTitle: true,
      shadowColor: const Color(0xff000000).withOpacity(0.3),
      leading: InkWell(
        onTap: () {
          scaffoldKey!.currentState!.openDrawer();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 16.h,
          ),
          child: Center(
            child: SvgPicture.asset(
              Assets.kMenuIcon,
              width: 23.w,
              height: 23.h,
            ),
          ),
        ),
      ),
      actions: [
        InkWell(
          onTap: () => Get.toNamed(
            Routes.NOTIFICATION,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 16.h,
            ),
            child: SvgPicture.asset(
              Assets.kNotification,
              width: 23.w,
              height: 23.h,
            ),
          ),
        ),
        InkWell(
          onTap: () => Get.toNamed(
            Routes.SEARCH,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 16.h,
            ),
            child: SvgPicture.asset(
              Assets.kSearch,
              width: 23.w,
              height: 23.h,
            ),
          ),
        ),
      ],
    );
  }
}
