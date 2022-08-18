import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/modules/package_details/controllers/package_details_controller.dart';
import 'package:nourish_sa/app/shared/dialogs/no_delivery_here_dialog.dart';
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
        future: controller.getAllBranches,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            controller.branches = snapshot.data!;
            Get.log(
                'Branches: ${controller.branches.length} -- Selected Plan ${controller.selectedPlanType}');
            return GetBuilder<BranchSelectController>(
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
                        myLocationEnabled: true,
                        myLocationButtonEnabled: true,
                        markers: controller.mapMarkers.toSet(),
                        //*TODO: Add a marker for the current location
                        onTap: controller.onMapTap,
                        initialCameraPosition: CameraPosition(
                            target: LatLng(controller.location?.latitude ?? 0,
                                controller.location?.longitude ?? 0),
                            zoom: 15)),
                  ),
                  Positioned(
                    top: 40,
                    left: 20,
                    child: TextButton.icon(
                        label: Text(LocalKeys.kBack.tr,
                            style: const TextStyle(color: Colors.black)),
                        icon: const Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Get.back();
                        }),
                  ),
                  if (controller.branches.isNotEmpty)
                    Positioned(
                      bottom: -1,
                      child: Container(
                        height: context.height * .33,
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
                                itemBuilder: (BuildContext context, int index) {
                                  //return branch item card
                                  return BranchSelectCard(
                                      title:
                                          controller.branches[index].address ??
                                              "",
                                      address: controller
                                              .branches[index].googleAddress ??
                                          "",
                                      onTap: () {
                                        controller.mapController?.animateCamera(
                                            CameraUpdate.newCameraPosition(
                                                CameraPosition(
                                          target: LatLng(
                                              controller.branches[index].lat ??
                                                  0,
                                              controller.branches[index].lng ??
                                                  0),
                                          zoom: 13,
                                        )));
                                        controller.setBranch(
                                            controller.branches[index].id ?? 0);
                                      },
                                      onContinue: () {
                                        controller.setBranch(
                                            controller.branches[index].id ?? 0);
                                        controller.selectedPlanType ==
                                                "delivery"
                                            ? Get.toNamed(
                                                Routes.DELIVERY_ADDRESSES)
                                            : Get.toNamed(Routes.DAYS_TIME);
                                      },
                                      selected:
                                          BranchSelectController.branchId ==
                                              controller.branches[index].id);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  else if (controller.selectedPlanType == "delivery")
                    Positioned(
                      bottom: -1,
                      child: Container(
                          height: context.height * .35,
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
                          child: NoDeliveryHereBottomSheet(
                            packageName:
                                PackageDetailsController.x?.data?.name ?? "",
                            packageType: PackageDetailsController
                                    .x?.data?.priceWithTax
                                    .toString() ??
                                "",
                            startDate: DateTime.now()
                                    .add(Duration(
                                        days: int.tryParse(PackageDetailsController
                                                    .x?.data?.daysBeforeStart ??
                                                "0") ??
                                            0))
                                    .year
                                    .toString() +
                                "/" +
                                DateTime.now()
                                    .add(Duration(
                                        days: int.tryParse(PackageDetailsController
                                                    .x?.data?.daysBeforeStart ??
                                                "0") ??
                                            0))
                                    .month
                                    .toString() +
                                "/" +
                                DateTime.now()
                                    .add(Duration(days: int.tryParse(PackageDetailsController.x?.data?.daysBeforeStart ?? "0") ?? 0))
                                    .day
                                    .toString(),
                            onBranchPress: () async {
                              PackageDetailsController.selectedPlanType =
                                  "pickup";
                              controller.selectedPlanType = "pickup";
                              controller.branches =
                                  (await controller.getBranches(true))!;
                              controller.update();
                            },
                          )),
                    )
                ],
              ),
            );
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
