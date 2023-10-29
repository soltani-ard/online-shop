import 'package:flutter/material.dart';
import 'package:online_shop/common/widgets/appbar/appbar.dart';
import 'package:online_shop/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:online_shop/utils/constants/colors.dart';
import 'package:online_shop/utils/constants/text_strings.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TTexts.homeAppBarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: TColors.grey),
          ),
          Text(
            TTexts.homeAppBarSubTitle,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: TColors.textWhite),
          ),
        ],
      ),
      actions: [
        TCartCounterIcon(
            count: "2",
            iconColor: TColors.textWhite,
            bgBadge: TColors.black,
            fgBadge: TColors.textWhite,
            onPressed: () {})
      ],
    );
  }
}
