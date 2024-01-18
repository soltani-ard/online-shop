import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_shop/common/widgets/shimmer_effect/shimmer_effect.dart';
import 'package:online_shop/utils/constants/colors.dart';
import 'package:online_shop/utils/constants/sizes.dart';
import 'package:online_shop/utils/helpers/helper_functions.dart';

class TVerticalImageText extends StatelessWidget {
  const TVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = TColors.white,
    this.backgroundColor,
    this.onTap,
    this.isNetworkImage = true,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
          children: [
            /// -- Circular Icon
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(TSizes.sm),
              decoration: BoxDecoration(
                color: backgroundColor ??
                    (THelperFunctions.isDarkMode(context)
                        ? TColors.black
                        : TColors.white),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: image.contains(".svg")
                    ? SvgPicture.asset(
                        image,
                        alignment: Alignment.center,
                        width: 56,
                        height: 56,
                        colorFilter: ColorFilter.mode(
                            isDark ? Colors.white : Colors.black,
                            BlendMode.srcIn),
                      )
                    : isNetworkImage
                        ? CachedNetworkImage(
                            imageUrl: image,
                            fit: BoxFit.cover,
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
                            fit: BoxFit.cover,
                            width: 55,
                            height: 55,
                            alignment: Alignment.center,
                            image: AssetImage(image),
                          ),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),

            /// -- Category Label
            SizedBox(
                width: 55,
                child: Center(
                    child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: textColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )))
          ],
        ),
      ),
    );
  }
}
