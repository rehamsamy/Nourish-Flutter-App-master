import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nourish_sa/app_theme.dart';
import 'package:nourish_sa/routes/app_pages.dart';

import '../../../data/models/branch_model.dart';
import '../../../shared/branch_select.dart';
import '../controllers/branch_select_controller.dart';

class BranchSelectView extends GetView<BranchSelectController> {
  const BranchSelectView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<BranchItem>?>(
        future: controller.getBranches(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            controller.branches = snapshot.data!;
            if (controller.branches.isNotEmpty) {
              return SizedBox(
                height: context.height,
                width: context.width,
                child: GetBuilder<BranchSelectController>(
                  builder: (controller) => Stack(
                    children: [
                      Positioned.fill(
                        child: GoogleMap(
                            onMapCreated: controller.onMapCreated,
                            mapType: MapType.normal,
                            liteModeEnabled: true,
                            zoomGesturesEnabled: true,
                            myLocationEnabled: true,
                            markers: controller.mapMarkers.toSet(),
                            initialCameraPosition: CameraPosition(
                                target: LatLng(
                                    controller.location?.latitude ?? 0,
                                    controller.location?.longitude ?? 0),
                                zoom: 15)),
                      ),
                      controller.branches.isNotEmpty
                          ? Positioned(
                              bottom: -1,
                              child: Container(
                                height: context.height * .25,
                                width: context.width,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 145, 0, 0),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 10,
                                      spreadRadius: 5,
                                      offset: Offset(
                                        -6,
                                        -5,
                                      ),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.location_pin,
                                            color: Colors.white,
                                          ),
                                          const SizedBox(width: 8.0),
                                          Text("Near you",
                                              style: Get.textTheme.headline1
                                                  ?.copyWith(
                                                      color: Colors.white)),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: ListView.separated(
                                        separatorBuilder: (context, index) =>
                                            const SizedBox(
                                          width: 8,
                                        ),
                                        scrollDirection: Axis.horizontal,
                                        itemCount: controller.branches.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          //return branch item card
                                          return BranchSelectCard(
                                              title: controller.branches[index]
                                                      .address ??
                                                  "",
                                              address: controller
                                                      .branches[index]
                                                      .googleAddress ??
                                                  "",
                                              onTap: () {
                                                controller.mapController
                                                    ?.animateCamera(CameraUpdate
                                                        .newCameraPosition(
                                                            CameraPosition(
                                                  target: LatLng(
                                                      controller.branches[index]
                                                              .lat ??
                                                          0,
                                                      controller.branches[index]
                                                              .lng ??
                                                          0),
                                                  zoom: 13,
                                                )));
                                                controller.setBranch(controller
                                                        .branches[index].id ??
                                                    0);
                                              },
                                              onContinue: () {
                                                controller.setBranch(controller
                                                        .branches[index].id ??
                                                    0);
                                                Get.toNamed(
                                                    Routes.DELIVERY_ADDRESSES);
                                              },
                                              selected: controller.branchId ==
                                                  controller
                                                      .branches[index].id);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Container(
                              decoration: const BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 10,
                                    spreadRadius: 5,
                                    offset: Offset(
                                      -6,
                                      -5,
                                    ),
                                  ),
                                ],
                              ),
                              height: context.height * .1,
                              width: context.width,
                              child: Center(
                                child: Text(
                                    "Sorry, We don't deliver to your area yet",
                                    style: Get.textTheme.headline1
                                        ?.copyWith(color: Colors.white)),
                              ),
                            ),
                    ],
                  ),
                ),
              );
            } else {
              return const SizedBox(
                child: Text("Sorry we don't deliver in your area",
                    style: TextStyle(color: Colors.red)),
              );
            }
          } else {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }
        },
      ),
    );
  }
}
