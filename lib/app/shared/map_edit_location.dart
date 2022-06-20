import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nourish_sa/app/core/values/assets.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';

import '../../app_theme.dart';
import 'package:geolocator/geolocator.dart';

class MapEditLocationPin extends StatefulWidget {
  const MapEditLocationPin({Key? key}) : super(key: key);

  @override
  State<MapEditLocationPin> createState() => _MapEditLocationPinState();
}

class _MapEditLocationPinState extends State<MapEditLocationPin> {
  GoogleMapController? mapController=null;
  var currentLocation;

  LatLng _center = const LatLng(45.521563, -122.677433);

  @override
  void initState() {
    _onMapCreated(mapController!);
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((currloc) {
      setState(() {
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
      GoogleMap(
        onMapCreated: _onMapCreated,
        myLocationEnabled: true,
        initialCameraPosition:  CameraPosition(
        target: _center,
        zoom: 5.0,
      ),
        myLocationButtonEnabled: true,

        // markers: Set<Marker>.of(markers.values),
        // // markers: _markers,
        // //  polylines:_polyline,
        // initialCameraPosition: CameraPosition(
        //   target: _center,
        //   zoom: 5.0,
        // ),

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
}
