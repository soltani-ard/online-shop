import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop/common/widgets/appbar/appbar.dart';
import 'package:online_shop/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:online_shop/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:online_shop/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:online_shop/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:online_shop/utils/constants/colors.dart';
import 'package:online_shop/utils/constants/sizes.dart';
import 'package:online_shop/utils/constants/text_strings.dart';
import 'package:online_shop/utils/device/device_utility.dart';
import 'package:online_shop/utils/helpers/helper_functions.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          TPrimaryHeaderContainer(
              child: Column(
            children: [
              /// -- Appbar
              THomeAppBar(),
              SizedBox(height: TSizes.spaceBtwSections,),

              /// -- Searchbar
              TSearchContainer(text: TTexts.searchInStore),
              SizedBox(height: TSizes.spaceBtwSections,),

              /// -- Categories
            ],
          )),
        ],
      ),
    ));
  }
}


