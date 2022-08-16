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
                height: 160.h,
                width: 280.w,
                decoration: BoxDecoration(
                    color: selected ? whiteColor : greyColor.withOpacity(.7),
                    border:
                        Border.all(width: selected ? 2 : 0, color: whiteColor),
                    borderRadius: BorderRadius.circular(20.0)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/restaurant_icon.png',
                            height: 60.h,
                            width: 60.w,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 4,
                                ),
                                Expanded(
                                  child: Text(
                                    title,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: selected
                                            ? primaryColor
                                            : Colors.black,
                                        fontWeight: selected
                                            ? FontWeight.bold
                                            : FontWeight.normal),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Expanded(
                                  child: Text(
                                    address,
                                    overflow: TextOverflow.visible,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: selected
                                            ? primaryColor
                                            : Colors.black,
                                        fontWeight: selected
                                            ? FontWeight.bold
                                            : FontWeight.normal),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: onContinue,
                      child: Text(
                        LocalKeys.kContinue.tr,
                        style: TextStyle(
                            fontSize: 14,
                            color: selected ? whiteColor : Colors.black,
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
