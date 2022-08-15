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
                            zoomControlsEnabled: true,
                            zoomGesturesEnabled: true,
                            trafficEnabled: false,
                            mapToolbarEnabled: false,
                            buildingsEnabled: false,
                            myLocationButtonEnabled: true,
                            markers: controller.mapMarkers.toSet(),
                            initialCameraPosition: CameraPosition(
                                target: LatLng(
                                    controller.location?.latitude ?? 0,
                                    controller.location?.longitude ?? 0),
                                zoom: 15)),
                      ),
                      if (controller.branches.isNotEmpty)
                        Positioned(
                          bottom: -1,
                          child: Container(
                            height: context.height * .3,
                            width: context.width,
                            decoration: const BoxDecoration(
                              color: primaryColor,
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 32),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.location_pin,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(width: 8.0),
                                      Text("Near you",
                                          style: Get.textTheme.headline1
                                              ?.copyWith(color: Colors.white)),
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
                                          title: controller
                                                  .branches[index].address ??
                                              "",
                                          address: controller.branches[index]
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
                                            controller.setBranch(
                                                controller.branches[index].id ??
                                                    0);
                                          },
                                          onContinue: () {
                                            controller.setBranch(
                                                controller.branches[index].id ??
                                                    0);
                                            controller.selectedPlanType ==
                                                    "delivery"
                                                ? Get.toNamed(
                                                    Routes.DELIVERY_ADDRESSES)
                                                : Get.toNamed(Routes.DAYS_TIME);
                                          },
                                          selected: BranchSelectController
                                                  .branchId ==
                                              controller.branches[index].id);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      else
                        SizedBox(
                          height: context.height,
                          width: context.width,
                          child: Center(
                            child:
                                Text("Sorry, We don't deliver to your area yet",
                                    textAlign: TextAlign.center,
                                    style: Get.textTheme.headline1?.copyWith(
                                      color: Colors.white,
                                    )),
                          ),
                        ),
                      Positioned(
                        top: 10,
                        left: 10,
                        child: SafeArea(
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else if (controller.branches.isEmpty &&
                controller.selectedPlanType == "delivery") {
              return Column(
                children: [
                  SizedBox(
                    height: context.height,
                    width: context.width,
                    child: const Center(
                      child: Text(
                          "Sorry we don't deliver in your area yet , \n if you want to continue please select another plan",
                          style: TextStyle(color: Colors.red)),
                    ),
                  ),
                ],
              );
            } else {
              return Container();
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
