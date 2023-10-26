import 'package:flutter/material.dart';
import 'package:online_shop/utils/theme/custom_themes/appbar_theme.dart';
import 'package:online_shop/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:online_shop/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:online_shop/utils/theme/custom_themes/chip_theme.dart';
import 'package:online_shop/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:online_shop/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:online_shop/utils/theme/custom_themes/text_field_theme.dart';
import 'package:online_shop/utils/theme/custom_themes/text_theme.dart';

class TAppTheme {
  TAppTheme._();

  /* light theme config */
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Poppins',
    textTheme: TTextTheme.lightTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    chipTheme: TChipTheme.lightChipTheme,
    outlinedButtonTheme: TOutlineButtonTheme.lightOutlineButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
  );

  /* dark theme config */
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    fontFamily: 'Poppins',
    textTheme: TTextTheme.darkTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    chipTheme: TChipTheme.darkChipTheme,
    outlinedButtonTheme: TOutlineButtonTheme.darkOutlineButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  );
}
