import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop/utils/constants/sizes.dart';

class TProfileMenu extends StatelessWidget {
  const TProfileMenu(
      {super.key,
      required this.keyText,
      required this.valueText,
      this.icon = Iconsax.arrow_right_34,
      this.onTap});

  final String keyText, valueText;
  final IconData? icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(
            left: TSizes.defaultSpace, top: TSizes.defaultSpace / 2),
        child: Row(
          children: [
            Expanded(
                flex: 3,
                child: Text(
                  keyText,
                  style: Theme.of(context).textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis,
                )),
            Expanded(
                flex: 5,
                child: Text(
                  valueText,
                  style: Theme.of(context).textTheme.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                )),
            Expanded(
                child: Icon(
              icon,
              size: 18,
            )),
          ],
        ),
      ),
    );
  }
}
