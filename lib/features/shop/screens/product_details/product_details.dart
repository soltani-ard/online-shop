import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop/common/widgets/text/section_heading.dart';
import 'package:online_shop/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:online_shop/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:online_shop/features/shop/screens/product_details/widgets/product_image_slider.dart';
import 'package:online_shop/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:online_shop/features/shop/screens/product_details/widgets/rating_and_share.dart';
import 'package:online_shop/features/shop/screens/product_reviews/product_revies.dart';
import 'package:online_shop/utils/constants/sizes.dart';
import 'package:online_shop/utils/constants/text_strings.dart';
import 'package:online_shop/utils/helpers/helper_functions.dart';
import 'package:readmore/readmore.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});

  final Map product;

  @override
  Widget build(BuildContext context) {
    bool isDark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: const TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// -- Product Image Slider
            TProductDetailsImageSlider(product: product),

            /// -- Product Details
            Padding(
              padding: const EdgeInsets.only(
                right: TSizes.defaultSpace,
                left: TSizes.defaultSpace,
                bottom: TSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  /// -- Rating & Share Button
                  const TRatingAndShare(),

                  ///  -- Price, Title, Stock, Brand
                  TProductMetaData(product: product),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  ///  -- Attributes
                  TProductAttributes(product: product),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  ///  -- Checkout Button
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {},
                          child: const Text(TTexts.checkout))),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  ///  -- Description
                  const TSectionHeading(
                    title: 'Description',
                    showActionButton: false,
                    padding: 0,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  const ReadMoreText(
                    TTexts.loremIpsum,
                    textAlign: TextAlign.justify,
                    trimLength: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: TTexts.showMore,
                    trimExpandedText: TTexts.less,
                    moreStyle:
                        TextStyle(fontSize: 14.0, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14.0, fontWeight: FontWeight.w800),
                  ),

                  ///  -- Reviews
                  const Divider(),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  GestureDetector(
                    onTap: () => Get.to(()=> const ProductReviews()),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const TSectionHeading(
                          title: 'Reviews(199)',
                          showActionButton: false,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Iconsax.arrow_right_3,
                            size: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
