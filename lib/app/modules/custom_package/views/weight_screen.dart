import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/modules/custom_package/views/selector_two_card.dart';
import 'package:nourish_sa/app/shared/custom_button.dart';
import 'package:nourish_sa/app/shared/custom_input.dart';
import 'package:nourish_sa/app_theme.dart';

import 'activity_screen.dart';

class WeightScreen extends StatelessWidget {
  WeightScreen({Key? key}) : super(key: key);
  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _textEditingControllerx = TextEditingController();

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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 35.w),
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
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: CustomInput(
                      hint: "0",
                      textEditingController: _textEditingController,
                      width: 110.w,
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
                    child: Icon(
                      Icons.remove,
                      color: Colors.white,
                      size: 25.r,
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
                              controller: _textEditingControllerx,
                              style: Theme.of(context).textTheme.bodyText2,
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
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
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
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 25.r,
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
                    Get.to(ActivityScreen());
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
