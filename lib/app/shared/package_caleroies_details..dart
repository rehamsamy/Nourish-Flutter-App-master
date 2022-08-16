import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/assets.dart';
import 'package:nourish_sa/app/modules/package_details/controllers/package_details_controller.dart';

import '../../app_theme.dart';

class PackageCaleroiesDetails extends GetView<PackageDetailsController> {
  const PackageCaleroiesDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.packageDetailModel != null
        ? Container(
            width: 358.w,
            margin: EdgeInsets.only(bottom: 30.h),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(5.r),
            ),
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
            child:
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              direction: Axis.horizontal,
              runAlignment: WrapAlignment.center,
              spacing: 10.w,
              runSpacing: 15.h,
              children:
              List.generate(controller.packageDetailModel?.data?.descriptions?.length??0, (index) =>
                           Container(
                             width: Get.width/2-50,
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset(
                                  Assets.kBookmark,
                                  width: 9.w,
                                  height: 11.h,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 6.w,
                                ),
                                Expanded(
                                  child: Text(
                                    "${controller.packageDetailModel?.data?.descriptions?[index].desc??''}",
                                    style: Get.textTheme.button!.copyWith(
                                      fontSize: 12.sp,
                                      height: 1,
                                    ),
                                  ),
                                ),
                              ],
                          ),
                           ),

                        )
            ),
          )
        : const SizedBox.shrink();
  }
}
