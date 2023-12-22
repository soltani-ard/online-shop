import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop/common/widgets/loaders/animation_loader.dart';
import 'package:online_shop/utils/constants/colors.dart';
import 'package:online_shop/utils/helpers/helper_functions.dart';

// A utility class for mapping a full-screen loading dialog
class TFullScreenLoader {
  /*
        open a full screen loading dialog with a given text and animation
        this method doesn't return anything

        parameters:
            - text: the text to be displayed in the loading dialog.
            - animation: the lottie animation to be shown
   */
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      // use this for overlay dialog.
      barrierDismissible: false,
      // the dialog can't be dismissed by tapping outside it.
      builder: (_) => PopScope(
          canPop: false, // disable popping with the back button
          child: Container(
            color: THelperFunctions.isDarkMode(Get.context!)
                ? TColors.dark
                : TColors.white,
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                const SizedBox(
                  height: 250,
                ),
                TAnimationLoaderWidget(text: text, animation: animation)
              ],
            ),
          )),
    );
  }

  // stop the currently open loading dialog.
  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop(); // close the dialog using navigator
  }
}
