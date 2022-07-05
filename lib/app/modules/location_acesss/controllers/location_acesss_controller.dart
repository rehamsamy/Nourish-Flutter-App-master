import 'package:flutter/material.dart';
import 'package:geocoder2/geocoder2.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/values/localization/local_keys.dart';
import '../../../data/services/analytics_service.dart';

class LocationAcesssController extends GetxController {
  GoogleMapController? mapController;

  late GeoData address;

  Future<GeoData?> getLocation() async {
    //check if location is enabled
    bool geolocationStatus = await Geolocator.isLocationServiceEnabled();

    if (geolocationStatus) {
      //get current location
      Position position = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.best)
          .then((value) async {
        //currentLocation = position;

        address = await Geocoder2.getDataFromCoordinates(
            latitude: value.latitude,
            longitude: value.longitude,
            googleMapApiKey: "AIzaSyCXFEuYNLDNZVkJN3SwCeMNYiIbc4AJDG8");
        return value;
        //       .catchError((err) => Get.log('xxx  err 1 ' + err.toString()));
      });
      //save location to controller

      //navigate to Map Edit Location Page

    } else {
      //show error
      Future.delayed(const Duration(seconds: 3), () {
        Get.snackbar(
          LocalKeys.kError.tr,
          LocalKeys.kLocationAccessError.tr,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 3),
        );
      }).then((value) => Geolocator.openAppSettings());
    }

    //addressController.setAddressData(_address);
    Get.log('xxxx  city ' + address.toString());

    return address;
  }

  var onMapCreated;

  var center;

  var markers;
  @override
  void onInit() {
    super.onInit();
    AnalyticsService.instance.logEvent("Location_Access_View");
  }
}
