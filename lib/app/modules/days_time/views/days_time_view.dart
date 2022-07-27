import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/app_constants.dart';
import 'package:nourish_sa/app/core/values/assets.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/shared/custom_button.dart';
import 'package:nourish_sa/app/shared/custom_dropdown.dart';
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

            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                '${LocalKeys.kDaySelectCount.tr} ${controller.daysCount}',
                style: const TextStyle(fontSize: 12),
              ),
            ),
            SizedBox(
              height: 27.h,
            ),
            GetBuilder<DaysTimeController>(
              builder: (_) => SizedBox(
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
                        return InkWell(
                          onTap: () {
                            controller.toggleSelection(
                                index, controller.branchDays[index]);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 5.w,
                            ),
                            child: Container(
                              width: 44.w,
                              height: 44.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.r),
                                color: controller.selectedItems.contains(index)
                                    ? primaryColor
                                    : Colors.white,
                                border: Border.all(
                                  color:
                                      controller.selectedItems.contains(index)
                                          ? Colors.white
                                          : primaryColor,
                                ),
                              ),
                              child: Text(
                                AppConstants.days[index],
                                style: Get.textTheme.headline3!.copyWith(
                                  color:
                                      controller.selectedItems.contains(index)
                                          ? Colors.white
                                          : primaryColor,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
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
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                ' ${LocalKeys.kStartDayDate.tr} ${controller.daysStart}',
                style: const TextStyle(fontSize: 12),
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
                  onChanged: (val) {
                    DaysTimeController.startDate = val;
                    DateTime x = DateTime.parse(val);
                    final date2 = DateTime.now();
                    final difference = daysBetween(x, date2);
                    controller.differenceValue = difference;
                    Get.log('xxx      ${controller.daysStart}');
                  },
                  type: DateTimePickerType.date,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                  dateMask: 'yyyy-MM-dd',
                  style: Theme.of(context).textTheme.bodyText2,
                  decoration: InputDecoration(
                    hintText: LocalKeys.kStartingDay.tr,
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

            // DropdownButton<String>(
            //   items: branchTime.map((String value) {
            //     return DropdownMenuItem<String>(
            //       value: value,
            //       child: Text(value),
            //     );
            //   }).toList(),
            //   onChanged: (_) {},
            // ),
            SizedBox(
              width: Get.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(LocalKeys.kBranchTime.tr),
                  GetBuilder(
                      builder: (DaysTimeController controller) =>
                          CustomDropDown(
                              width: double.infinity,
                              items: controller.branchTime,
                              currentValue: controller.branchTimeSelectedValue,
                              values: controller.branchTime
                                  .map((e) => e.toString())
                                  .toList(),
                              title: (LocalKeys.kBranchTime.tr),
                              hintText: "Select Branch Time",
                              onChanged: (value) {
                                controller.branchTimeSelectedValue =
                                    value.toString();
                              })),
                ],
              ),
            ),
            const Spacer(),
            CustomButton(
              title: LocalKeys.kContinue.tr,
              onPress: () {
                if (controller.differenceValue < controller.daysStart!) {
                  Get.snackbar('Error',
                      'you must choose day after ${controller.daysStart} days');

                  return 0;
                }
                if (controller.daysCount > controller.selectedItems.length ||
                    controller.daysCount < controller.selectedItems.length) {
                  Get.snackbar(
                      'Error', 'you must choose  ${controller.daysCount} days');
                  return 0;
                }

                // print('1111  x ' + selectedDays.toString()+'      222   '+controller.selectedItems.toString());
                return Get.toNamed(Routes.PACKAGE_MEALS, arguments: {
                  'selectedDays': controller.daysTimeSelectedValues
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    Get.log('from  $from   to  $to');
    return (from.difference(to).inHours / 24).round();
  }

  // getSelectedDays(){
  //   selectedDays.add(AppConstants.days.elementAt(controller.))
  // }

}
