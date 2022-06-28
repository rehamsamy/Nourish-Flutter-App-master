import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/modules/custom_package/controllers/custom_package_controller.dart';
import 'package:nourish_sa/app/modules/custom_package/views/selector_two_card.dart';
import 'package:nourish_sa/app/shared/custom_button.dart';
import 'package:nourish_sa/app/shared/custom_input.dart';
import 'package:nourish_sa/app_theme.dart';

import 'activity_screen.dart';

class WeightScreen extends GetView<CustomPackageController> {
  WeightScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title:  Text('${LocalKeys.kStep.tr} 4 ${LocalKeys.kOf.tr} 7'),
        centerTitle: true,
        elevation: 0,
        shadowColor: const Color(0xff000000).withOpacity(0.3),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: GetBuilder<CustomPackageController>(
          builder:(_)=>
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.w),
            child: Form(
              key: _key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 70.h,
                  ),
                  Text(
                    LocalKeys.kSelectweight.tr,
                    style: Get.textTheme.headline1,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 48.h, bottom: 28.h),
                    child:  SelectorTwoCard(
                      title: LocalKeys.kPound.tr,
                      secondTitle: LocalKeys.kKilogram.tr,
                      flag: 'weight', key: null,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: CustomInput(
                          hint: "0",
                          textEditingController: controller.weightTextEditingController,
                          textInputType: TextInputType.number,
                          width: 110.w,
                          validator: (val){
                          if (val!.trim().isEmpty) {
                            Get.snackbar('error', 'the weight is required');
                            return 'the weight is required';
                          }else if(int.parse(val.toString())<20 ||int.parse(val.toString())>400){
                            int  x=int.parse(val.toString());
                            Get.snackbar('error', 'the weight must be between 20 and 400 ');
                            return 'the weight must be between 20 and 400 ';
                          }

                          },
                        ),
                      ),
                      SizedBox(
                        width: 11.w,
                      ),
                      Text(
                        LocalKeys.kKg.tr,
                        style: Get.textTheme.headline3,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 131.h, bottom: 26.h),
                    child: Text(
                      LocalKeys.kTargetWeight.tr,
                      style: Get.textTheme.bodyText2,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 55.w,
                        height: 55.h,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: IconButton(
                          icon: Icon( Icons.remove, color: Colors.white, size: 25.r),
                          onPressed: () {
                            // if(controller.targetWeightTextEditingController.text !=null){
                            //   int x=int.parse(controller.targetWeightTextEditingController.text);
                            //   if(x==0){
                            //     x=0;
                            //   }
                            //   x--;
                            // }

                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14.w),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: darkGreyColor),
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          width: 146.w,
                          height: 55.h,
                          child: Stack(
                            children: [
                              PositionedDirectional(
                                end: 0,
                                width: 37.w,
                                height: 55.h,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 1.w,
                                      height: 55.h,
                                      color: darkGreyColor,
                                    ),
                                    SizedBox(
                                      width: 6.w,
                                    ),
                                    Text(
                                      LocalKeys.kKg.tr,
                                      style: Get.textTheme.headline3,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 110.w,
                                height: 55.h,
                                child: TextFormField(
                                  keyboardType:TextInputType.number,
                                  controller: controller.targetWeightTextEditingController,
                                  style: Theme.of(context).textTheme.bodyText2,
                                  validator: (val){
                                    if (val!.trim().isEmpty) {
                                      Get.snackbar('error', 'the  target weight is required');
                                      return 'the weight is required';
                                    }else if(int.parse(val.toString())<20 ||int.parse(val.toString())>400){
                                      int  x=int.parse(val.toString());
                                      Get.snackbar('error', 'the target weight must be between 20 and 400 ');
                                      return 'the target weight must be between 20 and 400 ';
                                    }
                                  },
                                  decoration: InputDecoration(
                                    hintText: "0",
                                    isCollapsed: true,
                                    border: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 12.w,
                                      vertical: 15.h,
                                    ),
                                  ),

                                  // inputFormatters: [
                                  //   FilteringTextInputFormatter.digitsOnly,
                                  // ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 55.w,
                        height: 55.h,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: IconButton(
                          icon: Icon( Icons.add, color: Colors.white, size: 25.r),
                          onPressed: () {
                            // if(controller.targetWeightTextEditingController.text !=null){
                            //   int x=int.parse(controller.targetWeightTextEditingController.text);
                            //   x++;
                            // }
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 157.h,
                  ),
                  CustomButton(
                      title: LocalKeys.kContinue.tr,
                      onPress: () {
                        if(_key.currentState!.validate()){
                          Get.to(ActivityScreen());
                        }

                      }),
                  SizedBox(
                    height: 111.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
