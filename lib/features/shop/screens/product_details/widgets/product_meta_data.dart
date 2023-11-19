
import 'package:flutter/material.dart';
import 'package:online_shop/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:online_shop/common/widgets/text/brand_title_with_verification_icon.dart';
import 'package:online_shop/common/widgets/text/product_title.dart';
import 'package:online_shop/utils/constants/colors.dart';
import 'package:online_shop/utils/constants/enums.dart';
import 'package:online_shop/utils/constants/sizes.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({
    super.key,
    required this.product,
  });

  final Map product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price And Sale Price
        Row(
          children: [
            /// Sale Tag
            TRoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text('%${product['discount']}', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),),
            ),
            const SizedBox(width: TSizes.defaultSpace,),

            /// Price
            Text('\$${product['price']}', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
            const SizedBox(width: TSizes.defaultSpace,),
            Text('\$${ product['price'] - (product['discount']  * product['price'] / 100) } ', style: Theme.of(context).textTheme.titleLarge),

          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5,),

        /// Title
        TProductTitle(title: product['title']),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5,),

        /// Stock Status
        Row(
          children: [
            const TProductTitle(title: 'Status'),
            const SizedBox(width: TSizes.spaceBtwItems / 1.5,),
            Text('In Stock', style: Theme.of(context).textTheme.titleMedium,)
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2,),

        /// Brand
        Row(
          children: [
            TBrandTitleWithVerificationIcon(title: product['brand'], brandTextSize: TextSizes.medium,),
          ],
        )

      ],
    );
  }
}