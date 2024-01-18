import 'package:flutter/material.dart';
import 'package:online_shop/common/widgets/shimmer_effect/shimmer_effect.dart';
import 'package:online_shop/utils/constants/sizes.dart';

class TCategoryShimmer extends StatelessWidget {
  const TCategoryShimmer({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 80,
        child: ListView.separated(
          itemCount: itemCount,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (_, __) => const SizedBox(
            width: TSizes.spaceBtwItems,
          ),
          itemBuilder: (_, __) {
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TShimmerEffect(
                  width: 55,
                  height: 55,
                  radius: 55,
                ),
                SizedBox(
                  height: TSizes.spaceBtwItems / 2,
                ),
                TShimmerEffect(width: 55, height: 8)
              ],
            );
          },
        ));
  }
}
