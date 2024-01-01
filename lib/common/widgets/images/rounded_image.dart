import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_shop/common/widgets/shimmer_effect/shimmer_effect.dart';
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
                      colorFilter: ColorFilter.mode(
                          isDark ? Colors.white : Colors.black,
                          BlendMode.srcIn),
                    )
                  : isNetworkImage
                      ? CachedNetworkImage(
                          imageUrl: imgUrl,
                          fit: fit,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                                  const TShimmerEffect(
                            width: 55,
                            height: 55,
                            radius: 55,
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        )
                      : Image(
                          fit: fit,
                          width: width,
                          height: height,
                          alignment: Alignment.center,
                          image: AssetImage(imgUrl),
                        ),
            )),
      ),
    );
  }
}
