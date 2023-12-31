import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop/common/widgets/appbar/appbar.dart';
import 'package:online_shop/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:online_shop/common/widgets/shimmer_effect/shimmer_effect.dart';
import 'package:online_shop/features/personalization/controllers/user_controller.dart';
import 'package:online_shop/utils/constants/colors.dart';
import 'package:online_shop/utils/constants/text_strings.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final userCtrl = Get.put(UserController());
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
          Obx(() {
            if (userCtrl.profileLoading.value) {
              // display a shimmer loader while user profile is being load
              return const TShimmerEffect(width: 80, height: 15);
            } else {
              return Text(
                userCtrl.user.value.fullName,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: TColors.textWhite),
              );
            }
          }),
        ],
      ),
      actions: [
        TCartCounterIcon(
            count: "2",
            iconColor: TColors.textWhite,
            bgBadge: Colors.redAccent,
            fgBadge: Colors.white,
            onPressed: () {})
      ],
    );
  }
}
