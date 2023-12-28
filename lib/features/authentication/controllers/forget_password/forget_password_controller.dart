import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:online_shop/data/repositories/authentication/authentication_repository.dart';
import 'package:online_shop/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:online_shop/utils/constants/image_strings.dart';
import 'package:online_shop/utils/device/network_manager.dart';
import 'package:online_shop/utils/popups/full_screen_loader.dart';
import 'package:online_shop/utils/popups/loaders.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  /// variables
  final email = TextEditingController();
  final forgetPassFormKey = GlobalKey<FormState>();

  /// send reset password email
  sendPasswordResetEmail() async {
    try {
      // start loading
      TFullScreenLoader.openLoadingDialog(
          'Processing your request ...', TImages.loading);

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // form validation
      if (!forgetPassFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // send email to reset password
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      // remove loader
      TFullScreenLoader.stopLoading();

      // show success message
      TLoader.successSnackBar(
          title: 'Email Sent',
          message: 'Email Link Sent To Reset Your Password');

      // Redirect
      Get.to(() => ResetPassword(
            email: email.text.trim(),
          ));
    } catch (e) {
      TFullScreenLoader.stopLoading();
      // show some generic error to user
      TLoader.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      // start loading
      TFullScreenLoader.openLoadingDialog(
          'Processing your request ...', TImages.loading);

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // send email to reset password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // remove loader
      TFullScreenLoader.stopLoading();

      // show success message
      TLoader.successSnackBar(
          title: 'Email Sent',
          message: 'Email Link Sent To Reset Your Password');

      // Redirect
    } catch (e) {
      TFullScreenLoader.stopLoading();
      // show some generic error to user
      TLoader.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
