import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop/common/widgets/images/rounded_image.dart';
import 'package:online_shop/features/personalization/controllers/user_controller.dart';
import 'package:online_shop/features/personalization/screens/profile/profile.dart';
import 'package:online_shop/utils/constants/colors.dart';
import 'package:online_shop/utils/constants/image_strings.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userCtrl = UserController.instance;
    return ListTile(
      leading: const TRoundedImage(
        width: 48,
        height: 48,
        padding: EdgeInsets.zero,
        imgUrl: TImages.user,
      ),
      title: Obx(
        ()=> Text(
          userCtrl.user.value.fullName,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: TColors.white),
        ),
      ),
      subtitle: Text(
        userCtrl.user.value.email,
        style:
            Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),
      ),
      trailing: IconButton(
          onPressed: () => Get.to(() => const ProfileScreen()),
          icon: const Icon(
            Iconsax.edit,
            color: TColors.white,
          )),
    );
  }
}
