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
                  init: DaysTimeController(),
                  initState: (_) {},
                  builder: (_) {
                    return DaySelectionWidget(
                      isSelected: controller.selectedItems.contains(index),
                      title: AppConstants.days.elementAt(index),
                      onTap: () {
                        controller.toggleSelection(
                            index, controller.branchDays[index]);
                      },
                      //TODO: Implement this OFF BRANCH DAYS From HOME SETTINGS API in HOME DIRECTORY
                      isSelectionEnabled: false,
                    );
                  },
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
      required this.isSelectionEnabled,
      required this.isSelected,
      required this.title})
      : super(key: key);
  final void Function()? onTap;
  bool isSelectionEnabled;
  bool isSelected;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isSelectionEnabled ? onTap : () {},
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
            color: !isSelectionEnabled
                ? Colors.grey
                : isSelected
                    ? primaryColor
                    : Colors
                        .white /*  , controller.selectedItems.contains(index)
                ? primaryColor
                : Colors.white, */
            ,
            border: Border.all(
                color: !isSelectionEnabled
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
                color: !isSelectionEnabled
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
