import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:online_shop/data/repositories/authentication/authentication_repository.dart';
import 'package:online_shop/features/personalization/controllers/user_controller.dart';
import 'package:online_shop/utils/constants/image_strings.dart';
import 'package:online_shop/utils/device/network_manager.dart';
import 'package:online_shop/utils/popups/full_screen_loader.dart';
import 'package:online_shop/utils/popups/loaders.dart';

class LoginController extends GetxController {
  /// variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  /// login
  Future<void> emailAndPasswordSignIn() async {
    try {
      // start loading
      TFullScreenLoader.openLoadingDialog(
          'Logging you in ...', TImages.loading);

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // form validation
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // save data if remember me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // login user with email & password
      final userCredential = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // redirect user to home page
      TFullScreenLoader.stopLoading();
      AuthenticationRepository.instance.screenRedirect();

      // move to verify email screen
    } catch (e) {
      TFullScreenLoader.stopLoading();
      // show some generic error to user
      TLoader.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// social login - google
  Future<void> googleSignIn() async {
    try {
      // start loading
      TFullScreenLoader.openLoadingDialog(
          'Logging you in ...', TImages.loading);

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // google authentication
      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();

      // save user record
      userController.saveUserRecord(userCredentials);

      // redirect user to home page
      TFullScreenLoader.stopLoading();
      AuthenticationRepository.instance.screenRedirect();

      // move to verify email screen
    } catch (e) {
      TFullScreenLoader.stopLoading();
      // show some generic error to user
      TLoader.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
