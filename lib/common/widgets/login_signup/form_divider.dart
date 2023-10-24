import 'package:flutter/material.dart';
import 'package:online_shop/utils/constants/colors.dart';
import 'package:online_shop/utils/constants/text_strings.dart';
import 'package:online_shop/utils/helpers/helper_functions.dart';

class TFormDivider extends StatelessWidget {
  const TFormDivider({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    bool isDark = THelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(child: Divider(color: isDark ? TColors.darkerGrey : TColors.grey, thickness: 0.5, indent: 60, endIndent: 5,)),
        Text(title, style: Theme.of(context).textTheme.labelMedium,),
        Flexible(child: Divider(color: isDark ? TColors.darkerGrey : TColors.grey, thickness: 0.5, indent: 5, endIndent: 60,)),
      ],
    );
  }
}
