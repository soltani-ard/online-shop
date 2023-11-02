import 'package:flutter/material.dart';
import 'package:online_shop/utils/constants/colors.dart';
import 'package:online_shop/utils/constants/sizes.dart';

class TRoundedImage extends StatelessWidget {
  const TRoundedImage({
    super.key,
    this.width,
    this.height,
    this.padding,
    required this.imgUrl,
    this.isNetworkImage = false,
    this.backgroundColor = TColors.light,
    this.applyImageRadius = true,
    this.border,
    this.borderRadius = TSizes.md,
    this.fit = BoxFit.fill,
    this.onPressed,
  });

  final double? width, height;
  final String imgUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final double borderRadius;
  final Color backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          border: border,
          color: Colors.transparent,
        ),
        child: ClipRRect(
            borderRadius: applyImageRadius
                ? BorderRadius.circular(borderRadius)
                : BorderRadius.zero,
            child: Center(
              child: Image(
                fit: fit,
                alignment: Alignment.center,
                image: isNetworkImage
                    ? NetworkImage(imgUrl)
                    : AssetImage(imgUrl) as ImageProvider,
              ),
            )),
      ),
    );
  }
}
