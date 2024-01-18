import 'package:flutter/material.dart';
import 'package:online_shop/common/widgets/brands/brand_show_case.dart';
import 'package:online_shop/common/widgets/layouts/grid_layout.dart';
import 'package:online_shop/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:online_shop/common/widgets/text/section_heading.dart';
import 'package:online_shop/features/shop/models/category_model.dart';
import 'package:online_shop/utils/constants/sizes.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab(
      {super.key, required this.category,
      });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                /// -- Brands
                // TBrandShowCase(
                //   images: topProductImages,
                //   branName: branName,
                //   brandLogo: brandLogo,
                //   productNumber: products.length,
                // ),

                /// -- Products
                TSectionHeading(
                  title: 'You might like',
                  showActionButton: true,
                  onPressed: () {},
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),

                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: TSizes.sm),
                //   child: TGridLayout(
                //     itemCount: products.length,
                //     itemBuilder: (_, index) => TProductVertical(product: products[index]),
                //   ),
                // ),
              ],
            ),
          ),
        ]);
  }
}
