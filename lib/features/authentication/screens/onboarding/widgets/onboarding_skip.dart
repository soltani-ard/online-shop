
import 'package:flutter/material.dart';
import 'package:online_shop/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:online_shop/utils/constants/sizes.dart';
import 'package:online_shop/utils/constants/text_strings.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(top: TSizes.defaultSpace, right: TSizes.defaultSpace, child: TextButton(onPressed: ()=> OnBoardingController.instance.skipPage(),
      child: const Text(TTexts.skip),),);
  }
}
