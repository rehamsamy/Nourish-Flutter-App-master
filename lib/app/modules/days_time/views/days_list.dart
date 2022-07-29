import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app_theme.dart';

import '../../../core/values/app_constants.dart';
import '../controllers/days_time_controller.dart';

class DaySelectionList extends StatelessWidget {
  const DaySelectionList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DaysTimeController>(
      builder: (controller) => SizedBox(
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
                return GetBuilder<DaysTimeController>(
                  builder: (controller) => DaySelectionWidget(
                    title: AppConstants.days[index],
                    isSelected: controller.selectedItems.contains(index),
                    onTap: () => controller.toggleSelection(
                        index, controller.branchDays[index]),
                    isOffDay: false,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class DaySelectionWidget extends StatelessWidget {
  DaySelectionWidget(
      {Key? key,
      required this.onTap,
      required this.isOffDay,
      required this.isSelected,
      required this.title})
      : super(key: key);
  final void Function()? onTap;
  bool isOffDay;
  bool isSelected;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: !isOffDay ? onTap : () {},
      /* () {
        controller.toggleSelection(
            index, controller.branchDays[index]);
      }, */
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
            color: isOffDay
                ? Colors.grey
                : isSelected
                    ? primaryColor
                    : Colors
                        .white /*  , controller.selectedItems.contains(index)
                ? primaryColor
                : Colors.white, */
            ,
            border: Border.all(
                color: isOffDay
                    ? Colors.grey
                    : isSelected
                        ? Colors.white
                        : primaryColor /*  controller.selectedItems.contains(index)
                  ? Colors.white
                  : primaryColor, */
                ),
          ),
          child: Text(
            title /*  AppConstants.days[index] */,
            style: Get.textTheme.headline3!.copyWith(
                color: isOffDay
                    ? Colors.white
                    : isSelected
                        ? Colors.white
                        : primaryColor /*  controller.selectedItems.contains(index)
                  ? Colors.white
                  : primaryColor, */
                ),
          ),
        ),
      ),
    );
  }
}
