import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:online_shop/common/widgets/images/rounded_image.dart';
import 'package:online_shop/common/widgets/shimmer_effect/shimmer_effect.dart';
import 'package:online_shop/features/shop/controllers/banner_controller.dart';
import 'package:online_shop/utils/constants/colors.dart';
import 'package:online_shop/utils/constants/sizes.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannersController());
    return Obx(() {
      // loader
      if (controller.isLoading.value) {
        return const TShimmerEffect(width: double.infinity, height: 190);
      }
      // no data found
      if (controller.banners.isEmpty) {
        return const Center(
          child: Text('No Data Found!'),
        );
      }

      return Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, _) =>
                  controller.updatePageIndicator(index),
            ),
            items: controller.banners
                .map((banner) => TRoundedImage(
                      imgUrl: banner.imgUrl,
                      isNetworkImage: true,
                      onPressed: () => Get.toNamed(banner.targetScreen),
                    ))
                .toList(),
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          Obx(() => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < controller.banners.length; i++)
                    TRoundedContainer(
                      width: 20,
                      height: 4,
                      margin: const EdgeInsets.only(right: 10),
                      backgroundColor:
                          controller.carousalCurrentIndex.toInt() == i
                              ? TColors.primary
                              : TColors.grey,
                    )
                ],
              ))
        ],
      );
    });
  }
}
