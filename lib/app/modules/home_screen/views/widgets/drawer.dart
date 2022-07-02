import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/assets.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/data/models/login_model.dart';
import 'package:nourish_sa/app/data/remote_data_sources/auth_apis.dart';
import 'package:nourish_sa/app/data/services/shared_pref.dart';
import 'package:nourish_sa/app/modules/home_page/controllers/home_page_controller.dart';
import 'package:nourish_sa/app/modules/home_screen/controllers/home_screen_controller.dart';
import 'package:nourish_sa/app/shared/custom_network_image.dart';
import 'package:nourish_sa/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:intercom_flutter/intercom_flutter.dart';
import '../../../../../app_theme.dart';
import 'drawer_item.dart';

class MainDrawer extends GetView<HomeScreenController> {
  const MainDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: whiteColor,
      child: Column(
        children: [
          Container(
            width: Get.width,
            height: 259.h,
            color: primaryColor,
            child: Stack(
              children: [
               SvgPicture.asset(
                  Assets.kDrawer,
                  fit: BoxFit.fitWidth,
                  color: Colors.black.withOpacity(0.07),
                ),
                PositionedDirectional(
                  bottom: 65.h,
                  start: 33.w,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30.w,
                        backgroundColor: whiteColor,
                        child:    CustomNetworkImage(imageUrl: controller.profileModel?.image??'https://1.bp.blogspot.com/-3BIIq_YpmzY/YCvbdCUbXWI/AAAAAAAAKMU/aU7Pr7wLVicrrAgzon0EtGxTxtteKzjqACLcBGAsYHQ/s16000/%25D8%25B5%25D9%2588%25D8%25B1-%25D8%25A8%25D9%2586%25D8%25A7%25D8%25AA-%25D8%25AC%25D9%258A%25D8%25B1%25D9%2584%25D9%258A-13.webp',
                          height: 24.h, width: 24.w, radius: 10,
                        errorWidget:
                        SvgPicture.asset(
                          Assets.kProfileIcon,
                          color: primaryColor,
                          width: 24.w,
                          height: 24.h,
                        ),
                        )
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            LocalKeys.kVisitorUser.tr,
                            style: Get.textTheme.headline1!
                                .copyWith(color: whiteColor),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          InkWell(
                            onTap: () {
                              controller.scaffoldKey!.currentState!
                                  .openEndDrawer();

                              Get.toNamed(Routes.LOGIN);
                            },
                            child: Container(
                              width: 133.w,
                              height: 32.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.w),
                                color: whiteColor,
                              ),
                              child: Text(
                                LocalKeys.kLoginorSignup.tr,
                                style: Get.textTheme.caption!
                                    .copyWith(color: blackColor),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 29.w),
              child: Column(
                children: [
                  DrawerItem(
                    name: LocalKeys.kHome.tr,
                    icon: Assets.kHome,
                    onTap: () {
                      controller.scaffoldKey!.currentState!.openEndDrawer();
                      Get.find<HomePageController>().currentIndex.value = 0;
                    },
                  ),
                  DrawerItem(
                    name: LocalKeys.kPackages.tr,
                    icon: Assets.kFolder,
                    onTap: () {
                      controller.scaffoldKey!.currentState!.openEndDrawer();

                      Get.find<HomePageController>().currentIndex.value = 2;
                    },
                  ),
                  DrawerItem(
                    name: LocalKeys.kMenus.tr,
                    icon: Assets.kCategory,
                    onTap: () {
                      controller.scaffoldKey!.currentState!.openEndDrawer();
                      Get.find<HomePageController>().currentIndex.value = 1;
                    },
                  ),
                  DrawerItem(
                    name: LocalKeys.kMySubscription.tr,
                    icon: Assets.kCheckList,
                    onTap: () {
                      controller.scaffoldKey!.currentState!.openEndDrawer();

                      Get.toNamed(Routes.SUBSCRIPTION);
                    },
                  ),
                  DrawerItem(
                    name: LocalKeys.kAddressBook.tr,
                    icon: Assets.kLocation,
                    onTap: () {
                      Get.toNamed(Routes.ADD_ADDRESS);
                      // Get.toNamed(Routes.DELIVERY_ADDRESSES);
                      controller.scaffoldKey!.currentState!.openEndDrawer();
                    },
                  ),
                  DrawerItem(
                    name: LocalKeys.kHelpCenter.tr,
                    icon: Assets.kQuestionHelp,
                    onTap: () async {
                      BotToast.showLoading();
                      // TODO if user logged register it on intercom if else unregister
//                      if () {
//                        await Intercom.instance.loginIdentifiedUser();
//                      } else {
                      await Intercom.instance.logout();
                      await Intercom.instance.loginUnidentifiedUser();
//                      }
                      BotToast.closeAllLoading();
                      await Intercom.instance.displayMessenger();
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 14.5.h),
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                Assets.kWeb,
                                width: 25.w,
                                height: 25.h,
                                color: primaryColor,
                                fit: BoxFit.contain,
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              Text(
                                LocalKeys.kLanguage.tr,
                                style: Get.textTheme.headline3,
                              )
                            ],
                          ),
                          Container(
                            height: 32.h,
                            width: 72.w,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(5.r),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              Get.locale!.languageCode == "ar"
                                  ? LocalKeys.kEnglish
                                  : LocalKeys.kArabic,
                              style: Get.textTheme.caption!
                                  .copyWith(color: whiteColor),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  DrawerItem(
                    name: LocalKeys.kLogout.tr,
                    icon: Assets.kLogOut,
                    onTap: () async {
                      LoginModel model =
                          await AuthApis().logoutUser() as LoginModel;
                      String mes = model.data?.msg ?? '';
                      Get.log('log mess   => ' + mes);
                      Get.snackbar("Logout", model.data?.msg ?? '');
                      SharedPreferences pref =
                          await SharedPreferences.getInstance();
                      await SharedPrefService(prefs: pref).removeToken();

                      Intercom.instance.logout();
                      Get.offAllNamed(Routes.LOGIN);
                      controller.scaffoldKey!.currentState!.openEndDrawer();
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
