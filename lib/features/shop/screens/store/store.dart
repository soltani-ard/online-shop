import 'package:flutter/material.dart';
import 'package:online_shop/common/brands/brand_card.dart';
import 'package:online_shop/common/widgets/appbar/appbar.dart';
import 'package:online_shop/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:online_shop/common/widgets/layouts/grid_layout.dart';
import 'package:online_shop/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:online_shop/common/widgets/text/section_heading.dart';
import 'package:online_shop/utils/constants/colors.dart';
import 'package:online_shop/utils/constants/image_strings.dart';
import 'package:online_shop/utils/constants/sizes.dart';
import 'package:online_shop/utils/constants/text_strings.dart';
import 'package:online_shop/utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  StoreScreen({super.key});

  late List brands = [
    {'image': TImages.nike, 'title': "Nike", 'productNumber': 320},
    {'image': TImages.adidas, 'title': "Adidas", 'productNumber': 230},
    {'image': TImages.fila, 'title': "Fila", 'productNumber': 108},
    {'image': TImages.chanel, 'title': "Chanel", 'productNumber': 400},
    {'image': TImages.puma, 'title': "Puma", 'productNumber': 80},
  ];

  @override
  Widget build(BuildContext context) {
    bool isDark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        title: Text(TTexts.store, style: Theme.of(context).textTheme.headlineMedium,),
        actions: [
          TCartCounterIcon(
              count: "2",
              iconColor: isDark ? TColors.white : TColors.black,
              bgBadge: Colors.red,
              fgBadge: Colors.white,
              onPressed: () {}),
        ],
      ),

      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              floating: true,
              backgroundColor: isDark ? TColors.black : TColors.white,
              expandedHeight: 440,
              flexibleSpace: Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    /// -- SearchBar
                    const SizedBox(height: TSizes.spaceBtwItems,),
                    TSearchContainer(text: TTexts.searchInStore, onTap: (){}, showBorder: true, showBackground: false, padding: EdgeInsets.zero,),
                    const SizedBox(height: TSizes.spaceBtwSections,),

                    /// -- Featured Brands
                    TSectionHeading(title: TTexts.featuredBrands, onPressed: (){},),
                    const SizedBox(height: TSizes.spaceBtwItems / 1.5,),
                    
                    TGridLayout(itemCount: 4, mainAxisExtent: 80, itemBuilder: (_, index) {

                      return TBrandCard(
                        image: brands.toList()[index]['image'],
                        title:brands.toList()[index]['title'],
                        productNumber: brands.toList()[index]['productNumber'],
                        onTap: () {},
                      );
                    }),

                  ],
                ),
              ),
            ),
          ];
        }, body: Container(),
        
      ),

    );
  }
}
