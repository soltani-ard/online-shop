import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:online_shop/common/widgets/icons/circular_icon.dart';
import 'package:online_shop/common/widgets/images/rounded_image.dart';
import 'package:online_shop/common/widgets/text/brand_title_with_verification_icon.dart';
import 'package:online_shop/common/widgets/text/product_price.dart';
import 'package:online_shop/common/widgets/text/product_title.dart';
import 'package:online_shop/features/shop/screens/product_details/product_details.dart';
import 'package:online_shop/utils/constants/colors.dart';
import 'package:online_shop/utils/constants/sizes.dart';
import 'package:online_shop/utils/helpers/helper_functions.dart';

class TProductHorizontal extends StatelessWidget {
  const TProductHorizontal({super.key, required this.product});

  final Map product;

  @override
  Widget build(BuildContext context) {
    bool isDark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(
            product: product,
          )),
      child: Container(
        width: 310,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(TSizes.productImageRadius),
            color: isDark ? TColors.darkerGrey : TColors.lightContainer),
        child: Row(
          children: [
            /// Thumbnail
            TRoundedContainer(
              height: 120,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: isDark ? TColors.darkerGrey : TColors.light,
              child: Stack(
                children: [
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: TRoundedImage(
                      imgUrl: product['img'],
                      applyImageRadius: true,
                    ),
                  ),

                  /// -- Sale Tag
                  Positioned(
                    top: 12,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Text(
                        "${product['discount']}%",
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: TColors.black),
                      ),
                    ),
                  ),

                  /// -- Fav Button
                  Positioned(
                      top: 0,
                      right: 0,
                      child: TCircularIcon(
                        icon: Iconsax.heart5,
                        color: product['isFav'] ? Colors.red : Colors.grey,
                      )),
                ],
              ),
            ),

            /// Details
            SizedBox(
              width: 172,
              child: Padding(
                padding: const EdgeInsets.only(top: TSizes.sm, left: TSizes.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TProductTitle(
                          title: product['title'],
                          smallSize: true,
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItems / 2,
                        ),
                        TBrandTitleWithVerificationIcon(
                            title: product['brand']),
                        const SizedBox(
                          height: TSizes.spaceBtwItems / 2,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// pricing
                        Flexible(
                            child: Padding(
                          padding: const EdgeInsets.only(bottom: TSizes.md),
                          child:
                              TProductPrice(price: product['price'].toString()),
                        )),

                        /// add to cart
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(TSizes.cardRadiusMd),
                              bottomRight:
                                  Radius.circular(TSizes.productImageRadius),
                            ),
                          ),
                          child: const SizedBox(
                              width: TSizes.iconLg,
                              height: TSizes.iconLg,
                              child: Icon(
                                Iconsax.add,
                                color: TColors.white,
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
