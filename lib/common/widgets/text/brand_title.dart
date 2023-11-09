import 'package:flutter/material.dart';
import 'package:online_shop/utils/constants/enums.dart';

class TBrandTitle extends StatelessWidget {
  const TBrandTitle(
      {super.key,
      required this.title,
      this.maxLine = 1,
      this.textColor,
      this.textAlign = TextAlign.center,
      this.brandTextSize = TextSizes.small});

  final String title;
  final int maxLine;
  final Color? textColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxLine,
      overflow: TextOverflow.ellipsis,
      style: brandTitleTheme(context, brandTextSize),
    );
  }

  TextStyle brandTitleTheme(BuildContext context, TextSizes brandTextSize) {
    switch (brandTextSize) {
      case TextSizes.small:
        return Theme.of(context).textTheme.labelMedium!.apply(color: textColor);
      case TextSizes.medium:
        return Theme.of(context).textTheme.bodyLarge!.apply(color: textColor);
      case TextSizes.large:
        return Theme.of(context).textTheme.titleLarge!.apply(color: textColor);
      default:
        return Theme.of(context).textTheme.bodyMedium!.apply(color: textColor);
    }
  }
}
