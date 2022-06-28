import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocode/geocode.dart';
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
  GeoCode geoCode = GeoCode();
  late LocationPermission permission;
  GoogleMapController? mapController = null;
  Set<Marker> markers = Set();
  String? city;
  var currentLocation;
  Future<Address>? _address;
  LatLng showLocation = LatLng(27.7089427, 85.3086209);

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
    Get.log('vvvvv' + _address.toString());

    markers.add(Marker(
      //add marker on google map
      markerId: MarkerId(currentLocation.toString()),
      position: _center, //position of marker
      infoWindow: InfoWindow(
        //popup info
        title: 'My Custom Title ',
        snippet: 'My Custom Subtitle',
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));

    try {
      Get.log('xxxx   ');
      geoCode
          .reverseGeocoding(
              latitude: currentLocation.latitude,
              longitude: currentLocation.longitude)
          .then((value) => print(value.toString()));
      // Address address1= await address as Address;
      // Get.log('xxxx   '+address1.streetNumber.toString());
    } catch (e) {
      print(e);
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

  getLocation() async {
    permission = await Geolocator.requestPermission();
    Get.log('xxxx2   ');
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((currloc) async {
      setState(() {
        currentLocation = currloc;
        Get.log('xxxx   1  ' + currloc.toString());
        _address = geoCode.reverseGeocoding(
            latitude: currloc.latitude, longitude: currloc.longitude);
        _address
            ?.then((value) => Get.log('xxxx   2  ' + value.toString()))
            .catchError((err) => Get.log('xxxx   2  ' + err.toString()));
        Get.log('xxxx   2  ');
        mapController?.animateCamera(CameraUpdate.newLatLngZoom(
            LatLng(currentLocation.latitude, currentLocation.longitude), 14));
      });

      // geoCode.reverseGeocoding(latitude: currentLocation.latitude,
      //     longitude: currentLocation.longitude)
      //     .then((value) {
      //       setState(() {
      //         city=value.toString();
      //       });
      // }).catchError((error)=>print('hhhhhhhhhhhhh'+error));

      Get.log('xxxx  city ' + city.toString());
    }).catchError((err) => Get.log('xxx  err' + err.toString()));
    // return _address;
  }
}
