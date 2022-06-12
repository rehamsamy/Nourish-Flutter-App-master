import 'package:date_time_picker/date_time_picker.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/app_constants.dart';
import 'package:nourish_sa/app/core/values/assets.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/shared/custom_button.dart';
import 'package:nourish_sa/app/shared/custom_dropdown.dart';
import 'package:nourish_sa/app/shared/custom_input.dart';
import 'package:nourish_sa/app_theme.dart';
import 'package:nourish_sa/routes/app_pages.dart';

import '../controllers/days_time_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DaysTimeView extends GetView<DaysTimeController> {
  const DaysTimeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Image.asset(
          Assets.kLogo,
          width: 95.w,
        ),
        centerTitle: true,
        backgroundColor: Get.theme.scaffoldBackgroundColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 27.w),
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                LocalKeys.kDays.tr,
                style: Get.textTheme.headline1,
              ),
            ),
            SizedBox(
              height: 27.h,
            ),
            SizedBox(
              width: Get.width,
              height: 44.w,
              child: OverflowBox(
                maxWidth: Get.width,
                minWidth: Get.width,
                child: SizedBox(
                  height: 44.w,
                  width: Get.width,
                  child: ListView.builder(
                    itemCount: AppConstants.days.length,
                    padding: EdgeInsetsDirectional.only(start: 22.w),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.w,
                        ),
                        child: Container(
                          width: 44.w,
                          height: 44.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.r),
                            color: AppConstants.days[index] == "Sat"
                                ? primaryColor
                                : whiteColor,
                            border: Border.all(
                              color: AppConstants.days[index] == "Sat"
                                  ? primaryColor
                                  : lightGreyColor,
                            ),
                          ),
                          child: Text(
                            AppConstants.days[index],
                            style: Get.textTheme.headline3!.copyWith(
                              color: AppConstants.days[index] == "Sat"
                                  ? whiteColor
                                  : lightGreyColor,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 35.h,
            ),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                LocalKeys.kStartingDay.tr,
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 7.h,
                bottom: 17.h,
              ),
              child: Theme(
                data: ThemeData(
                  colorScheme: const ColorScheme.light(
                    primary: primaryColor,
                  ),
                ),
                child: DateTimePicker(
                  type: DateTimePickerType.date,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                  dateMask: 'yyyy-MM-dd',
                  style: Theme.of(context).textTheme.bodyText2,
                  decoration: InputDecoration(
                    hintText:  LocalKeys.kStartingDay.tr,
                    hintStyle: Theme.of(context).textTheme.caption,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        10.r,
                      ),
                      borderSide: const BorderSide(
                        color: lightGreyColor,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        10.r,
                      ),
                      borderSide: const BorderSide(
                        color: lightGreyColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        10.r,
                      ),
                      borderSide: const BorderSide(
                        color: lightGreyColor,
                      ),
                    ),
                    suffixIconConstraints:
                        BoxConstraints(maxHeight: 27.h, maxWidth: 50.w),
                    suffixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: SvgPicture.asset(
                        Assets.kCalendar,
                        color: lightGreyColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            CustomDropDown(
              hintText: "",
              currentValue: "",
              items: [],
              width: 370.w,
              onChanged: (v) {},
              title: LocalKeys.kBranchTime.tr,
            ),
            const Spacer(),
            CustomButton(
              title: LocalKeys.kContinue.tr,
              onPress: () => Get.toNamed(Routes.PACKAGE_MEALS),
            ),
          ],
        ),
      ),
    );
  }
}
