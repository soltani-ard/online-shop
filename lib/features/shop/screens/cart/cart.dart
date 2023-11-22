import 'package:flutter/material.dart';
import 'package:online_shop/common/widgets/appbar/appbar.dart';
import 'package:online_shop/common/widgets/products/cart/cart_item.dart';
import 'package:online_shop/common/widgets/products/cart/quantity_with_add_and_remove_button.dart';
import 'package:online_shop/common/widgets/text/product_price.dart';
import 'package:online_shop/utils/constants/sizes.dart';
import 'package:online_shop/utils/constants/text_strings.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          TTexts.cart,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('${TTexts.checkout} \$2,420'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: 4,
          separatorBuilder: (_, __) => const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          itemBuilder: (_, index) => const Column(
            children: [
              TCartItem(),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Row(
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
        ),
      ),
    );
  }
}
