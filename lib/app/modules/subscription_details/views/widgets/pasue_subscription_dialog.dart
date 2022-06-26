import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/assets.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/data/models/pause_subscription_model.dart';
import 'package:nourish_sa/app/data/remote_data_sources/sbscription_apis.dart';
import 'package:nourish_sa/app/shared/custom_button.dart';
import 'package:nourish_sa/app/shared/custom_input.dart';

import '../../../../../app_theme.dart';

class PauseSubscriptionDialog extends StatefulWidget {
  const PauseSubscriptionDialog({Key? key}) : super(key: key);

  @override
  State<PauseSubscriptionDialog> createState() => _PauseSubscriptionDialogState();
}

class _PauseSubscriptionDialogState extends State<PauseSubscriptionDialog> {
  String ?first;
  String ?resume;
  @override
  Widget build(BuildContext context) {
    Map args = Get.arguments ?? {};
    int subscripId=args['subscripId'];
    Get.log('subscripId    => '+subscripId.toString());
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      scrollable: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      content: Container(
        width: 362.w,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.symmetric(horizontal: 29.w, vertical: 34.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              LocalKeys.kPauseSubscription.tr,
              style: Get.textTheme.headline1,
            ),
            Padding(
              padding: EdgeInsets.only(top: 17.5.h, bottom: 45.h),
              child: SizedBox(
                width: Get.width,
                height: 2.h,
                child: OverflowBox(
                  maxWidth: 342.w,
                  minWidth: 342.w,
                  maxHeight: 2.h,
                  child: const Divider(
                    color: lightGreyColor,
              ),
            ),
      ),
    ),
    Align(
    alignment: AlignmentDirectional.centerStart,
    child: Text(
    LocalKeys.kPauseFrom.tr,
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
                  onChanged: (String firstDate){
                    setState(() {
                      first=firstDate;
                      Get.log('date is   => '+firstDate);
                    });
                  },
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                  dateMask: 'yyyy-MM-dd',
                  style: Theme.of(context).textTheme.bodyText2,
                  decoration: InputDecoration(
                    hintText: LocalKeys.kPauseFrom.tr,
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
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                LocalKeys.kResumeFrom.tr,
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
                  onChanged: (String resumeDate){
                    setState(() {
                      resume=resumeDate;
                      Get.log('date is   => '+resume.toString());
                    });
                  },
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                  dateMask: 'yyyy-MM-dd',
                  style: Theme.of(context).textTheme.bodyText2,
                  decoration: InputDecoration(
                    hintText: LocalKeys.kResumeFrom.tr,
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
            Padding(
              padding: EdgeInsets.only(
                top: 40.h,
              ),
              child: CustomButton(
                title: LocalKeys.kConfirm.tr,
                onPress: () async{
                  Get.log('date is   => '+first.toString()+resume.toString());
                  PauseSubscriptionModel pauseModel=await SubscriptionApis()
                                                                  .pauseSubscription(orderId: subscripId.toString(),
                                                                  pauseFrom: first,
                                                                   resumFrom: resume);

                  if(pauseModel.data != null){
                    Get.snackbar('Pause Subscription', pauseModel.data?.msg??'');
                  }
                  Get.back();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
