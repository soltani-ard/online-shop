import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop/common/widgets/appbar/appbar.dart';
import 'package:online_shop/common/widgets/icons/circular_icon.dart';
import 'package:online_shop/common/widgets/layouts/grid_layout.dart';
import 'package:online_shop/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:online_shop/features/shop/screens/home/home.dart';
import 'package:online_shop/utils/constants/image_strings.dart';
import 'package:online_shop/utils/constants/sizes.dart';
import 'package:online_shop/utils/constants/text_strings.dart';

class FavouriteScreen extends StatelessWidget {
  FavouriteScreen({super.key});

  late List products = [
    {'img': TImages.pShoes1, 'title': "Shoes for you", "price": 60.15, "brand": "Fila", "discount": 10, "isFav": true},
    {'img': TImages.pCoat4, 'title': "Coats for you", "price": 80.5, "brand": "Adidas", "discount": 30, "isFav": true},
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: TAppBar(
        title: Text(TTexts.wishlist, style: Theme.of(context).textTheme.headlineMedium,),
        actions: [
          TCircularIcon(icon: Iconsax.add, onPressed: ()=> Get.to(()=> HomePageScreen()),)
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TGridLayout(itemCount: 2, itemBuilder: (_, index) => TProductVertical(product: products[index]))
            ],
          ),
        ),
      ),
    );
  }
}
