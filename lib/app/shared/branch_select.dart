import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';

import '../../app_theme.dart';

class BranchSelectCard extends StatelessWidget {
  final String title;
  final String address;
  final Function() onTap;
  final Function() onContinue;
  final bool selected;
  const BranchSelectCard(
      {required this.title,
      required this.address,
      required this.onTap,
      required this.onContinue,
      this.selected = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Container(
                height: 140.h,
                width: 250.w,
                decoration: BoxDecoration(
                    color: selected ? whiteColor : greyColor.withOpacity(.7),
                    border:
                        Border.all(width: selected ? 2 : 0, color: whiteColor),
                    borderRadius: BorderRadius.circular(20.0)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                              fontSize: 16,
                              color: selected ? primaryColor : Colors.black,
                              fontWeight: selected
                                  ? FontWeight.bold
                                  : FontWeight.normal),
                        ),
                        Text(
                          address,
                          style: TextStyle(
                              fontSize: 14,
                              color: selected ? primaryColor : Colors.black,
                              fontWeight: selected
                                  ? FontWeight.bold
                                  : FontWeight.normal),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: onContinue,
                      child: Text(
                        LocalKeys.kContinue.tr,
                        style: TextStyle(
                            fontSize: 14,
                            color: selected ? primaryColor : Colors.black,
                            fontWeight:
                                selected ? FontWeight.bold : FontWeight.normal),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
