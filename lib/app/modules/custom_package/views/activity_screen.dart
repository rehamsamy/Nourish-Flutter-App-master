//
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/data/models/create_package_model.dart';
import 'package:nourish_sa/app/data/models/experience_model.dart';
import 'package:nourish_sa/app/data/remote_data_sources/create_package_apis.dart';
import 'package:nourish_sa/app/data/remote_data_sources/experience_apis.dart';
import 'package:nourish_sa/app/modules/custom_package/controllers/custom_package_controller.dart';
import 'package:nourish_sa/app/shared/custom_button.dart';
import 'package:nourish_sa/app_theme.dart';

import '../../../data/services/analytics_service.dart';
import 'calcuation_screen.dart';
import 'result_screen.dart';

class ActivityScreen extends GetView<CustomPackageController> {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int selectedExper = 1;
    return Scaffold(
      appBar: AppBar(
        title: Text('${LocalKeys.kStep.tr} 5 ${LocalKeys.kOf.tr} 7'),
        centerTitle: true,
        elevation: 0,
        shadowColor: const Color(0xff000000).withOpacity(0.3),
      ),
      body: GetBuilder<CustomPackageController>(
        builder: (_) => SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 80.h,
                  ),
                  Text(
                    LocalKeys.kActiveAreYou.tr,
                    style: Get.textTheme.bodyText1,
                  ),
                  FutureBuilder(
                      future: ExperienceApis().getExperience(),
                      builder: (_, snap) {
                        if (snap.hasData) {
                          List<ExperienceItem> list =
                              snap.data as List<ExperienceItem>;
                          Get.log('cccc   ' + list.length.toString());
                          if (list.isNotEmpty) {
                            return ListView.builder(
                                shrinkWrap: true,
                                itemCount: list.length,
                                itemBuilder: (_, index) {
                                  return InkWell(
                                    onTap: () {
                                      selectedExper = list[index].id ?? 1;
                                      //  controller.setExperienceSelect(true);
                                      controller.setExperienceSelect(
                                          true, index);
                                      Get.log('cccc   ' +
                                          controller.experienceIndex
                                              .toString());
                                    },
                                    child: ActivityAnswer(
                                      title: list[index].key ?? '',
                                      isSelected: true,
                                    ),
                                  );
                                });
                          } else {
                            return const SizedBox(
                              height: 200,
                              child: Center(
                                child: Text('no experience found'),
                              ),
                            );
                          }
                        } else {
                          Get.log('cccc   ' +
                              controller.experienceIndex.toString());
                          return const SizedBox(
                            height: 200,
                          );
                        }
                      }),
                  SizedBox(
                    height: 123.h,
                  ),
                  CustomButton(
                    title: LocalKeys.kContinue.tr,
                    onPress: () async {
                      CreatePackageModel? packageModel =
                          await CreatePackageApis().createPackage(
                              gender:
                                  controller.isMaleSelected ? 'male' : 'female',
                              experience_id: selectedExper,
                              date_of_birth: controller.birtdate ?? '',
                              height: int.parse(
                                  controller.heightTextEditingController.text),
                              height_unit: controller.isFeetSelected.value
                                  ? 'feet'
                                  : 'cm',
                              weight: int.parse(
                                  controller.weightTextEditingController.text),
                              weight_unit: controller.isPoundSelected.value
                                  ? 'pound'
                                  : 'kg',
                              goal: 'lose_weight',
                              meals: 1);

                      if (packageModel?.data != null) {
                        AnalyticsService.instance.logEvent("Calculation_View");

                        Get.to(const CalcuationScreen(),
                            arguments: {'packageModel': packageModel});
                      }
                    },
                  ),
                  SizedBox(
                    height: 111.h,
                  ),
                ],
              )
              // Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     SizedBox(
              //       height: 80.h,
              //     ),
              //     Text(
              //       LocalKeys.kActiveAreYou.tr,
              //       style: Get.textTheme.bodyText1,
              //     ),
              //     ActivityAnswer(
              //       title: LocalKeys.kNoExperience.tr,
              //     ),
              //     ActivityAnswer(
              //       title: LocalKeys.kLightExercise.tr,
              //       isSelected: true,
              //     ),
              //     ActivityAnswer(
              //       title: LocalKeys.kModerateExercise.tr,
              //     ),
              //     ActivityAnswer(
              //       title: LocalKeys.kHardExercise.tr,
              //     ),
              //     ActivityAnswer(
              //       title: LocalKeys.kExtremelyActive.tr,
              //     ),
              //     SizedBox(
              //       height: 123.h,
              //     ),
              //     CustomButton(
              //       title: LocalKeys.kContinue.tr,
              //       onPress: () {
              //         Get.to(const CalcuationScreen());
              //       },
              //     ),
              //     SizedBox(
              //       height: 111.h,
              //     ),
              //   ],
              // ),
              ),
        ),
      ),
    );
  }
}

class ActivityAnswer extends StatelessWidget {
  const ActivityAnswer({required this.title, this.isSelected = false, Key? key})
      : super(key: key);
  final String title;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 358.w,
      margin: EdgeInsets.only(top: 24.h),
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.w),
        border: Border.all(
          color: isSelected ? primaryColor : blueGreyColor,
          width: isSelected ? 2.w : 1.w,
        ),
      ),
      child: Text(
        title,
        style: Get.textTheme.headline3!.copyWith(color: blackColor),
      ),
    );
  }
}
