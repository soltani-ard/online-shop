import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop/common/widgets/appbar/appbar.dart';
import 'package:online_shop/common/widgets/images/rounded_image.dart';
import 'package:online_shop/common/widgets/shimmer_effect/shimmer_effect.dart';
import 'package:online_shop/common/widgets/text/section_heading.dart';
import 'package:online_shop/features/personalization/controllers/user_controller.dart';
import 'package:online_shop/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:online_shop/features/personalization/screens/profile/widgets/divider.dart';
import 'package:online_shop/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:online_shop/utils/constants/image_strings.dart';
import 'package:online_shop/utils/constants/sizes.dart';
import 'package:online_shop/utils/constants/text_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userCtrl = UserController.instance;
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(TTexts.profile,
            style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// -- Profile
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = userCtrl.user.value.profilePicture;
                      final image =
                          networkImage.isNotEmpty ? networkImage : TImages.user;
                      return userCtrl.imageUploading.value
                          ? const TShimmerEffect(
                              width: 80,
                              height: 80,
                              radius: 80,
                            )
                          : TRoundedImage(
                              isNetworkImage: networkImage.isNotEmpty,
                              imgUrl: image,
                              width: 80,
                              height: 80,
                              borderRadius: 100,
                            );
                    }),
                    TextButton(
                        onPressed: () => userCtrl.uploadUserProfilePicture(),
                        child: const Text(TTexts.changeProfilePicture))
                  ],
                ),
              ),
              const TAddDivider(),

              /// -- Details
              const TSectionHeading(
                title: TTexts.profileInformation,
                showActionButton: false,
              ),
              TProfileMenu(
                keyText: TTexts.name,
                valueText: userCtrl.user.value.fullName,
                onTap: () => Get.off(() => const ChangeName()),
              ),
              TProfileMenu(
                keyText: TTexts.userName,
                valueText: userCtrl.user.value.username,
                onTap: () {},
              ),

              const TAddDivider(),
              const TSectionHeading(
                title: TTexts.personalInformation,
                showActionButton: false,
              ),
              TProfileMenu(
                keyText: TTexts.userId,
                valueText: userCtrl.user.value.id,
                icon: Iconsax.copy,
                onTap: () {},
              ),
              TProfileMenu(
                keyText: TTexts.email,
                valueText: userCtrl.user.value.email,
                onTap: () {},
              ),
              TProfileMenu(
                keyText: TTexts.phoneNumber,
                valueText: userCtrl.user.value.phoneNumber,
                onTap: () {},
              ),
              TProfileMenu(
                keyText: TTexts.gender,
                valueText: 'Male',
                onTap: () {},
              ),
              TProfileMenu(
                keyText: TTexts.dateOfBrith,
                valueText: '14 Nov 1995',
                onTap: () {},
              ),

              const TAddDivider(),
              Center(
                child: TextButton(
                  onPressed: () => userCtrl.deleteAccountWarningPopup(),
                  child: const Text(
                    TTexts.closeAccount,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
