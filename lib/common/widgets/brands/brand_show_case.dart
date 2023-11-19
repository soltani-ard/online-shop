
import 'package:flutter/material.dart';
import 'package:online_shop/common/widgets/brands/brand_card.dart';
import 'package:online_shop/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:online_shop/utils/constants/colors.dart';
import 'package:online_shop/utils/constants/enums.dart';
import 'package:online_shop/utils/constants/sizes.dart';
import 'package:online_shop/utils/helpers/helper_functions.dart';

class TBrandShowCase extends StatelessWidget {
  const TBrandShowCase({
    super.key,
    required this.images,
    required this.branName,
    required this.brandLogo,
    this.productNumber = 0,
  });

  final List<String> images;
  final String branName, brandLogo;
  final int productNumber;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      borderColor: TColors.darkerGrey,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      padding: const EdgeInsets.all(TSizes.md),
      child: Column(
        children: [
          TBrandCard(
            title: branName,
            image: brandLogo,
            productNumber: productNumber,
            brandTextSize: TextSizes.medium,
            showBorder: false,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: images
                .map((image) => brandTopProductImageWidget(context, image))
                .toList(),
          ),
        ],
      ),
    );
  }

  Expanded brandTopProductImageWidget(BuildContext context, String image) {
    return Expanded(
      child: TRoundedContainer(
        height: 100,
        backgroundColor: THelperFunctions.isDarkMode(context)
            ? TColors.darkerGrey
            : TColors.light,
        margin: const EdgeInsets.only(right: TSizes.sm),
        padding: const EdgeInsets.only(right: TSizes.sm),
        child: Image(
          fit: BoxFit.contain,
          image: AssetImage(image),
        ),
      ),
    );
  }
}
