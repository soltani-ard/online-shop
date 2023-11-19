import 'package:flutter/material.dart';
import 'package:online_shop/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:online_shop/common/widgets/images/rounded_image.dart';
import 'package:online_shop/common/widgets/text/brand_title_with_verification_icon.dart';
import 'package:online_shop/utils/constants/enums.dart';
import 'package:online_shop/utils/constants/sizes.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard(
      {super.key,
      required this.title,
      required this.image,
      this.productNumber = 0,
      this.brandTextSize = TextSizes.small,
      this.showBorder = true,
      this.onTap,
      });

  final String title, image;
  final int? productNumber;
  final TextSizes brandTextSize;
  final bool showBorder;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: TRoundedContainer(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            Flexible(
              child: TRoundedImage(
                isNetworkImage: false,
                imgUrl: image,
                width: 64,
                height: 64,
                backgroundColor: Colors.transparent,
              ),
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems / 2,
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TBrandTitleWithVerificationIcon(
                    title: title,
                    brandTextSize: brandTextSize,
                  ),
                  Text(
                    "${productNumber.toString()} products",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
