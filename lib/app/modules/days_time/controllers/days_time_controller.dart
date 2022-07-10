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

  void toggleSelection(int index) {
    if (selectedItems.contains(index)) {
      selectedItems.remove(index);
    } else {
      selectedItems.add(index);
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
