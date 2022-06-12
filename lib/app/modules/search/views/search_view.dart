import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/assets.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/shared/custom_input.dart';
import 'package:nourish_sa/app/shared/search_item.dart';

import '../../../../app_theme.dart';
import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: CustomInput(
            hint: LocalKeys.kSearch.tr,
            textEditingController: controller.searchController,
          ),
        ),
        centerTitle: true,
        shadowColor: const Color(0xff000000).withOpacity(0.3),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              width: 48.w,
              height: 42.h,
              margin: EdgeInsets.all(12.h),
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(10.r)),
              padding: EdgeInsets.symmetric(
                horizontal: 8.w,
                vertical: 8.h,
              ),
              child: SvgPicture.asset(
                Assets.kSearch,
                color: Colors.white,
                width: 23.w,
                height: 23.h,
              ),
            ),
          )
        ],
      ),
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 27.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 20.h,
                  bottom: 8.h,
                ),
                child: Text(
                  LocalKeys.kRecentSearch.tr,
                  style: Get.textTheme.caption!.copyWith(color: blueGreyColor),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return const SearchItem(
                      text: "Berry Donuts Topping with Che...",
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
