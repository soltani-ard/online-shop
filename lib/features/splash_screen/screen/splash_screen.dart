import 'package:flutter/material.dart';
import 'package:online_shop/utils/constants/image_strings.dart';
import 'package:online_shop/utils/constants/text_strings.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(TImages.lightAppLogo, width: 200, height: 200,),
          Text(TTexts.appName, style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: const Color(0xfff9013f),fontSize: 36),)
        ],
      )),
    );
  }
}
