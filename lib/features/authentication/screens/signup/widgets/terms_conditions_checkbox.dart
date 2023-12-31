import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop/features/authentication/controllers/signup/signup_controller.dart';
import 'package:online_shop/utils/constants/colors.dart';
import 'package:online_shop/utils/constants/sizes.dart';
import 'package:online_shop/utils/constants/text_strings.dart';
import 'package:online_shop/utils/helpers/helper_functions.dart';

class TTermsAndConditionsCheckBox extends StatelessWidget {
  const TTermsAndConditionsCheckBox({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = THelperFunctions.isDarkMode(context);
    final signupCtrl = SignupController.instance;
    return Wrap(
      direction: Axis.horizontal,
      children: [
        SizedBox(
            height: 24,
            width: 24,
            child: Obx(
              () => Checkbox(
                  value: signupCtrl.privacyPolicyCheckBoxValue.value,
                  onChanged: (value) {
                    signupCtrl.privacyPolicyCheckBoxValue.value =
                        !signupCtrl.privacyPolicyCheckBoxValue.value;
                  }),
            )),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        Text.rich(TextSpan(children: [
          TextSpan(
              text: '${TTexts.iAgreeTo} ',
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: ' ${TTexts.privacyPolicy} ',
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: isDark ? TColors.textWhite : TColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor:
                        isDark ? TColors.textWhite : TColors.primary,
                  )),
          TextSpan(
              text: ' ${TTexts.and} ',
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: ' ${TTexts.termOfUse} ',
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: isDark ? TColors.textWhite : TColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor:
                        isDark ? TColors.textWhite : TColors.primary,
                  )),
        ]))
      ],
    );
  }
}
