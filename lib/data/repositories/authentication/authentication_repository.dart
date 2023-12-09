import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:online_shop/features/authentication/screens/login/login.dart';
import 'package:online_shop/features/authentication/screens/onboarding/onboarding_screen.dart';
import 'package:online_shop/utils/constants/keys.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// variables
  final deviceStorage = GetStorage();

  ///  call from main.dart on app lunch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    // init it for first time visit
    deviceStorage.writeIfNull(TKeys.isFirstTime, true);

    if (deviceStorage.read(TKeys.isFirstTime) != true) {
      // visited then show login page
      Get.offAll(() => const LoginScreen());
    } else {
      // for first time visit then shon onboarding screen
      Get.offAll(() => const OnBoardingScreen());
    }
  }
}
