import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop/features/authentication/screens/onboarding/onboarding_screen.dart';
import 'package:online_shop/features/splash_screen/screen/splash_screen.dart';
import 'package:online_shop/utils/constants/text_strings.dart';
import 'package:online_shop/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: TTexts.appName,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      home: const OnBoardingScreen(),
    );
  }
}

