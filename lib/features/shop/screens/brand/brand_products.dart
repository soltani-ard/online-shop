import 'package:flutter/material.dart';
import 'package:online_shop/common/widgets/appbar/appbar.dart';
import 'package:online_shop/common/widgets/brands/brand_card.dart';
import 'package:online_shop/common/widgets/products/sortable/sortable_products.dart';
import 'package:online_shop/utils/constants/image_strings.dart';
import 'package:online_shop/utils/constants/sizes.dart';

class TBrandProducts extends StatelessWidget {
  TBrandProducts({super.key, required this.brand});

  final Map brand;
  late List allProducts = [
    {
      'img': TImages.pShort3,
      'title': "Short for you",
      "price": 9.5,
      "brand": "Adidas",
      "discount": 30,
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
      'img': TImages.pShort2,
      'title': "Short for you",
      "price": 7.5,
      "brand": "Adidas",
      "discount": 10,
      "isFav": true
    },
    {
      'img': TImages.pBall1,
      'title': "Ball for you",
      "price": 10.5,
      "brand": "Nike",
      "discount": 5,
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
      'img': TImages.pShoes7,
      'title': "Shoes for you",
      "price": 15.5,
      "brand": "Nike",
      "discount": 8,
      "isFav": false
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
      'img': TImages.pTShirt3,
      'title': "T-Shirt for you",
      "price": 18.5,
      "brand": "Adidas",
      "discount": 30,
      "isFav": false
    },
    {
      'img': TImages.pCoat1,
      'title': "Coat for you",
      "price": 60.5,
      "brand": "Chanel",
      "discount": 5,
      "isFav": false
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
      'img': TImages.pShoes8,
      'title': "Shoes for you",
      "price": 40.5,
      "brand": "Dior",
      "discount": 5,
      "isFav": false
    },
    {
      'img': TImages.pCoat4,
      'title': "Coat for you",
      "price": 100.5,
      "brand": "Zara",
      "discount": 12,
      "isFav": false
    },
    {
      'img': TImages.pCoat3,
      'title': "Coat for you",
      "price": 90.5,
      "brand": "Zara",
      "discount": 30,
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
      'img': TImages.pShoes5,
      'title': "Shoes for you",
      "price": 38.5,
      "brand": "Salomon",
      "discount": 12,
      "isFav": true
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
      'img': TImages.pShoes1,
      'title': "Shoes for you",
      "price": 35.5,
      "brand": "Fila",
      "discount": 5,
      "isFav": false
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
      'img': TImages.pTShirt1,
      'title': "T-Shirt for you",
      "price": 15.5,
      "brand": "Nike",
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
    {
      'img': TImages.pBall2,
      'title': "Ball for you",
      "price": 12.5,
      "brand": "Nike",
      "discount": 10,
      "isFav": true
    },
    {
      'img': TImages.pShort4,
      'title': "Short for you",
      "price": 4.5,
      "brand": "Adidas",
      "discount": 12,
      "isFav": true
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
      'img': TImages.pBall7,
      'title': "Ball for you",
      "price": 30.5,
      "brand": "Puma",
      "discount": 5,
      "isFav": false
    },
    {
      'img': TImages.pShort1,
      'title': "Short for you",
      "price": 5.5,
      "brand": "Adidas",
      "discount": 5,
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
      'img': TImages.pBall4,
      'title': "Ball for you",
      "price": 16.5,
      "brand": "Adidas",
      "discount": 12,
      "isFav": true
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
      'img': TImages.pShoes6,
      'title': "Shoes for you",
      "price": 55.5,
      "brand": "Nike",
      "discount": 10,
      "isFav": false
    },
    {
      'img': TImages.pCoat2,
      'title': "Coat for you",
      "price": 80.5,
      "brand": "Chanel",
      "discount": 10,
      "isFav": true
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(brand['title']),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Brand Details
              TBrandCard(
                title: brand['title'],
                image: brand['image'],
                productNumber: brand['productNumber'],
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              TSortableProducts(
                  allProducts: getBrandProducts(allProducts, brand['title']))
            ],
          ),
        ),
      ),
    );
  }

  getBrandProducts(List allProducts, brandName) {
    Map<dynamic, dynamic> brandProducts = {};

    for (var i = 0; i < allProducts.length; i++) {
      if (allProducts[i]['brand'] == brandName) {
        brandProducts[i] = allProducts[i];
      }
    }

    List<dynamic> brandProductsList = brandProducts.values.toList();
    return brandProductsList;
  }
}
