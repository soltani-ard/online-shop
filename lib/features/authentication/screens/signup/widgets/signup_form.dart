import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop/features/authentication/screens/signup/verify_email.dart';
import 'package:online_shop/features/authentication/screens/signup/widgets/terms_conditions_checkbox.dart';
import 'package:online_shop/utils/constants/sizes.dart';
import 'package:online_shop/utils/constants/text_strings.dart';
import 'package:online_shop/utils/helpers/helper_functions.dart';

class TSignUpForm extends StatelessWidget {
  const TSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = THelperFunctions.isDarkMode(context);
    return Form(child: Column(
      children: [
        /// First Name & Last Name
        Row(
          children: [
            /// first name
            Expanded(
              child: TextFormField(
                expands: false,
                decoration: const InputDecoration(
                  labelText: TTexts.firstName,
                  prefixIcon: Icon(Iconsax.user),
                ),
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwInputFields,),

            /// last name
            Expanded(
              child: TextFormField(
                expands: false,
                decoration: const InputDecoration(
                  labelText: TTexts.lastName,
                  prefixIcon: Icon(Iconsax.user),
                ),
              ),
            ),

          ],
        ),
        const SizedBox(height: TSizes.spaceBtwInputFields,),

        /// Username
        TextFormField(
          expands: false,
          decoration: const InputDecoration(
            labelText: TTexts.userName,
            prefixIcon: Icon(Iconsax.user_edit),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwInputFields,),

        /// Email
        TextFormField(
          expands: false,
          decoration: const InputDecoration(
            labelText: TTexts.email,
            prefixIcon: Icon(Iconsax.direct),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwInputFields,),

        /// Phone Number
        TextFormField(
          expands: false,
          decoration: const InputDecoration(
            labelText: TTexts.phoneNumber,
            prefixIcon: Icon(Iconsax.call),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwInputFields,),

        /// Password
        TextFormField(
          expands: false,
          decoration: const InputDecoration(
            labelText: TTexts.password,
            prefixIcon: Icon(Iconsax.password_check),
            suffixIcon: Icon(Iconsax.eye_slash),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwInputFields,),

        /// Term & Conditions
        const TTermsAndConditionsCheckBox(),
        const SizedBox(height: TSizes.spaceBtwSections,),

        /// SignUp Button
        SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){Get.to(()=> const VerifyEmailScreen());}, child: const Text(TTexts.createAccount)))

      ],
    ));
  }
}
