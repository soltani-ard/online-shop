import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop/common/widgets/appbar/appbar.dart';
import 'package:online_shop/common/widgets/brands/brand_card.dart';
import 'package:online_shop/common/widgets/layouts/grid_layout.dart';
import 'package:online_shop/common/widgets/text/section_heading.dart';
import 'package:online_shop/features/shop/screens/brand/brand_products.dart';
import 'package:online_shop/utils/constants/image_strings.dart';
import 'package:online_shop/utils/constants/sizes.dart';
import 'package:online_shop/utils/constants/text_strings.dart';

class AllBrandsScreen extends StatelessWidget {
  AllBrandsScreen({super.key});

  late List brands = [
    {'image': TImages.nike, 'title': "Nike", 'productNumber': 320},
    {'image': TImages.adidas, 'title': "Adidas", 'productNumber': 230},
    {'image': TImages.fila, 'title': "Fila", 'productNumber': 108},
    {'image': TImages.chanel, 'title': "Chanel", 'productNumber': 400},
    {'image': TImages.puma, 'title': "Puma", 'productNumber': 80},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text(TTexts.allBrands),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Heading
              const TSectionHeading(
                title: TTexts.brands,
                showActionButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              /// Brands
              TGridLayout(
                  itemCount: brands.length,
                  mainAxisExtent: 80,
                  itemBuilder: (_, index) => TBrandCard(
                        title: brands[index]['title'],
                        image: brands[index]['image'],
                        productNumber: brands[index]['productNumber'],
                        showBorder: true,
                        onTap: () =>
                            Get.to(() => TBrandProducts(brand: brands[index])),
                      )),
            ],
          ),
        ),
      ),
    );
  }
}
