import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/data/models/categories_model.dart';
import 'package:nourish_sa/app/data/models/login_model.dart';
import 'package:nourish_sa/app/data/remote_data_sources/auth_apis.dart';
import 'package:nourish_sa/app/data/remote_data_sources/home_apis.dart';
import 'package:nourish_sa/app/shared/custom_button.dart';
import 'package:nourish_sa/app/shared/custom_input.dart';
import 'package:nourish_sa/app/shared/custom_network_image.dart';
import 'package:nourish_sa/app/shared/custom_outlined_button.dart';
import 'package:nourish_sa/app_theme.dart';
import 'package:nourish_sa/routes/app_pages.dart';
import '../controllers/login_controller.dart';


class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 36.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: controller.isLoginedBefore.value
                    ? [
                        Text(
                          LocalKeys.kWelcomeBack.tr,
                          style: Get.textTheme.headline2,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 37.h, bottom: 19.h),
                          child: CustomNetworkImage(
                            imageUrl: controller.image!,
                            height: 149.h,
                            width: 149.w,
                            shape: BoxShape.circle,
                            radius: 25.r,
                          ),
                        ),
                        Text(
                          LocalKeys.kName.tr,
                          style: Get.textTheme.headline2,
                        ),
                      ]
                    : [
                        Image.asset(
                          Assets.kLogo,
                          width: 238.w,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 19.h, bottom: 48.h),
                          child: Text(
                            LocalKeys.kLogin.tr,
                            style: Get.textTheme.headline2,
                          ),
                        ),
                        CustomInput(
                          hint: "",
                          textEditingController: controller.phone,
                          title: LocalKeys.kPhone.tr,
                          suffixIcon: Assets.kPhone,
                          textInputType: TextInputType.number,
                          validator: (value) {
                            if (value != null && value.trim().isEmpty) {
                              return LocalKeys.kRequiredField.tr;
                            } else if (value != null && value.length < 10) {
                              return LocalKeys.kPhoneLength.tr;
                            }
                            return null;
                          },
                        ),
                      ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 45.h, bottom: 66.h),
              child: FutureBuilder(
                future:  HomeApis().getHomePackages() ,
                builder: (_,snap)=>CustomButton(
                  title: LocalKeys.kLogin.tr,
                  onPress: ()async {
                    print(snap.connectionState.toString()+'kkkkk'+snap.data.toString());
                    if(snap.hasData){
                      print('tttttt1');
                    }else if(snap.hasError){
                      print('tttttt2');
                    }else if(snap.connectionState==ConnectionState.waiting){
                      print('tttttt3');
                    }
            //      // List<CategoryItem> list=await   HomeApis().getHomeCategories() as List<CategoryItem>;
            //      // print('xxxxxxxxx'+list.toString());
            // LoginModel ? login= await AuthApis().loginUser(controller.phone.text) as LoginModel?;
            //      if(login?.data !=null){
            //        Get.snackbar("Unknown Network error", login?.data?.msg??'');
            //        Get.toNamed(
            //          Routes.OTP_VERIFICATION,
            //          arguments: {"isLogin": true},
            //        );
            //      }else{
            //        print('xxxxxxxxx'+login.toString());
            //      }
                  },
                ),
              ),
            ),
            CustomOutlinedButton(
              title: LocalKeys.kSignUpHere.tr,
              onPress: () {
                Get.toNamed(Routes.REGISTER);
              },
              borderColor: darkGreyColor,
              textColor: primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
