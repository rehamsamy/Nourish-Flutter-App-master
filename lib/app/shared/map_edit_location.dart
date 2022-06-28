import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoder2/geocoder2.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../app_theme.dart';

class MapEditLocationPin extends StatefulWidget {
  const MapEditLocationPin({Key? key}) : super(key: key);

  @override
  State<MapEditLocationPin> createState() => _MapEditLocationPinState();
}

class _MapEditLocationPinState extends State<MapEditLocationPin> {
  GeoData? geoCode;
  late LocationPermission permission;
  GoogleMapController? mapController;
  Set<Marker> markers = {};
  String? city;
  var currentLocation;
  GeoData? _address;
  LatLng showLocation = const LatLng(27.7089427, 85.3086209);

  Completer<GoogleMapController> _controller = Completer();

  LatLng _center = const LatLng(45.521563, -122.677433);

  @override
  void initState() {
    super.initState();
    getLocation();
    markers.add(Marker(
      //add marker on google map
      markerId: MarkerId(currentLocation.toString()),
      position: _center, //position of marker
      infoWindow: const InfoWindow(
        //popup info
        title: 'My Custom Title ',
        snippet: 'My Custom Subtitle',
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));

    try {
      // Address address1= await address as Address;
      // Get.log('xxxx   '+address1.streetNumber.toString());
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370.w,
      margin: EdgeInsets.only(bottom: 17.w),
      padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 14.w),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(7.r),
        border: Border.all(color: lightGreyColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.16),
            offset: const Offset(0, 3),
            blurRadius: 6,
          )
        ],
      ),
      child: SizedBox(
        height: 200,
        child: GoogleMap(
          zoomGesturesEnabled: false,
          compassEnabled: false,
          buildingsEnabled: false,
          liteModeEnabled: true,
          mapToolbarEnabled: false,
          indoorViewEnabled: false,
          rotateGesturesEnabled: false,
          zoomControlsEnabled: false,
          trafficEnabled: false,
          tiltGesturesEnabled: false,
          scrollGesturesEnabled: false,
          onTap: (value) {
            Get.to(() => _expandedMap());
          },
          onMapCreated: _onMapCreated,
          myLocationEnabled: true,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 5.0,
          ),
          myLocationButtonEnabled: true,
          markers: markers,
        ),
      ),
      // Column(
      //   children: [
      //     Image.asset(
      //       Assets.kdropPin,
      //       width: 342.w,
      //       fit: BoxFit.fitWidth,
      //     ),
      //     SizedBox(
      //       height: 13.h,
      //     ),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         Row(
      //           children: [
      //             SvgPicture.asset(
      //               Assets.kLocationIcon,
      //               width: 17.w,
      //               height: 19.h,
      //
      //             ),
      //             SizedBox(
      //               width: 10.w,
      //             ),
      //             Text(
      //               LocalKeys.kEditLocationPin.tr,
      //               style: Get.textTheme.headline3,
      //             ),
      //           ],
      //         ),
      //         Icon(
      //           Icons.arrow_forward_ios_outlined,
      //           size: 10.r,
      //           color: blueGreyColor,
      //         ),
      //       ],
      //     )
      //   ],
      // ),
    );
  }

  Widget _expandedMap() => GoogleMap(
        zoomGesturesEnabled: true,
        compassEnabled: true,
        buildingsEnabled: true,
        liteModeEnabled: true,
        mapToolbarEnabled: true,
        indoorViewEnabled: true,
        rotateGesturesEnabled: true,
        zoomControlsEnabled: true,
        trafficEnabled: true,
        tiltGesturesEnabled: true,
        scrollGesturesEnabled: true,
        onMapCreated: _onMapCreated,
        myLocationEnabled: true,
        onTap: (latLng) {
          getLocation();
        },
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 5.0,
        ),
        myLocationButtonEnabled: true,
        markers: markers,
        mapType: MapType.normal,
      );

  getLocation() async {
    permission = await Geolocator.requestPermission();
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((currloc) async {
      setState(() {
        currentLocation = currloc;

        mapController?.animateCamera(CameraUpdate.newLatLngZoom(
            LatLng(currentLocation.latitude, currentLocation.longitude), 18));
        _center = LatLng(currentLocation.latitude, currentLocation.longitude);
      });
     _address=  await Geocoder2.getDataFromCoordinates(
          latitude: currentLocation.latitude,
          longitude: currentLocation.longitude,
          googleMapApiKey: "AIzaSyCXFEuYNLDNZVkJN3SwCeMNYiIbc4AJDG8").
      catchError((err) => Get.log('xxx  err 1 ' + err.toString()));
      print(_address);

      // geoCode.reverseGeocoding(latitude: currentLocation.latitude,
      //     longitude: currentLocation.longitude)
      //     .then((value) {
      //       setState(() {
      //         city=value.toString();
      //       });
      // }).catchError((error)=>print('hhhhhhhhhhhhh'+error));

      Get.log('xxxx  city ' + city.toString());
    }).catchError((err) => Get.log('xxx  err  ' + err.toString()));
    // return _address;
  }
}
