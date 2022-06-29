import 'package:flutter/material.dart';
import 'package:nourish_sa/app/views/shimmer_effect.dart';

class MealLoading extends StatelessWidget {
  final double width, height;
  const MealLoading(this.width, this.height, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: MyShimmerEffectUI.rectangular(
              height: height,
              width: width,
            ),
          ),
          // SizedBox(height: 10),
          // MyShimmerEffectUI.rectangular(height: 10)
        ],
      ),
    );
  }
}
