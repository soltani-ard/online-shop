import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:online_shop/data/repositories/user/user_repository.dart';
import 'package:online_shop/features/personalization/controllers/user_controller.dart';
import 'package:online_shop/features/personalization/screens/profile/profile.dart';
import 'package:online_shop/utils/constants/image_strings.dart';
import 'package:online_shop/utils/device/network_manager.dart';
import 'package:online_shop/utils/popups/full_screen_loader.dart';
import 'package:online_shop/utils/popups/loaders.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  /// variables
  final userController = UserController.instance;
  final userRepository = UserRepository.instance;
  final updateNameCtrlFormKey = GlobalKey<FormState>();
  final firstName = TextEditingController();
  final lastName = TextEditingController();

  /// init user data
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  /// fetch user record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  /// update user record
  Future<void> updateUserName() async {
    try {
      // start loading
      TFullScreenLoader.openLoadingDialog(
          'we are updating your information ...', TImages.loading);

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // form validation
      if (!updateNameCtrlFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      // update process
      Map<String, dynamic> name = {
        'firstName': firstName.text.trim(),
        'lastName': lastName.text.trim()
      };
      await userRepository.updateSingleField(name);

      // update user value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();
      userController.user.value.fullName;

      // remove loader
      TFullScreenLoader.stopLoading();

      // show success message
      TLoader.successSnackBar(
          title: 'Congratulations', message: 'Your Name has been updated!');

      // move to verify email screen
      Get.off(() => const ProfileScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      // show some generic error to user
      TLoader.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
