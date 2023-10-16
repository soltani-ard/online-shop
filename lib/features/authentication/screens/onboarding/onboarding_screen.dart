
import 'package:flutter/material.dart';
import 'package:online_shop/utils/constants/image_strings.dart';
import 'package:online_shop/utils/constants/sizes.dart';
import 'package:online_shop/utils/constants/text_strings.dart';
import 'package:online_shop/utils/helpers/helper_functions.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal Scrollable Pages
          PageView(
            children: [
              Padding(
                padding: const EdgeInsets.all(TSizes.fontSizeLg),
                child: Column(
                  children: [
                    Image(
                      image: const AssetImage(TImages.onBoardingImage1),
                      width: THelperFunctions.screenWidth() * 0.8,
                      height: THelperFunctions.screenHeight() * 0.6,
                    ),
                    Text(
                      TTexts.onBoardingTitle1,
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems,),
                    Text(
                      TTexts.onBoardingSubTitle1,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
            ],
          )
          /// Skip Button

          /// Dot Navigation SmoothPageIndicator

          /// Circular Button

        ],
      ),
    );
  }
}
