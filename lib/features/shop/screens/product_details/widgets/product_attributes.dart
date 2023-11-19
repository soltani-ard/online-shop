import 'package:flutter/material.dart';
import 'package:online_shop/common/widgets/chips/choice_chip.dart';
import 'package:online_shop/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:online_shop/common/widgets/text/product_price.dart';
import 'package:online_shop/common/widgets/text/product_title.dart';
import 'package:online_shop/common/widgets/text/section_heading.dart';
import 'package:online_shop/utils/constants/colors.dart';
import 'package:online_shop/utils/constants/sizes.dart';
import 'package:online_shop/utils/helpers/helper_functions.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({
    super.key,
    required this.product,
  });

  final Map product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Selected Attribute Pricing & Description
        TRoundedContainer(
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? TColors.darkerGrey
              : TColors.grey,
          padding: const EdgeInsets.all(TSizes.md),
          child: Column(
            children: [
              /// Selected Attribute Pricing & Description
              Row(
                children: [
                  const TSectionHeading(
                    title: 'Variation: ',
                    showActionButton: false,
                    padding: TSizes.xs,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const TProductTitle(
                            title: 'Price: ',
                            smallSize: true,
                          ),
                          const SizedBox(
                            width: TSizes.defaultSpace / 2,
                          ),
                          Text(
                            '${product['price']} ',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(
                            width: TSizes.defaultSpace / 2,
                          ),
                          TProductPrice(
                              price:
                                  '${product['price'] - (product['discount'] * product['price'] / 100)}'),
                        ],
                      ),
                      Row(
                        children: [
                          const TProductTitle(
                            title: 'Status: ',
                            smallSize: true,
                          ),
                          const SizedBox(
                            width: TSizes.defaultSpace / 2,
                          ),
                          Text('Out of Stock',
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              /// Variation Description
              const SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: TSizes.xs),
                child: TProductTitle(
                  title:
                      'this is the Description of the Product and it can go up to max 4 lines.',
                  smallSize: true,
                  maxLine: 4,
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        /// Attributes Colors & Sizes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(
              title: 'Colors',
              padding: 0,
              showActionButton: false,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8.0,
              children: [
                TChoiceChip(
                  text: 'Green',
                  selected: false,
                  onSelected: (value) {},
                ),
                TChoiceChip(
                  text: 'Blue',
                  selected: false,
                  onSelected: (value) {},
                ),
                TChoiceChip(
                  text: 'Pink',
                  selected: true,
                  onSelected: (value) {},
                ),
              ],
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(
              title: 'Sizes',
              padding: 0,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8.0,
              children: [
                TChoiceChip(
                  text: 'EU 34',
                  selected: false,
                  onSelected: (value) {},
                ),
                TChoiceChip(
                  text: 'EU 36',
                  selected: false,
                  onSelected: (value) {},
                ),
                TChoiceChip(
                  text: 'EU 38',
                  selected: true,
                  onSelected: (value) {},
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
