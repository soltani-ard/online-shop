import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_shop/utils/constants/colors.dart';
import 'package:online_shop/utils/constants/sizes.dart';
import 'package:online_shop/utils/helpers/helper_functions.dart';

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
    bool isDark = THelperFunctions.isDarkMode(context);
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
              child: imgUrl.contains(".svg")
                  ? SvgPicture.asset(
                      imgUrl,
                      alignment: Alignment.center,
                      width: 56,
                      height: 56,
                      colorFilter:
                      ColorFilter.mode(isDark ? Colors.white : Colors.black, BlendMode.srcIn),
                    )
                  : Image(
                      fit: fit,
                      width: width,
                      height: height,
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
