import 'package:flutter/material.dart';
import 'package:online_shop/utils/constants/image_strings.dart';
import 'package:online_shop/utils/constants/sizes.dart';
import 'package:online_shop/utils/constants/text_strings.dart';
import 'package:online_shop/utils/helpers/helper_functions.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(height: 100, image: AssetImage(isDark ? TImages.darkAppLogo : TImages.lightAppLogo)),
        const SizedBox(height: TSizes.sm,),
        Text(TTexts.loginTitle, style: Theme.of(context).textTheme.headlineMedium,),
        const SizedBox(height: TSizes.sm,),
        Text(TTexts.loginSubTitle, style: Theme.of(context).textTheme.bodyMedium,),
      ],
    );
  }
}
