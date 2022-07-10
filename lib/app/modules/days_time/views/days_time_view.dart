import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/app_constants.dart';
import 'package:nourish_sa/app/core/values/assets.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/data/models/branch_model.dart';
import 'package:nourish_sa/app/data/models/package_detail_model.dart';
import 'package:nourish_sa/app/modules/package_details/views/package_details_view.dart';
import 'package:nourish_sa/app/shared/custom_button.dart';
import 'package:nourish_sa/app_theme.dart';
import 'package:nourish_sa/routes/app_pages.dart';
import '../controllers/days_time_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DaysTimeView extends GetView<DaysTimeController> {
  // DaysTimeView({Key? key}) : super(key: key);
  PackageDetailModel? packageDetailModel;
  int daysCount = 0;
  int? daysStart;
  List<BranchItem>? branches;
  List<String> selectedDays = [];
  List<String> branchTime = [];

  @override
  Widget build(BuildContext context) {
    packageDetailModel = PackageDetailsView.packageDetailModel;
    daysCount = packageDetailModel?.data?.daysNumberOfWeek ?? 0;
    branches = packageDetailModel?.data?.branches;
    daysStart = int.parse(packageDetailModel?.data?.daysBeforeStart ?? '');
    branchTime.clear();
    int length = packageDetailModel?.data?.branches?.length ?? 0;
    if (length > 0) {
      packageDetailModel?.data?.branches?[0].pickupPeriods
          ?.map((e) => branchTime.add(e.period ?? ''))
          .toList();
      Get.log('sizee 1   ' +
          (branches?[0].pickupPeriods?.length.toString()).toString() +
          '  ${branchTime.length}');
    }
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
                            controller.toggleSelection(index);
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
                    DateTime x = DateTime.parse(val);
                    final date2 = DateTime.now();
                    final difference = daysBetween(x, date2);
                    Get.log('xxx      $daysStart');
                    if (difference < daysStart!) {
                      Get.snackbar(
                          'Error', 'you must choose day after $daysStart days');
                    }
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
                children: [
                  Text(LocalKeys.kBranchTime.toString()),
                  GetBuilder(
                    builder: (DaysTimeController controller) => Wrap(
                      spacing: 10.w,
                      runSpacing: 10.w,
                      children: branchTime
                          .map((String value) => FilterChip(
                                label: Text(value,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    )),
                                selectedColor: primaryColor,
                                backgroundColor: Colors.grey,
                                selected: controller.branchTimeSelectedValues
                                    .contains(value),
                                onSelected: (l) {
                                  controller.toggleBranchTimeSelection(value);
                                },
                              ))
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),
            CustomButton(
              title: LocalKeys.kContinue.tr,
              onPress: () {
                return Get.toNamed(Routes.PACKAGE_MEALS,
                    arguments: {'selectedDays': selectedDays});
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
