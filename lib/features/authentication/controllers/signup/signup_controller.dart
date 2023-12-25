import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:online_shop/data/repositories/authentication/authentication_repository.dart';
import 'package:online_shop/data/repositories/user/user_repository.dart';
import 'package:online_shop/features/authentication/models/user_model.dart';
import 'package:online_shop/features/authentication/screens/signup/verify_email.dart';
import 'package:online_shop/utils/constants/image_strings.dart';
import 'package:online_shop/utils/device/network_manager.dart';
import 'package:online_shop/utils/popups/full_screen_loader.dart';
import 'package:online_shop/utils/popups/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// variables
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  final hidePassword = true.obs; // show or hide password
  final privacyPolicyCheckBoxValue = true.obs; // agree with privacy policy

  final signupFormKey = GlobalKey<FormState>();

  /// signup
  void signup() async {
    try {
      // start loading
      TFullScreenLoader.openLoadingDialog(
          'we are processing your information ...', TImages.loading);

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // form validation
      if (!signupFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // privacy policy check
      if (!privacyPolicyCheckBoxValue.value) {
        TFullScreenLoader.stopLoading();
        TLoader.warningSnackBar(
            title: 'Accept Privacy Policy',
            message:
                'In order to create account, you must have to read and accept the Privacy Policy & Term of Use.');
        return;
      }

      // register user in firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      // sava authentication user data in firebase
      final newUser = UserModel(
          id: userCredential.user!.uid,
          username: username.text.trim(),
          email: email.text.trim(),
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '');

      final userRepo = Get.put(UserRepository());
      userRepo.saveUserRecord(newUser);

      // show success message
      TFullScreenLoader.stopLoading();
      TLoader.successSnackBar(
          title: 'Congratulations',
          message: 'Your account has been created! Verify email to continue.');

      // move to verify email screen
      Get.to(() => VerifyEmailScreen(
            email: email.text.trim(),
          ));

      // move to verify email screen
    } catch (e) {
      TFullScreenLoader.stopLoading();
      // show some generic error to user
      TLoader.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
