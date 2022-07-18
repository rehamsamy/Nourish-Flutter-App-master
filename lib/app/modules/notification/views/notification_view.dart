import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/data/models/notification_model.dart';
import 'package:nourish_sa/app/data/remote_data_sources/notifiacation_apis.dart';
import 'package:nourish_sa/app_theme.dart';

import '../controllers/notification_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocalKeys.kNotifications.tr),
        centerTitle: true,
        shadowColor: const Color(0xff000000).withOpacity(0.3),
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        margin: EdgeInsets.symmetric(
          horizontal: 34.w,
          vertical: 28.h,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 18.w,
          vertical: 17.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11.r),
          border: Border.all(color: greyColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocalKeys.kAllIncomingActivity.tr,
              style: Get.textTheme.bodyText1!.copyWith(color: primaryColor),
            ),
            SizedBox(
              height: 20.h,
            ),
            FutureBuilder(
                future: NotificationApis().getNotifications(),
                builder: (_, snap) {
                  if (snap.hasData) {
                    List<NotificationItem>? notificationsList =
                        snap.data as List<NotificationItem>;
                    if (notificationsList.isNotEmpty) {
                      return Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.w),
                          child: ListView.builder(
                              itemCount: notificationsList.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Text(
                                      notificationsList[index].text ??
                                          "New Updates Coming ",
                                      style: Get.textTheme.headline3!
                                          .copyWith(color: blackColor),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 6.h, bottom: 11.h),
                                      child: Text(
                                        notificationsList[index].time ??
                                            "5 hours ago",
                                        style: Get.textTheme.subtitle1!
                                            .copyWith(color: primaryColor),
                                      ),
                                    ),
                                    Container(
                                      width: Get.width,
                                      height: 1,
                                      color: greyColor,
                                    ),
                                  ],
                                );
                              }),
                        ),
                      );
                    } else {
                      return const Center(
                        child: Text('no notification found'),
                      );
                    }
                  } else {
                    return const SizedBox(
                      height: 200,
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
