import 'package:flutter/material.dart';
import 'package:online_shop/common/widgets/text/section_heading.dart';
import 'package:online_shop/utils/constants/sizes.dart';
import 'package:online_shop/utils/constants/text_strings.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(
          title: TTexts.shippingAddress,
          buttonTitle: TTexts.change,
          padding: 0,
          onPressed: () {},
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 2,
        ),
        Padding(
          padding: const EdgeInsets.only(left: TSizes.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Behnam Soltani',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              const Row(
                children: [
                  Icon(
                    Icons.phone,
                    color: Colors.grey,
                    size: 16,
                  ),
                  SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  Text('+1-123-4567'),
                ],
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              const Row(
                children: [
                  Icon(
                    Icons.location_history,
                    color: Colors.grey,
                    size: 16,
                  ),
                  SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  Text('9048 Alexander Island Apt. 268'),
                ],
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
            ],
          ),
        )
      ],
    );
  }
}
