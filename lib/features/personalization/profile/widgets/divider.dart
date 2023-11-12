import 'package:flutter/material.dart';
import 'package:online_shop/utils/constants/sizes.dart';

class TAddDivider extends StatelessWidget {
  const TAddDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: TSizes.spaceBtwItems / 2,
        ),
        Divider(),
        SizedBox(
          height: TSizes.spaceBtwItems,
        ),
      ],
    );
  }
}
