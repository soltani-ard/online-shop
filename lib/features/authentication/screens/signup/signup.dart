
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop/common/widgets/login_signup/form_divider.dart';
import 'package:online_shop/common/widgets/login_signup/social_buttons.dart';
import 'package:online_shop/utils/constants/sizes.dart';
import 'package:online_shop/utils/constants/text_strings.dart';

import 'widgets/signup_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace), child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Title
            Text(TTexts.signUpTitle, style: Theme.of(context).textTheme.headlineMedium,),
            const SizedBox(height: TSizes.spaceBtwSections,),

            /// Form
            const TSignUpForm(),
            const SizedBox(height: TSizes.spaceBtwItems,),

            /// Form Divider
            TFormDivider(title: TTexts.orSignUpWith.capitalize.toString()),
            const SizedBox(height: TSizes.spaceBtwSections,),

            /// Social Buttons
            const TSocialButtons(),


          ],
        ),),
      ),
    );
  }
}
