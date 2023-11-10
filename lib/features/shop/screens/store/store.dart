import 'package:flutter/material.dart';
import 'package:online_shop/common/brands/brand_card.dart';
import 'package:online_shop/common/widgets/appbar/appbar.dart';
import 'package:online_shop/common/widgets/appbar/tabbar.dart';
import 'package:online_shop/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:online_shop/common/widgets/layouts/grid_layout.dart';
import 'package:online_shop/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:online_shop/common/widgets/text/section_heading.dart';
import 'package:online_shop/features/shop/screens/store/widgets/category_tab.dart';
import 'package:online_shop/utils/constants/colors.dart';
import 'package:online_shop/utils/constants/enums.dart';
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

  late List shoesProducts = [
    {'img': TImages.pShoes1, 'title': "Shoes for you", "price": 35.5, "brand": "Fila", "discount": 5, "isFav": false},
    {'img': TImages.pShoes2, 'title': "Shoes for you", "price": 42.5, "brand": "Fila", "discount": 10, "isFav": true},
    {'img': TImages.pShoes3, 'title': "Shoes for you", "price": 20.5, "brand": "AirMax", "discount": 30, "isFav": false},
    {'img': TImages.pShoes5, 'title': "Shoes for you", "price": 38.5, "brand": "Salomon", "discount": 12, "isFav": true},
    {'img': TImages.pShoes6, 'title': "Shoes for you", "price": 55.5, "brand": "Nike", "discount": 10, "isFav": false},
    {'img': TImages.pShoes7, 'title': "Shoes for you", "price": 15.5, "brand": "Nike", "discount": 8, "isFav": false},
    {'img': TImages.pShoes8, 'title': "Shoes for you", "price": 40.5, "brand": "Dior", "discount": 5, "isFav": false},
  ];

  late List coatsProducts = [
    {'img': TImages.pCoat1, 'title': "Coat for you", "price": 60.5, "brand": "Chanel", "discount": 5, "isFav": false},
    {'img': TImages.pCoat2, 'title': "Coat for you", "price": 80.5, "brand": "Chanel", "discount": 10, "isFav": true},
    {'img': TImages.pCoat3, 'title': "Coat for you", "price": 90.5, "brand": "Zara", "discount": 30, "isFav": true},
    {'img': TImages.pCoat4, 'title': "Coat for you", "price": 100.5, "brand": "Zara", "discount": 12, "isFav": false},
  ];

  late List ballsProducts = [
    {'img': TImages.pBall1, 'title': "Ball for you", "price": 10.5, "brand": "Nike", "discount": 5, "isFav": false},
    {'img': TImages.pBall2, 'title': "Ball for you", "price": 12.5, "brand": "Nike", "discount": 10, "isFav": true},
    {'img': TImages.pBall3, 'title': "Ball for you", "price": 14.5, "brand": "Nike", "discount": 30, "isFav": false},
    {'img': TImages.pBall4, 'title': "Ball for you", "price": 16.5, "brand": "Adidas", "discount": 12, "isFav": true},
    {'img': TImages.pBall5, 'title': "Ball for you", "price": 20.5, "brand": "Nike", "discount": 10, "isFav": false},
    {'img': TImages.pBall6, 'title': "Ball for you", "price": 25.5, "brand": "Fila", "discount": 8, "isFav": false},
    {'img': TImages.pBall7, 'title': "Ball for you", "price": 30.5, "brand": "Puma", "discount": 5, "isFav": false},
  ];

  late List shortsProducts = [
    {'img': TImages.pShort1, 'title': "Short for you", "price": 5.5, "brand": "Adidas", "discount": 5, "isFav": false},
    {'img': TImages.pShort2, 'title': "Short for you", "price": 7.5, "brand": "Adidas", "discount": 10, "isFav": true},
    {'img': TImages.pShort3, 'title': "Short for you", "price": 9.5, "brand": "Adidas", "discount": 30, "isFav": false},
    {'img': TImages.pShort4, 'title': "Short for you", "price": 4.5, "brand": "Adidas", "discount": 12, "isFav": true},
  ];

  late List tShirtProducts = [
    {'img': TImages.pTShirt1, 'title': "T-Shirt for you", "price": 15.5, "brand": "Nike", "discount": 5, "isFav": false},
    {'img': TImages.pTShirt2, 'title': "T-Shirt for you", "price": 20.5, "brand": "Adidas", "discount": 10, "isFav": true},
    {'img': TImages.pTShirt3, 'title': "T-Shirt for you", "price": 18.5, "brand": "Adidas", "discount": 30, "isFav": false},
    {'img': TImages.pTShirt4, 'title': "T-Shirt for you", "price": 21.5, "brand": "Adidas", "discount": 12, "isFav": true},
    {'img': TImages.pTShirt5, 'title': "T-Shirt for you", "price": 17.5, "brand": "Nike", "discount": 10, "isFav": false},
    {'img': TImages.pTShirt6, 'title': "T-Shirt for you", "price": 10.5, "brand": "Adidas", "discount": 8, "isFav": false},
    {'img': TImages.pTShirt7, 'title': "T-Shirt for you", "price": 6.5, "brand": "Dior", "discount": 5, "isFav": false},
    {'img': TImages.pTShirt8, 'title': "T-Shirt for you", "price": 10.5, "brand": "Dior", "discount": 5, "isFav": false},
  ];

  @override
  Widget build(BuildContext context) {
    bool isDark = THelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            TTexts.store,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
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
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      TSearchContainer(
                        text: TTexts.searchInStore,
                        onTap: () {},
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwSections,
                      ),

                      /// -- Featured Brands
                      TSectionHeading(
                        title: TTexts.featuredBrands,
                        onPressed: () {},
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems / 1.5,
                      ),

                      TGridLayout(
                          itemCount: 4,
                          mainAxisExtent: 85,
                          itemBuilder: (_, index) {
                            return TBrandCard(
                              image: brands.toList()[index]['image'],
                              title: brands.toList()[index]['title'],
                              productNumber: brands.toList()[index]
                                  ['productNumber'],
                              brandTextSize: TextSizes.medium,
                              onTap: () {},
                            );
                          }),
                    ],
                  ),
                ),

                /// -- Tabs
                bottom: const TTabBar(
                  tabs: [
                    Tab(
                      child: Text('Shoes'),
                    ),
                    Tab(
                      child: Text('Coat'),
                    ),
                    Tab(
                      child: Text('Short'),
                    ),
                    Tab(
                      child: Text('T-Shirt'),
                    ),
                    Tab(
                      child: Text('Sport'),
                    ),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(children: [
            TCategoryTab(branName: 'Nike', brandLogo: TImages.nike, topProductImages: const [TImages.pShoes4, TImages.pShoes2, TImages.pShoes7], products: shoesProducts,),
            TCategoryTab(branName: 'Chanel', brandLogo: TImages.chanel, topProductImages: const [TImages.pCoat1, TImages.pCoat2, TImages.pCoat3], products: coatsProducts,),
            TCategoryTab(branName: 'Adidas', brandLogo: TImages.adidas, topProductImages: const [TImages.pShort1, TImages.pShort2, TImages.pShort4], products: shortsProducts,),
            TCategoryTab(branName: 'Puma', brandLogo: TImages.puma, topProductImages: const [TImages.pTShirt4, TImages.pTShirt2, TImages.pTShirt3], products: tShirtProducts,),
            TCategoryTab(branName: 'Fila', brandLogo: TImages.fila, topProductImages: const [TImages.pBall1, TImages.pBall4, TImages.pBall6], products: ballsProducts,),
          ]),
        ),
      ),
    );
  }
}


