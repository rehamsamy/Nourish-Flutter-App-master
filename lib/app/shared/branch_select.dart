import 'package:flutter/material.dart';

import '../../app_theme.dart';

class BranchSelectCard extends StatelessWidget {
  final String title;
  final String address;
  final Function() onTap;
  final bool selected;
  const BranchSelectCard(
      {required this.title,
      required this.address,
      required this.onTap,
      this.selected = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        width: selected ? 2 : 0, color: primaryColor),
                    borderRadius: BorderRadius.circular(20.0)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(address),
                      const SizedBox(
                        height: 12.5,
                      ),
                      Text(
                        title,
                        style: TextStyle(
                            fontSize: 16,
                            color: selected ? primaryColor : Colors.black,
                            fontWeight:
                                selected ? FontWeight.bold : FontWeight.normal),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
