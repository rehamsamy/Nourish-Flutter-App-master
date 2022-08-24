import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/assets.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/data/models/profile_model.dart';
import 'package:nourish_sa/app/data/models/update_profile_model.dart';
import 'package:nourish_sa/app/data/remote_data_sources/auth_apis.dart';
import 'package:nourish_sa/app/data/remote_data_sources/profile_apis.dart';
import 'package:nourish_sa/app/modules/home_page/controllers/home_page_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nourish_sa/app/modules/profile/views/otp_dialog.dart';
import 'package:nourish_sa/app/shared/custom_button.dart';
import 'package:nourish_sa/app/shared/custom_input.dart';
import 'package:nourish_sa/app_theme.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    Get.log('page  => profile');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
        shadowColor: const Color(0xff000000).withOpacity(0.3),
        leading: InkWell(
            onTap: () {
              Get.find<HomePageController>().changeIndex(0);
            },
            child: const Icon(Icons.arrow_back)),
      ),
      body: FutureBuilder(
          future: ProfileApis().getProfileInfo(),
          builder: (_, snap) {
            if (snap.hasData) {
              ProfileModel userModel = snap.data as ProfileModel;
              controller.email.text = userModel.email ?? '';
              controller.phone.text = userModel.mobile ?? '';
              controller.lastName.text = userModel.lastName ?? '';
              controller.firstName.text = userModel.firstName ?? '';
              return SizedBox(
                width: Get.width,
                height: Get.height,
                child: SingleChildScrollView(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 40.h, horizontal: 36.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 113.w,
                          height: 113.w,
                          child: Stack(
                            children: [
                              Container(
                                  width: 113.w,
                                  height: 150.w,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: greyColor,
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: userModel.image ?? "",
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) =>
                                        const CupertinoActivityIndicator(),
                                    errorWidget: (context, url, error) => Icon(
                                      CupertinoIcons.photo_camera_solid,
                                      size: 60.w,
                                      //  color: Colors.green,
                                    ),
                                  )),
                              PositionedDirectional(
                                bottom: 0,
                                end: 5,
                                width: 38.w,
                                height: 38.w,
                                child: Container(
                                  width: 38.w,
                                  height: 38.w,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xff253F50),
                                  ),
                                  child: const Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 14.h,
                            bottom: 44.h,
                          ),
                          child: Text(
                            userModel.name ?? 'User Name',
                            style: Get.textTheme.bodyText1,
                          ),
                        ),
                        CustomInput(
                          hint: userModel.firstName ?? LocalKeys.kFirstName.tr,
                          textEditingController: controller.firstName,
                          title: LocalKeys.kFirstName.tr,
                          suffixIcon: Assets.kProfileIcon,
                        ),
                        CustomInput(
                          hint: userModel.lastName ?? LocalKeys.kLastName.tr,
                          textEditingController: controller.lastName,
                          title: LocalKeys.kLastName.tr,
                          suffixIcon: Assets.kProfileIcon,
                        ),
                        CustomInput(
                          hint: userModel.mobile ?? LocalKeys.kPhoneNumber.tr,
                          textEditingController: controller.phone,
                          title: LocalKeys.kPhoneNumber.tr,
                          suffixIcon: Assets.kPhone,
                        ),
                        CustomInput(
                          hint: userModel.email ?? LocalKeys.kEmail.tr,
                          textEditingController: controller.email,
                          title: LocalKeys.kEmail.tr,
                          suffixIcon: Assets.kEmailIcon,
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        CustomButton(
                          title: LocalKeys.kSave.tr,
                          onPress: () async {
                            Get.dialog(Container(
                              width: Get.width / 10,
                              height: Get.height / 10,
                              color: Colors.black54,
                              child: const Center(
                                child: CircularProgressIndicator(
                                    color: primaryColor),
                              ),
                            ));
                            if (controller.phone.text != userModel.mobile) {
                              Get.dialog(OTPDialog(controller.phone.text));
                              await AuthApis()
                                  .resendOtpMobile(controller.phone.text);
                            }
                            UpdateProfileModel updateModel =
                                await ProfileApis().updateProfileInfo(
                              first_name: controller.firstName.text,
                              last_name: controller.lastName.text,
                              mobile: controller.phone.text,
                              email: controller.email.text,
                            ) as UpdateProfileModel;
                            String? mes = updateModel.data?.msg.toString();
                            Get.log('updated   =>' + mes.toString());
                            // Get.snackbar("Unknown Network error",
                            //  updateModel.data?.msg ?? '');
                            //Get.dialog(OTPDialog(controller.phone.text));
                            Get.forceAppUpdate();
                            Get.back();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return const Center(child: CupertinoActivityIndicator());
            }
          }),
    );
  }
}
