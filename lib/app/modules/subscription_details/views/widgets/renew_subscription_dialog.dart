import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/assets.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/shared/custom_button.dart';
import 'package:nourish_sa/app/shared/custom_input.dart';

import '../../../../../app_theme.dart';
import 'subscription_bordered_container.dart';

class RenewSubscriptionDialog extends StatelessWidget {
  const RenewSubscriptionDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      scrollable: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      content: Container(
        width: 362.w,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.symmetric(horizontal: 29.w, vertical: 34.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              LocalKeys.kRenew.tr + LocalKeys.kSubscription.tr,
              style: Get.textTheme.headline1,
            ),
            Padding(
              padding: EdgeInsets.only(top: 17.5.h, bottom: 45.h),
              child: SizedBox(
                width: Get.width,
                height: 2.h,
                child: OverflowBox(
                  maxWidth: 342.w,
                  minWidth: 342.w,
                  maxHeight: 2.h,
                  child: const Divider(
                    color: lightGreyColor,
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                LocalKeys.kRenewFrom.tr,
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
                    hintText: LocalKeys.kRenewFrom.tr,
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
            SizedBox(
              height: 8.h,
            ),
            SubscriptionBorderedContainer(
                child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 16.w,
                      height: 16.h,
                      padding: EdgeInsets.all(2.w),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: primaryColor,
                          )),
                      child: const CircleAvatar(
                        backgroundColor: primaryColor,
                      ),
                    ),
                    SizedBox(
                      width: 11.w,
                    ),
                    Text(
                      LocalKeys.kRenewWithSameDetails.tr,
                      style:
                          Get.textTheme.headline3!.copyWith(color: blackColor),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 7.5.h,
                  ),
                  child: const Divider(
                    color: lightGreyColor,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 16.w,
                      height: 16.h,
                      padding: EdgeInsets.all(2.w),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: primaryColor,
                          )),
                      child: const CircleAvatar(
                        backgroundColor: whiteColor,
                      ),
                    ),
                    SizedBox(
                      width: 11.w,
                    ),
                    Text(
                      LocalKeys.kRenewwithNewdetails.tr,
                      style:
                          Get.textTheme.headline3!.copyWith(color: blackColor),
                    ),
                  ],
                ),
              ],
            )),
            Padding(
              padding: EdgeInsets.only(
                top: 40.h,
              ),
              child: CustomButton(
                title: LocalKeys.kConfirm.tr,
                onPress: () {
                  Get.back();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
