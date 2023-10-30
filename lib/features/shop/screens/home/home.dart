import 'package:flutter/material.dart';
import 'package:online_shop/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:online_shop/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:online_shop/common/widgets/text/section_heading.dart';
import 'package:online_shop/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:online_shop/features/shop/screens/home/widgets/home_categories.dart';
import 'package:online_shop/utils/constants/colors.dart';
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
              const SizedBox(height: TSizes.spaceBtwSections,),

              /// -- Searchbar
              TSearchContainer(text: TTexts.searchInStore, onTap: (){},),
              const SizedBox(height: TSizes.spaceBtwSections,),

              /// -- Categories
              const Padding(
                padding: EdgeInsets.only(left: TSizes.defaultSpace),
                child: Column(
                  children: [
                    /// -- Heading
                    TSectionHeading(title: TTexts.popularCategories, showActionButton: false, textColor: TColors.white,),
                    SizedBox(height: TSizes.spaceBtwItems,),

                    /// -- Categories
                    THomeCategories(),

                  ],
                ),
              ),
            ],
          )),
        ],
      ),
    ));
  }
}






