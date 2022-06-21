import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../app_theme.dart';
import 'package:geolocator/geolocator.dart';

class MapEditLocationPin extends StatefulWidget {
  const MapEditLocationPin({Key? key}) : super(key: key);

  @override
  State<MapEditLocationPin> createState() => _MapEditLocationPinState();
}

class _MapEditLocationPinState extends State<MapEditLocationPin> {
  GoogleMapController? mapController=null;
  Map<MarkerId, Marker> markers = {};
  var currentLocation;

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  LatLng _center = const LatLng(45.521563, -122.677433);

  @override
  void initState() {
    Get.log('vvvvv');
   getLocation();
  }
  _addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    MarkerId markerId = MarkerId(id);
    Marker marker =
    Marker(markerId: markerId, icon: descriptor, position: position);
    markers[markerId] = marker;
  }

  void _onMapCreated(GoogleMapController controller) {
    // mapController = controller;
    Get.log('xxxx   ');
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((currloc) {
      setState(() {
        Get.log('xxxx   '+currloc.toString());
        currentLocation = currloc;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return
      Container(
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
     child:
      SizedBox(
        height: 200,
        child:
        GoogleMap(
          onMapCreated: _onMapCreated,
          myLocationEnabled: true,
          initialCameraPosition:  CameraPosition(
          target: _center,
          zoom: 5.0,
        ),
          myLocationButtonEnabled: true,
          // markers: _markers,
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

  void getLocation() async{
    // permission = await Geolocator.requestPermission();
    Get.log('xxxx2   ');
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((currloc) {
      setState(() {
        Get.log('xxxx   '+currloc.toString());
        currentLocation = currloc;
      });
    }).catchError((err)=>Get.log('xxx '+err.toString())
    );
  }





}
