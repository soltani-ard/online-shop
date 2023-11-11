import 'package:flutter/material.dart';
import 'package:online_shop/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:online_shop/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:online_shop/common/widgets/layouts/grid_layout.dart';
import 'package:online_shop/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:online_shop/common/widgets/text/section_heading.dart';
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
    {'img': TImages.pShoes1, 'title': "FILA Shoes for Men", "price": 35.5, "brand": "Fila", "discount": 5, "isFav": false},
    {'img': TImages.pShoes2, 'title': "adidas Shoes for Women", "price": 42.5, "brand": "Fila", "discount": 10, "isFav": true},
    {'img': TImages.pShoes3, 'title': "airmax Shoes for Women", "price": 20.5, "brand": "AirMax", "discount": 30, "isFav": false},
    {'img': TImages.pShoes5, 'title': "salomon Shoes for Men", "price": 28.5, "brand": "Salomon", "discount": 12, "isFav": true},
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
                    THomeCategories(tmp: [
                      {'image': "assets/icons/categories/icons8-sport-64.png", 'title': "Sport"},
                      {'image': "assets/icons/categories/icons8-jersey-64.png", 'title': "T-Shirt"},
                      {'image': "assets/icons/categories/icons8-shoes-64.png", 'title': "Shoes"},
                      {'image': "assets/icons/categories/icons8-toy-64.png", 'title': "Toy"},
                      {'image': "assets/icons/categories/icons8-jewel-64.png", 'title': "Jewel"},
                      {'image': "assets/icons/categories/icons8-cosmetics-64.png", 'title': "Cosmetics"},
                    ],),
                  ],
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections,),
            ],
          )),

          /// -- Body
          const Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
            child: TPromoSlider(banners: [
              TImages.banner_3,
              TImages.banner_2,
              TImages.banner_1,
              TImages.banner_4,
              TImages.banner_5,
            ]),
          ),

          TSectionHeading(title: 'Popular Products', onPressed: (){},),
          const SizedBox(height: TSizes.spaceBtwItems,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: TSizes.sm),
            child: TGridLayout(
              itemCount: 4,
              itemBuilder: (_, index) => TProductVertical(product: products[index]),
            ),
          ),

        ],
      ),
    ));
  }
}
