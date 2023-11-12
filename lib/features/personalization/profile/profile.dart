import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop/common/widgets/appbar/appbar.dart';
import 'package:online_shop/common/widgets/images/rounded_image.dart';
import 'package:online_shop/common/widgets/text/section_heading.dart';
import 'package:online_shop/features/personalization/profile/widgets/divider.dart';
import 'package:online_shop/features/personalization/profile/widgets/profile_menu.dart';
import 'package:online_shop/utils/constants/image_strings.dart';
import 'package:online_shop/utils/constants/sizes.dart';
import 'package:online_shop/utils/constants/text_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    const TRoundedImage(
                      imgUrl: TImages.user,
                      width: 150,
                      height: 150,
                    ),
                    TextButton(
                        onPressed: () {},
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
                valueText: 'Behnam',
                onTap: () {},
              ),
              TProfileMenu(
                keyText: TTexts.userName,
                valueText: 'Soltani',
                onTap: () {},
              ),

              const TAddDivider(),
              const TSectionHeading(
                title: TTexts.personalInformation,
                showActionButton: false,
              ),
              TProfileMenu(
                keyText: TTexts.userId,
                valueText: '5047852',
                icon: Iconsax.copy,
                onTap: () {},
              ),
              TProfileMenu(
                keyText: TTexts.email,
                valueText: 'admin@behnamsoltani.ir',
                onTap: () {},
              ),
              TProfileMenu(
                keyText: TTexts.phoneNumber,
                valueText: '+98-123456789',
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
                  onPressed: () {},
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
