import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/app_constants.dart';

import '../../../data/services/analytics_service.dart';

class DaysTimeController extends GetxController {
  final TextEditingController startDayController = TextEditingController();
  Color? mycolor;
  bool? isSelected;
  int? index;
  List<int> selectedItems = [];

  @override
  void onInit() {
    AnalyticsService.instance.logEvent("Days_Time_View");
    super.onInit();
  }

  String branchTimeSelectedValues = '';
  List branchDays = [
    'sunday',
    'monday',
    'tuesday',
    'wednesday',
    'thursday',
    'friday',
    'saturday',
  ];
  Map<String, dynamic> daysTimeSelectedValues = {};

  void toggleSelection(int index, String dayName) {
    if (selectedItems.contains(index)) {
      selectedItems.remove(index);
      daysTimeSelectedValues.remove(dayName);
    } else {
      selectedItems.add(index);
      daysTimeSelectedValues[dayName] = {
        'breakfast': [],
        'lunch': [],
        'dinner': [],
      };


    }
    update();
  }

  void toggleBranchTimeSelection(value) {
    if (branchTimeSelectedValues.contains(value)) {
      branchTimeSelectedValues = '';
    } else {
      branchTimeSelectedValues = value;
    }
    print(value);
    update();
  }
}
