import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop/common/styles/spacing_styles.dart';
import 'package:online_shop/common/widgets/login_signup/form_divider.dart';
import 'package:online_shop/common/widgets/login_signup/social_buttons.dart';
import 'package:online_shop/features/authentication/screens/login/widgets/login_form.dart';
import 'package:online_shop/features/authentication/screens/login/widgets/login_header.dart';
import 'package:online_shop/utils/constants/colors.dart';
import 'package:online_shop/utils/constants/image_strings.dart';
import 'package:online_shop/utils/constants/sizes.dart';
import 'package:online_shop/utils/constants/text_strings.dart';
import 'package:online_shop/utils/helpers/helper_functions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = THelperFunctions.isDarkMode(context);
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// logo, title, sub-title, ...
              TLoginHeader(),

              /// Form
              TLoginForm(),

              /// Divider
              TFormDivider(title: TTexts.orSignInWith),
              SizedBox(height: TSizes.spaceBtwSelection,),

              /// Footer
              TSocialButtons(),

            ],
          ),
        ),
      ),
    );
  }
}
