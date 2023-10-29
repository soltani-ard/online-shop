import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop/utils/constants/colors.dart';
import 'package:online_shop/utils/constants/sizes.dart';
import 'package:online_shop/utils/device/device_utility.dart';
import 'package:online_shop/utils/helpers/helper_functions.dart';

class TSearchContainer extends StatelessWidget {
  const TSearchContainer({
    super.key, required this.text, this.icon = Iconsax.search_normal,  this.showBackground = true,  this.showBorder = true,
  });

  final String text;
  final IconData icon;
  final bool showBackground, showBorder;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
      child: Container(
        width: TDeviceUtils.getScreenWidth(context),
        padding: const EdgeInsets.all(TSizes.md),
        decoration: BoxDecoration(
          color: showBackground ? (isDark ? TColors.dark : TColors.light) : (Colors.transparent),
          borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
          border: showBorder ? Border.all(color: TColors.grey) : null,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, color: TColors.darkerGrey,),
            const SizedBox(width: TSizes.spaceBtwItems,),
            Text(text, style: Theme.of(context).textTheme.bodySmall,),
          ],
        ),

      ),
    );
  }
}