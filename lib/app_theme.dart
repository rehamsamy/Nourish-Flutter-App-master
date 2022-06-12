import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const Color primaryColor = Color(0xff075C34);
const Color backgroundColor = Color(0xffF8F8F7);
const Color blackColor = Color(0xff000000);
const Color greyColor = Color(0xffC6C6C6);
const Color whiteColor = Color(0xffffffff);
const Color blueGreyColor = Color(0xff72809D);
const Color moreLightGreyColor = Color(0xffE4E4E4);
const Color lightGreyColor = Color(0xffB5B5B5);
const Color darkGreyColor = Color(0xff4D4D4D);
const Color lightBlueColor = Color(0xffF1F5FF);

TextTheme appTextTheme = TextTheme(
  bodyText1: TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 18.sp,
    color: blackColor,
  ),
  bodyText2: TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16.sp,
    color: blackColor,
  ),
  headline1: TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 22.sp,
    color: blackColor,
  ),
  button: TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 20.sp,
    color: whiteColor,
  ),
  headline6: TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 32.sp,
    color: primaryColor,
  ),
  headline2: TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 20.sp,
    color: blackColor,
  ),
  headline3: TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 17.sp,
    color: blueGreyColor,
  ),
  caption: TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
    color: greyColor,
  ),
  subtitle1: TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 11.sp,
    color: primaryColor,
  ),
);
