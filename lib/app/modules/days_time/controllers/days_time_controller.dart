import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/branch_model.dart';
import '../../../data/models/package_detail_model.dart';
import '../../../data/services/analytics_service.dart';
import '../../package_details/views/package_details_view.dart';

class DaysTimeController extends GetxController {
  final TextEditingController startDayController = TextEditingController();
  Color? mycolor;
  bool? isSelected;
  int? index;
  List<int> selectedItems = [];

  @override
  void onInit() {
    super.onInit();
    AnalyticsService.instance.logEvent("Days_Time_View");
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
      branchTimeIds = packageDetailModel?.data?.branches?[0].pickupPeriods
          ?.map((e) => e.id)
          .toList();
      branchTimeSelectedValue = branchTime[0];
    }
  }

  String branchTimeSelectedValue = '';
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
    if (branchTimeSelectedValue.contains(value)) {
      branchTimeSelectedValue = '';
    } else {
      branchTimeSelectedValue = value;
    }
    update();
  }

  //---------------------------------------------------------------------------------------------------------------------
  PackageDetailModel? packageDetailModel;
  // static List<String> selectedDays = [];
  int daysCount = 0;
  int? daysStart;
  List<BranchItem>? branches;
  List<String> selectedDays = [];
  List<String> branchTime = [];
  List<int?>? branchTimeIds = [];
  int differenceValue = 0;
  static int? selectedBranchPeriodId;
  static String? startDate;
}
