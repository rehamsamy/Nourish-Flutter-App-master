import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/assets.dart';
import 'package:nourish_sa/app/modules/custom_package/views/result_screen.dart';
import 'package:nourish_sa/app/shared/percent_indicator.dart';
import 'package:nourish_sa/app_theme.dart';

class CalcuationScreen extends StatefulWidget {
  const CalcuationScreen({Key? key}) : super(key: key);

  @override
  State<CalcuationScreen> createState() => _CalcuationScreenState();
}

class _CalcuationScreenState extends State<CalcuationScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1)).then((value) {
      Get.off(const ResultScreen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          Assets.kLogo,
          width: 91.w,
          height: 32.h,
        ),
        centerTitle: true,
        elevation: 0,
        shadowColor: const Color(0xff000000).withOpacity(0.3),
      ),
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Center(
          child: SizedBox(
            width: 239.w,
            child: CircularPercentIndicator(
              radius: 120.0,
              lineWidth: 20.w,
              animation: true,
              percent: 1,
              progressColor: primaryColor,
              circularStrokeCap: CircularStrokeCap.round,
              backgroundColor: const Color(0xffF8FAFC),
              center: Text(
                "100%",
                style: TextStyle(
                  fontSize: 46.sp,
                  color: blackColor,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
