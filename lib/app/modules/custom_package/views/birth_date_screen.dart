import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/assets.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/modules/custom_package/controllers/custom_package_controller.dart';
import 'package:nourish_sa/app/shared/custom_button.dart';

import '../../../../app_theme.dart';
import '../../../data/services/analytics_service.dart';
import 'height_screen.dart';

class BirthDateScreen extends GetView<CustomPackageController> {
  @override
  Widget build(BuildContext context) {
    String bithdate;
    return Scaffold(
      appBar: AppBar(
        title: Text('${LocalKeys.kStep.tr} 2 ${LocalKeys.kOf.tr} 7'),
        centerTitle: true,
        elevation: 0,
        shadowColor: const Color(0xff000000).withOpacity(0.3),
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
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  LocalKeys.kSelectbirthdate.tr,
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 7.h,
                  bottom: 17.h,
                ),
                child: Theme(
                  data: ThemeData(
                    colorScheme: const ColorScheme.light(
                      primary: primaryColor,
                    ),
                  ),
                  child: DateTimePicker(
                    type: DateTimePickerType.date,
                    firstDate: DateTime(1980),
                    lastDate: DateTime(2022),
                    dateMask: 'yyyy-MM-dd',
                    initialDate: DateTime(2010),
                    style: Theme.of(context).textTheme.bodyText2,
                    onChanged: (String dat) {
                      controller.setBirthdate(dat);
                    },
                    decoration: InputDecoration(
                      // hintText: LocalKeys.kBirthDate.tr,
                      hintStyle: Theme.of(context).textTheme.caption,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          10.r,
                        ),
                        borderSide: const BorderSide(
                          color: lightGreyColor,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          10.r,
                        ),
                        borderSide: const BorderSide(
                          color: lightGreyColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          10.r,
                        ),
                        borderSide: const BorderSide(
                          color: lightGreyColor,
                        ),
                      ),
                      suffixIconConstraints:
                          BoxConstraints(maxHeight: 27.h, maxWidth: 50.w),
                      suffixIcon: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: SvgPicture.asset(
                          Assets.kCalendar,
                          color: lightGreyColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              CustomButton(
                  title: LocalKeys.kContinue.tr,
                  onPress: () {
                    if (controller.birtdate != null) {
                      AnalyticsService.instance.logEvent("Height_View");

                      Get.to(() => HeightScreen());
                    } else {
                      Get.snackbar('required', 'You must enter the birthdate',
                          colorText: Colors.red);
                    }
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
