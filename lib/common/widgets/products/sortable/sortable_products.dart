import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop/common/widgets/layouts/grid_layout.dart';
import 'package:online_shop/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:online_shop/utils/constants/sizes.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
    required this.allProducts,
  });

  final List allProducts;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// DropDown
        DropdownButtonFormField(
          items: [
            'Name',
            'Higher Price',
            'Lower Price',
            'Sale',
            'Newest',
            'Popularity'
          ]
              .map((option) => DropdownMenuItem(
            value: option,
            child: Text(option),
          ))
              .toList(),
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value) {},
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),

        /// Products
        TGridLayout(
            itemCount: allProducts.length,
            itemBuilder: (_, index) =>
                TProductVertical(product: allProducts[index])),
      ],
    );
  }
}
