import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nourish_sa/app/core/values/assets.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/data/models/register_model.dart';
import 'package:nourish_sa/app/shared/custom_button.dart';
import 'package:nourish_sa/app/shared/custom_input.dart';
import 'package:nourish_sa/app_theme.dart';
import 'package:nourish_sa/routes/app_pages.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 36.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 100.h,
              ),
              Image.asset(
                Assets.kLogo,
                width: 238.w,
              ),
              Padding(
                padding: EdgeInsets.only(top: 19.h, bottom: 48.h),
                child: Text(
                  LocalKeys.kSignUp.tr,
                  style: Get.textTheme.headline2,
                ),
              ),
              CustomInput(
                hint: LocalKeys.kFirstName.tr,
                textEditingController: controller.firstName,
                title: LocalKeys.kFirstName.tr,
                suffixIcon: Assets.kProfileIcon,
                validator: (value) {
                  if (value != null && value.trim().isEmpty) {
                    return LocalKeys.kRequiredField.tr;
                  }
                  return null;
                },
              ),
              CustomInput(
                hint: LocalKeys.kLastName.tr,
                textEditingController: controller.lastName,
                title: LocalKeys.kLastName.tr,
                suffixIcon: Assets.kProfileIcon,
                validator: (value) {
                  if (value != null && value.trim().isEmpty) {
                    return LocalKeys.kRequiredField.tr;
                  }
                  return null;
                },
              ),
              CustomInput(
                hint: LocalKeys.kPhoneNumber.tr,
                textEditingController: controller.phone,
                title: LocalKeys.kPhoneNumber.tr,
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
              CustomInput(
                hint: LocalKeys.kEmail.tr,
                textEditingController: controller.email,
                title: LocalKeys.kEmail.tr,
                suffixIcon: Assets.kEmailIcon,
                validator: (value) {
                  if (value != null && value.trim().isEmpty) {
                    return LocalKeys.kRequiredField.tr;
                  } else if (value != null &&
                      !value.contains('@') &&
                      value.endsWith(".com")) {
                    return LocalKeys.kEmailInvalid.tr;
                  }
                  return null;
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(() => Checkbox(
                        value: controller.isTermsAgreed.value,
                        activeColor: primaryColor,
                        onChanged: (value) {
                          if (value != null) {
                            controller.isTermsAgreed.value = value;
                          }
                        },
                      )),
                  SizedBox(
                    width: Get.width * 0.7,
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(color: Colors.black, fontSize: 36),
                        children: <TextSpan>[
                          TextSpan(
                            text: LocalKeys.kReadAndAgreed.tr,
                            style: Theme.of(context)
                                .textTheme
                                .headline3!
                                .copyWith(fontSize: 14.sp),
                          ),
                          TextSpan(
                            text: LocalKeys.kTermsConditions.tr,
                            recognizer: TapGestureRecognizer()..onTap = () {},
                            style:
                                Theme.of(context).textTheme.headline3!.copyWith(
                                      fontSize: 14.sp,
                                      color: primaryColor,
                                    ),
                          ),
                          TextSpan(
                            text: " ${LocalKeys.kAnd.tr} ",
                            style: Theme.of(context)
                                .textTheme
                                .headline3!
                                .copyWith(fontSize: 14.sp),
                          ),
                          TextSpan(
                            text: LocalKeys.kPrivacyPolicy.tr,
                            recognizer: TapGestureRecognizer()..onTap = () {},
                            style:
                                Theme.of(context).textTheme.headline3!.copyWith(
                                      fontSize: 14.sp,
                                      color: primaryColor,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 26.h, bottom: 20.h),
                child: CustomButton(
                  title: LocalKeys.kSignUp.tr,
                  onPress: ()async {
                    RegisterModel ? login= await  controller.registerUser() as RegisterModel? ;
                    if(login?.data !=null){
                      Get.toNamed(Routes.OTP_VERIFICATION,arguments: {'phone':controller.phone.text});
                      Get.snackbar("Unknown Network error", login!.data!.msg??'');
                    }

                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LocalKeys.kHaveAccount.tr,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 13.sp),
                  ),
                  InkWell(
                    onTap: () {
                      Get.until((route) => route.isFirst);
                    },
                    child: Text(
                      LocalKeys.kLogin.tr,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 13.sp, color: primaryColor),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
