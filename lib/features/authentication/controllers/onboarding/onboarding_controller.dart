import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:online_shop/features/authentication/screens/login/login.dart';
import 'package:online_shop/utils/constants/keys.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  /// Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  /// Update Current Index when Page Scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  ///  Jump to the specific dot selected page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  ///  Update Current Index & jump to next page
  void nextPage() {
    if (currentPageIndex.value == 2) {
      // because 3 pages.
      // onboarding screen visited for first time then hide for next run app
      final storage = GetStorage();
      storage.write(TKeys.isFirstTime, false);

      // redirect login page
      Get.offAll(() => const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page); // use jumpToPage
      // jumpTo(get double var)
      // jumpToPage(get int var)
    }
  }

  ///  update Current Index & jump to last page
  void skipPage() {
    currentPageIndex.value = 2; // because 3 pages.
    pageController.jumpToPage(2);
  }
}
