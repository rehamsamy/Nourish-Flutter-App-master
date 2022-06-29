import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:nourish_sa/app/core/values/app_constants.dart';
import 'package:nourish_sa/app/core/values/assets.dart';
import 'package:nourish_sa/app_theme.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage(
      {required this.imageUrl,
      required this.height,
      required this.width,
      required this.radius,
      this.radiusOnlyTop = false,
      this.shape,
      this.errorWidget,
      Key? key})
      : super(key: key);
  final double height;
  final double width;
  final double radius;
  final String imageUrl;
  final Widget? errorWidget;
  final BoxShape? shape;
  final bool radiusOnlyTop;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl == "" ? AppConstants.kImage : imageUrl,
      width: width,
      height: height,
      fit: BoxFit.contain,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: shape == null
              ? radiusOnlyTop
                  ? BorderRadius.only(
                      topLeft: Radius.circular(radius),
                      topRight: Radius.circular(radius))
                  : BorderRadius.circular(radius)
              : null,
          shape: shape ?? BoxShape.rectangle,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.fill,
          ),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        width: width,
        decoration: BoxDecoration(
          borderRadius: shape == null
              ? radiusOnlyTop
                  ? BorderRadius.only(
                      topLeft: Radius.circular(radius),
                      topRight: Radius.circular(radius))
                  : BorderRadius.circular(radius)
              : null,
          shape: shape ?? BoxShape.rectangle,
        ),
        child: ClipRRect(
            borderRadius: shape == null
                ? radiusOnlyTop
                    ? BorderRadius.only(
                        topLeft: Radius.circular(radius),
                        topRight: Radius.circular(radius))
                    : BorderRadius.circular(radius)
                : null,
            child: errorWidget ??
                const Icon(
                  Icons.broken_image,
                  color: Colors.white,
                )),
      ),
      placeholder: (context, url) => const Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  }
}
