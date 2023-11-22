import 'package:flutter/material.dart';
import 'package:online_shop/common/widgets/products/cart/cart_item.dart';
import 'package:online_shop/common/widgets/products/cart/quantity_with_add_and_remove_button.dart';
import 'package:online_shop/common/widgets/text/product_price.dart';
import 'package:online_shop/utils/constants/sizes.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key,
    this.showAddAndRemoveButtons = true,
  });

  final bool showAddAndRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 1,
      separatorBuilder: (_, __) => const SizedBox(
        height: TSizes.spaceBtwSections,
      ),
      itemBuilder: (_, index) => Column(
        children: [
          const TCartItem(),
          if (showAddAndRemoveButtons)
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
          if (showAddAndRemoveButtons)
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 70,
                    ),
                    TProductQuantityWithAddAndRemoveButton(),
                  ],
                ),
                TProductPrice(price: '360')
              ],
            ),
        ],
      ),
    );
  }
}
