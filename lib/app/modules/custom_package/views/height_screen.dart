import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/modules/custom_package/controllers/custom_package_controller.dart';
import 'package:nourish_sa/app/modules/custom_package/views/selector_two_card.dart';
import 'package:nourish_sa/app/shared/custom_button.dart';
import 'package:nourish_sa/app/shared/custom_input.dart';
import 'package:nourish_sa/app_theme.dart';

import 'weight_screen.dart';

class HeightScreen extends GetView<CustomPackageController> {
  HeightScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('${LocalKeys.kStep.tr} 3 ${LocalKeys.kOf.tr} 7'),
        centerTitle: true,
        shadowColor: const Color(0xff000000).withOpacity(0.3),
        elevation: 0,
      ),
      body: GetBuilder<CustomPackageController>(
        builder: (_) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 35.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 70.h,
              ),
              Text(
                LocalKeys.kSelectheight.tr,
                style: Get.textTheme.headline1,
              ),
              Padding(
                padding: EdgeInsets.only(top: 55.h, bottom: 44.h),
                child: SelectorTwoCard(
                  title: LocalKeys.kFeet.tr,
                  secondTitle: LocalKeys.kCentimetre.tr,
                 flag: 'height', key: null,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomInput(
                    hint: "",
                    textInputType: TextInputType.number,
                    textEditingController: controller.heightTextEditingController,
                    validator: (val) {
                      if (double.parse(val!) < 20 || double.parse(val) > 300) {
                        return 'the height must be between 20 and 300 ';
                      }
                    },
                    width: 110.w,
                  ),
                  SizedBox(
                    width: 11.w,
                  ),
                  Text(
                    LocalKeys.kCm.tr,
                    style: Get.textTheme.headline3,
                  ),
                ],
              ),
              const Spacer(),
              CustomButton(
                  title: LocalKeys.kContinue.tr,
                  onPress: () {
                    Get.to(WeightScreen());
                  }),
              SizedBox(
                height: 111.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
