import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/services/analytics_service.dart';

class DaysTimeController extends GetxController {
  final TextEditingController startDayController = TextEditingController();
  Color? mycolor;
  bool? isSelected;
  int? index;
  List<String> selectedDays = [];
  List<int> selectedItems = [];
  @override
  void onInit() {
    AnalyticsService.instance.logEvent("Days_Time_View");
    super.onInit();
  }

  List branchTimeSelectedValues = [];
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
        'breakfast': 0,
        'lunch': 0,
        'dinner': 0,
      };
      print(daysTimeSelectedValues);
    }
    update();
  }

  void toggleBranchTimeSelection(value) {
    if (branchTimeSelectedValues.contains(value)) {
      branchTimeSelectedValues.remove(value);
    } else {
      branchTimeSelectedValues.add(value);
    }
    print(value);
    update();
  }
}
