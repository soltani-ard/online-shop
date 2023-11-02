import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:online_shop/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:online_shop/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:online_shop/common/widgets/images/rounded_image.dart';
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
  const HomePageScreen({super.key});

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

          TGridLayout(
            itemCount: 4,
            itemBuilder: (_, index) => const TProductVertical(),
          )
        ],
      ),
    ));
  }
}
