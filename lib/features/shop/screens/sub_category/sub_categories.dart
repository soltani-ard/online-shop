import 'package:flutter/material.dart';
import 'package:online_shop/common/widgets/appbar/appbar.dart';
import 'package:online_shop/common/widgets/images/rounded_image.dart';
import 'package:online_shop/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:online_shop/common/widgets/text/section_heading.dart';
import 'package:online_shop/utils/constants/image_strings.dart';
import 'package:online_shop/utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  SubCategoriesScreen({super.key});

  late List shoesProducts = [
    {
      'img': TImages.pShoes1,
      'title': "Shoes for you",
      "price": 35.5,
      "brand": "Fila",
      "discount": 5,
      "isFav": false
    },
    {
      'img': TImages.pShoes2,
      'title': "Shoes for you",
      "price": 42.5,
      "brand": "Fila",
      "discount": 10,
      "isFav": true
    },
    {
      'img': TImages.pShoes3,
      'title': "Shoes for you",
      "price": 20.5,
      "brand": "AirMax",
      "discount": 30,
      "isFav": false
    },
    {
      'img': TImages.pShoes5,
      'title': "Shoes for you",
      "price": 38.5,
      "brand": "Salomon",
      "discount": 12,
      "isFav": true
    },
    {
      'img': TImages.pShoes6,
      'title': "Shoes for you",
      "price": 55.5,
      "brand": "Nike",
      "discount": 10,
      "isFav": false
    },
    {
      'img': TImages.pShoes7,
      'title': "Shoes for you",
      "price": 15.5,
      "brand": "Nike",
      "discount": 8,
      "isFav": false
    },
    {
      'img': TImages.pShoes8,
      'title': "Shoes for you",
      "price": 40.5,
      "brand": "Dior",
      "discount": 5,
      "isFav": false
    },
  ];

  late List ballsProducts = [
    {
      'img': TImages.pBall1,
      'title': "Ball for you",
      "price": 10.5,
      "brand": "Nike",
      "discount": 5,
      "isFav": false
    },
    {
      'img': TImages.pBall2,
      'title': "Ball for you",
      "price": 12.5,
      "brand": "Nike",
      "discount": 10,
      "isFav": true
    },
    {
      'img': TImages.pBall3,
      'title': "Ball for you",
      "price": 14.5,
      "brand": "Nike",
      "discount": 30,
      "isFav": false
    },
    {
      'img': TImages.pBall4,
      'title': "Ball for you",
      "price": 16.5,
      "brand": "Adidas",
      "discount": 12,
      "isFav": true
    },
    {
      'img': TImages.pBall5,
      'title': "Ball for you",
      "price": 20.5,
      "brand": "Nike",
      "discount": 10,
      "isFav": false
    },
    {
      'img': TImages.pBall6,
      'title': "Ball for you",
      "price": 25.5,
      "brand": "Fila",
      "discount": 8,
      "isFav": false
    },
    {
      'img': TImages.pBall7,
      'title': "Ball for you",
      "price": 30.5,
      "brand": "Puma",
      "discount": 5,
      "isFav": false
    },
  ];

  late List shortsProducts = [
    {
      'img': TImages.pShort1,
      'title': "Short for you",
      "price": 5.5,
      "brand": "Adidas",
      "discount": 5,
      "isFav": false
    },
    {
      'img': TImages.pShort2,
      'title': "Short for you",
      "price": 7.5,
      "brand": "Adidas",
      "discount": 10,
      "isFav": true
    },
    {
      'img': TImages.pShort3,
      'title': "Short for you",
      "price": 9.5,
      "brand": "Adidas",
      "discount": 30,
      "isFav": false
    },
    {
      'img': TImages.pShort4,
      'title': "Short for you",
      "price": 4.5,
      "brand": "Adidas",
      "discount": 12,
      "isFav": true
    },
  ];

  late List tShirtProducts = [
    {
      'img': TImages.pTShirt1,
      'title': "T-Shirt for you",
      "price": 15.5,
      "brand": "Nike",
      "discount": 5,
      "isFav": false
    },
    {
      'img': TImages.pTShirt2,
      'title': "T-Shirt for you",
      "price": 20.5,
      "brand": "Adidas",
      "discount": 10,
      "isFav": true
    },
    {
      'img': TImages.pTShirt3,
      'title': "T-Shirt for you",
      "price": 18.5,
      "brand": "Adidas",
      "discount": 30,
      "isFav": false
    },
    {
      'img': TImages.pTShirt4,
      'title': "T-Shirt for you",
      "price": 21.5,
      "brand": "Adidas",
      "discount": 12,
      "isFav": true
    },
    {
      'img': TImages.pTShirt5,
      'title': "T-Shirt for you",
      "price": 17.5,
      "brand": "Nike",
      "discount": 10,
      "isFav": false
    },
    {
      'img': TImages.pTShirt6,
      'title': "T-Shirt for you",
      "price": 10.5,
      "brand": "Adidas",
      "discount": 8,
      "isFav": false
    },
    {
      'img': TImages.pTShirt7,
      'title': "T-Shirt for you",
      "price": 6.5,
      "brand": "Dior",
      "discount": 5,
      "isFav": false
    },
    {
      'img': TImages.pTShirt8,
      'title': "T-Shirt for you",
      "price": 10.5,
      "brand": "Dior",
      "discount": 5,
      "isFav": false
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Sports'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// banner of category
              const TRoundedImage(
                width: double.infinity,
                imgUrl: TImages.banner_5,
                applyImageRadius: true,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// sub categories
              Column(
                children: [
                  const TSectionHeading(title: 'Sport Shoes'),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: shoesProducts.length,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (_, __) => const SizedBox(
                        width: TSizes.spaceBtwItems,
                      ),
                      itemBuilder: (_, index) =>
                          TProductHorizontal(product: shoesProducts[index]),
                    ),
                  ),
                  const TSectionHeading(title: 'Sport T-Shirts'),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: tShirtProducts.length,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (_, __) => const SizedBox(
                        width: TSizes.spaceBtwItems,
                      ),
                      itemBuilder: (_, index) =>
                          TProductHorizontal(product: tShirtProducts[index]),
                    ),
                  ),
                  const TSectionHeading(title: 'Sport Balls'),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: ballsProducts.length,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (_, __) => const SizedBox(
                        width: TSizes.spaceBtwItems,
                      ),
                      itemBuilder: (_, index) =>
                          TProductHorizontal(product: ballsProducts[index]),
                    ),
                  ),
                  const TSectionHeading(title: 'Sport Shorts'),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: shortsProducts.length,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (_, __) => const SizedBox(
                        width: TSizes.spaceBtwItems,
                      ),
                      itemBuilder: (_, index) =>
                          TProductHorizontal(product: shortsProducts[index]),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
