import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/data/models/branch_model.dart';
import 'package:nourish_sa/app/data/models/subscription_detail_model.dart';

import 'package:nourish_sa/app/data/services/analytics_service.dart';
import 'package:nourish_sa/app/data/services/locator_service.dart';

import '../../../data/remote_data_sources/branch_apis.dart';

class AddAddressController extends GetxController {
  TextEditingController addressName = TextEditingController();
  String addressType = "Home";
  TextEditingController area = TextEditingController();
  TextEditingController building = TextEditingController();
  TextEditingController flat = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController postalCode = TextEditingController();
  TextEditingController additionalNumber = TextEditingController();
  TextEditingController deliveryInstructions = TextEditingController();
  List<BranchItem> branches = [];
  Address? address;
  int branchId = 0;
  Position? location;
  setAddressData(newAddress) {
    address = newAddress;
    update();
  }

  @override
  void onInit() {
    AnalyticsService.instance.logEvent("Add_Address_View");
    super.onInit();
  }

  void setBranch(int id) {
    branchId = id;
    update();
  }

  Future<List<BranchItem>> getBranches() async {
    location = await PostionLocator.determinePosition();
    branches = (await BranchApis().getBranches().then((value) {
      return value
          ?.where((element) =>
              element.coverageArea! <
              calculateDistance(element.lat, element.lng))
          .toList();
    }))!;
    update();
    return branches;
  }

  double calculateDistance(lat2, lon2) {
    double lat1 = location!.latitude;
    double lon1 = location!.longitude;
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }
}
