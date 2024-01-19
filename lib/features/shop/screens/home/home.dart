import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:online_shop/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:online_shop/common/widgets/layouts/grid_layout.dart';
import 'package:online_shop/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:online_shop/common/widgets/text/section_heading.dart';
import 'package:online_shop/features/shop/screens/all_products/all_products.dart';
import 'package:online_shop/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:online_shop/features/shop/screens/home/widgets/home_categories.dart';
import 'package:online_shop/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:online_shop/utils/constants/colors.dart';
import 'package:online_shop/utils/constants/image_strings.dart';
import 'package:online_shop/utils/constants/sizes.dart';
import 'package:online_shop/utils/constants/text_strings.dart';

class HomePageScreen extends StatelessWidget {
  HomePageScreen({super.key});

  late List products = [
    {
      'img': TImages.pShoes1,
      'title': "FILA Shoes for Men",
      "price": 35.5,
      "brand": "Fila",
      "discount": 5,
      "isFav": false
    },
    {
      'img': TImages.pShoes2,
      'title': "adidas Shoes for Women",
      "price": 42.5,
      "brand": "Fila",
      "discount": 10,
      "isFav": true
    },
    {
      'img': TImages.pShoes3,
      'title': "airmax Shoes for Women",
      "price": 20.5,
      "brand": "AirMax",
      "discount": 30,
      "isFav": false
    },
    {
      'img': TImages.pShoes5,
      'title': "salomon Shoes for Men",
      "price": 28.5,
      "brand": "Salomon",
      "discount": 12,
      "isFav": true
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          TPrimaryHeaderContainer(
              child: Column(
            children: [
              /// -- Appbar
              const THomeAppBar(),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// -- Searchbar
              TSearchContainer(
                text: TTexts.searchInStore,
                onTap: () {},
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// -- Categories
              const Padding(
                padding: EdgeInsets.only(left: TSizes.defaultSpace),
                child: Column(
                  children: [
                    /// -- Heading
                    TSectionHeading(
                      title: TTexts.popularCategories,
                      showActionButton: false,
                      textColor: TColors.white,
                    ),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    /// -- Categories
                    THomeCategories(),
                  ],
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
            ],
          )),

          /// -- Body
          const Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
            child: TPromoSlider(),
          ),

          TSectionHeading(
            title: 'Popular Products',
            onPressed: () => Get.to(() => AllProductsScreen()),
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: TSizes.sm),
            child: TGridLayout(
              itemCount: 4,
              itemBuilder: (_, index) =>
                  TProductVertical(product: products[index]),
            ),
          ),
        ],
      ),
    ));
  }
}
