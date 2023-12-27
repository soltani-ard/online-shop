import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:online_shop/data/repositories/user/user_repository.dart';
import 'package:online_shop/features/authentication/models/user_model.dart';
import 'package:online_shop/utils/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

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
}
