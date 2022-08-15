import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nourish_sa/app/modules/package_details/controllers/package_details_controller.dart';

import '../../../data/models/branch_model.dart';
import '../../../data/remote_data_sources/branch_apis.dart';
import '../../../data/services/locator_service.dart';

class BranchSelectController extends GetxController {
  List<BranchItem> branches = [];
  Position? location;
  var mapMarkers = <Marker>[];
  static int branchId = 1;
  GoogleMapController? mapController;
  void setBranch(int id) {
    branchId = id;
    update();
  }

  var selectedPlanType = "";

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);

    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);

    ui.FrameInfo fi = await codec.getNextFrame();

    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  Future<List<BranchItem>> getBranches() async {
    var branchIcon =
        await getBytesFromAsset('assets/images/resturntIcon.PNG', 100);
    selectedPlanType = PackageDetailsController.selectedPlanType;
    location = await PostionLocator.determinePosition();
    branches = (await BranchApis().getBranches().then((value) async {
      value = value
          ?.where((element) =>
              element.coverageArea! >
              calculateDistance(element.lat, element.lng))
          .toList();
      if (value?.isEmpty ?? false || selectedPlanType == "pickup") {
        value = await BranchApis().getBranches();
      }
      return value;
    }))!;
    mapMarkers.addAll(branches.map((e) {
      return Marker(
          icon: BitmapDescriptor.fromBytes(branchIcon),
          markerId: MarkerId(e.id.toString()),
          infoWindow: InfoWindow(
            title: e.name,
            snippet: e.address.toString(),
          ),
          position: LatLng(e.lat ?? 0, e.lng ?? 0));
    }).toList());
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

  Future onMapCreated(GoogleMapController controller) async {
    mapController = controller;

    update();
  }
}
