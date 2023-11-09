import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop/common/widgets/text/brand_title.dart';
import 'package:online_shop/utils/constants/colors.dart';
import 'package:online_shop/utils/constants/enums.dart';
import 'package:online_shop/utils/constants/sizes.dart';

class TBrandTitleWithVerificationIcon extends StatelessWidget {
  const TBrandTitleWithVerificationIcon(
      {super.key,
      required this.title,
      this.maxLine = 1,
      this.textColor,
      this.iconColor = TColors.primary,
      this.textAlign = TextAlign.center,
      this.brandTextSize = TextSizes.small
      });

  final String title;
  final int maxLine;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
            child: TBrandTitle(
              title: title,
              textColor: textColor,
              maxLine: maxLine,
              textAlign: textAlign,
              brandTextSize: brandTextSize,
            )
        ),
        const SizedBox(width: TSizes.xs,),
        Icon(Iconsax.verify5, color: iconColor, size: TSizes.iconXs,)
      ],
    );
  }
}
