import 'package:flutter/material.dart';
import 'package:online_shop/common/widgets/images/rounded_image.dart';
import 'package:online_shop/common/widgets/text/brand_title_with_verification_icon.dart';
import 'package:online_shop/common/widgets/text/product_title.dart';
import 'package:online_shop/utils/constants/colors.dart';
import 'package:online_shop/utils/constants/image_strings.dart';
import 'package:online_shop/utils/constants/sizes.dart';
import 'package:online_shop/utils/helpers/helper_functions.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Image
        TRoundedImage(
            width: 70,
            height: 60,
            padding: const EdgeInsets.all(TSizes.sm),
            backgroundColor: THelperFunctions.isDarkMode(context)
                ? TColors.darkerGrey
                : TColors.light,
            imgUrl: TImages.pShoes3),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),

        /// title, price, size
        Expanded(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TBrandTitleWithVerificationIcon(title: 'Nike'),
            const TProductTitle(title: 'Sport Shoes'),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: 'Color ', style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                  text: 'Pink ', style: Theme.of(context).textTheme.bodyLarge),
              TextSpan(
                  text: 'Size ', style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                  text: 'UK 08 ', style: Theme.of(context).textTheme.bodyLarge),
            ]))
          ],
        )),
      ],
    );
  }
}
