import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/data/models/package_filter_model.dart';
import 'package:nourish_sa/app/data/remote_data_sources/home_apis.dart';
import 'package:nourish_sa/app/data/remote_data_sources/package_apis.dart';
import 'package:nourish_sa/app/modules/home_screen/controllers/home_screen_controller.dart';
import 'package:nourish_sa/app/shared/custom_button.dart';
import 'package:nourish_sa/app_theme.dart';

import '../custom_dropdown.dart';
import '../range_slider.dart';

class FilterDialog extends GetView<HomeScreenController> {
  const FilterDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
      builder: (_)=> AlertDialog(
        scrollable: true,
        contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        content: SizedBox(
          child: Column(
            children: [
              Container(
                width: 350.w,
                height: 55.h,
                color: primaryColor,
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LocalKeys.kFilters.tr,
                      style: Get.textTheme.headline1!.copyWith(color: whiteColor),
                    ),
                    InkWell(
                      onTap: () => Get.back(),
                      child: Icon(
                        Icons.close,
                        size: 25.r,
                        color: whiteColor,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 21.w),
                child: Column(
                  children: [
                    SizedBox(height: 40,),
                    // Padding(
                    //   padding: EdgeInsets.only(top: 30.h, bottom: 17.h),
                    //   child: CustomDropDown(
                    //     currentValue: "hhhhhhhhhh",
                    //     title: LocalKeys.kDuration.tr,
                    //     items: const [],
                    //     hintText: "",
                    //     onChanged: (v) {},
                    //     width: 295.w,
                    //   ),
                    // ),
                    CustomDropDown(
                      title: LocalKeys.kListOfCategory.tr,
                      items: ['weakly', 'monthly'],
                      // values: ['weakly','monthly'],
                      hintText: "",
                      onChanged: (v) {
                        controller.changePackageFilterType(v ?? '');
                      },
                      width: 295.w,
                      currentValue: controller.packageFilterType,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 9.h),
                      child: SizedBox(
                        width: 295.w,
                        child: Text(
                          LocalKeys.kPriceRange.tr,
                          style: Theme
                              .of(context)
                              .textTheme
                              .headline3,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 120.h,
                      width: 350.w,
                      child: const RangeSliderPicker(),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomButton(
                      title: LocalKeys.kContinue.tr,
                      onPress: () async {
                        controller.changeIsFilterSelected(true);
                        RangeValues? x = RangeSliderPickerState
                            .selectedRangeValues;
                        HomeApis().getFilterPackages(controller.packageFilterType, RangeSliderPickerState.selectedRangeValues?.start,
                            RangeSliderPickerState.selectedRangeValues?.end).then((value) {
                              controller.tooglePackageList(value!);
                        });
                        Get.back();
                      },
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
