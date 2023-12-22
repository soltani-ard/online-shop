import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop/features/authentication/controllers/signup/signup_controller.dart';
import 'package:online_shop/features/authentication/screens/signup/widgets/terms_conditions_checkbox.dart';
import 'package:online_shop/utils/constants/sizes.dart';
import 'package:online_shop/utils/constants/text_strings.dart';
import 'package:online_shop/utils/helpers/helper_functions.dart';
import 'package:online_shop/utils/validators/validation.dart';

class TSignUpForm extends StatelessWidget {
  const TSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = THelperFunctions.isDarkMode(context);
    final signupCtrl = Get.put(SignupController());
    return Form(
        key: signupCtrl.signupFormKey,
        child: Column(
          children: [
            /// First Name & Last Name
            Row(
              children: [
                /// first name
                Expanded(
                  child: TextFormField(
                    controller: signupCtrl.firstName,
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: TTexts.firstName,
                      prefixIcon: Icon(Iconsax.user),
                    ),
                    validator: (value) =>
                        TValidator.validateEmptyText(TTexts.firstName, value),
                  ),
                ),
                const SizedBox(
                  width: TSizes.spaceBtwInputFields,
                ),

                /// last name
                Expanded(
                  child: TextFormField(
                    controller: signupCtrl.lastName,
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: TTexts.lastName,
                      prefixIcon: Icon(Iconsax.user),
                    ),
                    validator: (value) =>
                        TValidator.validateEmptyText(TTexts.lastName, value),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),

            /// Username
            TextFormField(
              controller: signupCtrl.username,
              expands: false,
              decoration: const InputDecoration(
                labelText: TTexts.userName,
                prefixIcon: Icon(Iconsax.user_edit),
              ),
              validator: (value) =>
                  TValidator.validateEmptyText(TTexts.userName, value),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),

            /// Email
            TextFormField(
              controller: signupCtrl.email,
              expands: false,
              decoration: const InputDecoration(
                labelText: TTexts.email,
                prefixIcon: Icon(Iconsax.direct),
              ),
              validator: (value) => TValidator.validateEmail(value),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),

            /// Phone Number
            TextFormField(
              controller: signupCtrl.phoneNumber,
              expands: false,
              decoration: const InputDecoration(
                labelText: TTexts.phoneNumber,
                prefixIcon: Icon(Iconsax.call),
              ),
              validator: (value) => TValidator.validatePhoneNumber(value),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),

            /// Password
            Obx(
              () => TextFormField(
                controller: signupCtrl.password,
                expands: false,
                obscureText: signupCtrl.hidePassword.value,
                decoration: InputDecoration(
                  labelText: TTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                      onPressed: () {
                        signupCtrl.hidePassword.value =
                            !signupCtrl.hidePassword.value;
                      },
                      icon: Icon(signupCtrl.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye)),
                ),
                validator: (value) => TValidator.validatePassword(value),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),

            /// Term & Conditions
            const TTermsAndConditionsCheckBox(),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            /// SignUp Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      signupCtrl.signup();
                    },
                    child: const Text(TTexts.createAccount)))
          ],
        ));
  }
}
