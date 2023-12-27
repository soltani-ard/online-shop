import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop/features/authentication/controllers/login/login_controller.dart';
import 'package:online_shop/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:online_shop/features/authentication/screens/signup/signup.dart';
import 'package:online_shop/utils/constants/sizes.dart';
import 'package:online_shop/utils/constants/text_strings.dart';
import 'package:online_shop/utils/validators/validation.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final loginCtrl = Get.put(LoginController());
    return Form(
        key: loginCtrl.loginFormKey,
        child: Padding(
          padding:
              const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
          child: Column(
            children: [
              /// Email
              TextFormField(
                controller: loginCtrl.email,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: TTexts.email,
                ),
                validator: (value) => TValidator.validateEmail(value),
              ),

              const SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),

              /// Password
              Obx(
                () => TextFormField(
                  controller: loginCtrl.password,
                  expands: false,
                  obscureText: loginCtrl.hidePassword.value,
                  decoration: InputDecoration(
                    labelText: TTexts.password,
                    prefixIcon: const Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                        onPressed: () {
                          loginCtrl.hidePassword.value =
                              !loginCtrl.hidePassword.value;
                        },
                        icon: Icon(loginCtrl.hidePassword.value
                            ? Iconsax.eye_slash
                            : Iconsax.eye)),
                  ),
                  validator: (value) => TValidator.validatePassword(value),
                ),
              ),

              const SizedBox(
                height: TSizes.spaceBtwInputFields / 2,
              ),

              /// Remember Me & Forget Password
              Row(
                children: [
                  /// Remember Me
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() => Checkbox(
                          value: loginCtrl.rememberMe.value,
                          onChanged: (value) => loginCtrl.rememberMe.value =
                              !loginCtrl.rememberMe.value)),
                      const Text(TTexts.rememberMe)
                    ],
                  ),

                  /// Forget Password
                  TextButton(
                      onPressed: () => Get.to(() => const ForgetPassword()),
                      child: const Text(TTexts.forgetPassword)),
                ],
              ),

              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// Sign In Button
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => loginCtrl.emailAndPasswordSignIn(),
                      child: const Text(TTexts.signIn))),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              /// Create Account Button
              SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                      onPressed: () {
                        Get.to(() => const SignUpScreen());
                      },
                      child: const Text(TTexts.createAccount))),
            ],
          ),
        ));
  }
}
