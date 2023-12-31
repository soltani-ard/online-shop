import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop/data/repositories/authentication/authentication_repository.dart';
import 'package:online_shop/data/repositories/user/user_repository.dart';
import 'package:online_shop/features/authentication/models/user_model.dart';
import 'package:online_shop/features/authentication/screens/login/login.dart';
import 'package:online_shop/features/personalization/screens/profile/widgets/re_auth_user_login_form.dart';
import 'package:online_shop/utils/constants/image_strings.dart';
import 'package:online_shop/utils/constants/sizes.dart';
import 'package:online_shop/utils/device/network_manager.dart';
import 'package:online_shop/utils/popups/full_screen_loader.dart';
import 'package:online_shop/utils/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  /// variables
  final profileLoading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final hidePassword = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());
  final reAuthFormKey = GlobalKey<FormState>();

  /// init step
  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  /// save user record from any registration provider
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      if (userCredential != null) {
        // convert name to first and last name
        final nameParts =
            UserModel.nameParts(userCredential.user!.displayName ?? '');
        final username =
            UserModel.generateUsername(userCredential.user!.displayName ?? '');

        // map data
        final user = UserModel(
            id: userCredential.user!.uid,
            username: username,
            email: userCredential.user!.email ?? '',
            firstName: nameParts[0],
            lastName:
                nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            phoneNumber: userCredential.user!.phoneNumber ?? '',
            profilePicture: userCredential.user!.photoURL ?? '');

        // save user data
        await UserRepository.instance.saveUserRecord(user);
      }
    } catch (e) {
      TLoader.warningSnackBar(
          title: 'Data not saved',
          message:
              'Something went wrong while saving your information. you can re-save data in your profile');
    }
  }

  /// fetch user data
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  /// delete account warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(TSizes.md),
        title: 'Delete Account',
        middleText:
            'Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently.',
        confirm: ElevatedButton(
            onPressed: () async => deleteUserAccount(),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                side: const BorderSide(color: Colors.red)),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
              child: Text('Delete'),
            )),
        cancel: OutlinedButton(
            onPressed: () => Navigator.of(Get.overlayContext!).pop(),
            child: const Text('Cancel')));
  }

  /// delete user account
  void deleteUserAccount() async {
    try {
      // start loading
      TFullScreenLoader.openLoadingDialog('Processing ...', TImages.loading);

      /// first re-auth user
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        // re-verify auth email
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          TFullScreenLoader.stopLoading();
          Get.offAll(const LoginScreen());
        } else if (provider == 'password') {
          TFullScreenLoader.stopLoading();
          Get.offAll(const ReAuthLoginForm());
        }
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      // show some generic error to user
      TLoader.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// re-auth before deleting
  Future<void> reAuthenticateEmailAndPassword() async {
    try {
      // start loading
      TFullScreenLoader.openLoadingDialog('Processing ...', TImages.loading);

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // form validation
      if (!reAuthFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance
          .reAuthenticationWithEmailAndPassword(
              verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();

      TFullScreenLoader.stopLoading();
      Get.to(() => const LoginScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      // show some generic error to user
      TLoader.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
