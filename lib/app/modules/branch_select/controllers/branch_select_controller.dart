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
  Marker _selectedMarker = const Marker(
    markerId: MarkerId('selected'),
    position: LatLng(0, 0),
    infoWindow: InfoWindow(title: 'Selected'),
  );
  static int branchId = 1;
  Future<List<BranchItem>?>? getAllBranches;
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

  Future<List<BranchItem>?> getBranches(bool getAll) async {
    var branchIcon =
        await getBytesFromAsset('assets/images/restaurant_location.png', 100);
    selectedPlanType = PackageDetailsController.selectedPlanType;
    location = await PostionLocator.determinePosition();
    if (getAll) {
      branches = (await BranchApis().getBranches())!;
    } else if (selectedPlanType == "delivery") {
      branches = (await BranchApis().getBranches().then((value) async {
        value = value
            ?.where((element) =>
                element.coverageArea! >=
                calculateDistance(
                  element.lat,
                  element.lng,
                ))
            .toList();

        return value;
      }))!;
    } else {
      branches = (await BranchApis().getBranches())!;
    }
    _selectedMarker = Marker(
        markerId: const MarkerId('selected'),
        position: LatLng(location?.latitude ?? 0, location?.longitude ?? 0),
        infoWindow: const InfoWindow(title: 'Your Location'));

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
    mapMarkers.add(_selectedMarker);
    update();
    return branches;
  }

  double calculateDistance(lat2, lon2, [lat1 = 0, lon1 = 0]) {
    if (lat1 == 0 && lon1 == 0) {
      lat1 = location?.latitude ?? 0;
      lon1 = location?.longitude ?? 0;
    }

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

  void onMapTap(LatLng position) async {
    mapController?.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: position, zoom: 15)));
    mapMarkers.remove(_selectedMarker);
    _selectedMarker = Marker(
        markerId: const MarkerId('selected'),
        position: position,
        infoWindow: const InfoWindow(title: 'Selected'));
    mapMarkers.add(_selectedMarker);
    branches = (await BranchApis().getBranches().then((value) async {
      value = value
          ?.where((element) =>
              element.coverageArea! >=
              calculateDistance(element.lat, element.lng, position.latitude,
                  position.longitude))
          .toList();

      return value;
    }))!;
    update();
  }
}
