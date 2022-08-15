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
  Future<List<BranchItem>>? getAllBranches;
  GoogleMapController? mapController;
  void setBranch(int id) {
    branchId = id;
    update();
  }

  @override
  void onInit() {
    getAllBranches = getBranches(false);
    super.onInit();
  }

  var selectedPlanType = "";

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);

    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width * 2, targetHeight: width * 2);

    ui.FrameInfo fi = await codec.getNextFrame();

    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  Future<List<BranchItem>> getBranches(bool getAll) async {
    var branchIcon =
        await getBytesFromAsset('assets/images/restaurant_location.png', 100);
    selectedPlanType = PackageDetailsController.selectedPlanType;
    location = await PostionLocator.determinePosition();
    if (!getAll || selectedPlanType == "delivery") {
      branches = (await BranchApis().getBranches().then((value) async {
        value = value
            ?.where((element) =>
                element.coverageArea! <=
                calculateDistance(element.lat, element.lng))
            .toList();

        return value;
      }))!;
    } else {
      branches = (await BranchApis().getBranches())!;
    }
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
