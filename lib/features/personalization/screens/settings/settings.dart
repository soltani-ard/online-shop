import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop/common/widgets/appbar/appbar.dart';
import 'package:online_shop/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:online_shop/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:online_shop/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:online_shop/common/widgets/text/section_heading.dart';
import 'package:online_shop/data/repositories/authentication/authentication_repository.dart';
import 'package:online_shop/features/shop/screens/cart/cart.dart';
import 'package:online_shop/features/shop/screens/order/order.dart';
import 'package:online_shop/utils/constants/colors.dart';
import 'package:online_shop/utils/constants/sizes.dart';
import 'package:online_shop/utils/constants/text_strings.dart';
import '../address/address.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Header
            TPrimaryHeaderContainer(
                child: Column(
              children: [
                /// -- Appbar
                TAppBar(
                  title: Text(
                    TTexts.account,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .apply(color: TColors.white),
                  ),
                ),

                /// -- user profile card
                const TUserProfileTile(),

                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
              ],
            )),

            /// -- Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TSectionHeading(
                    title: TTexts.accountSettings,
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  TSettingsMenuTiles(
                      icon: Iconsax.safe_home,
                      title: TTexts.myAddresses,
                      subTitle: TTexts.myAddressesSubTitle,
                      onTap: () => Get.to(() => const Addresses())),
                  TSettingsMenuTiles(
                      icon: Iconsax.shopping_cart,
                      title: TTexts.myCart,
                      subTitle: TTexts.myCartSubTitle,
                      onTap: () => Get.to(() => const CartScreen())),
                  TSettingsMenuTiles(
                      icon: Iconsax.bag_tick,
                      title: TTexts.myOrders,
                      subTitle: TTexts.myOrdersSubTitle,
                      onTap: () => Get.to(() => const OrderScreen())),
                  TSettingsMenuTiles(
                      icon: Iconsax.bank,
                      title: TTexts.bankAccount,
                      subTitle: TTexts.bankAccountSubTitle,
                      onTap: () {}),
                  TSettingsMenuTiles(
                      icon: Iconsax.discount_shape,
                      title: TTexts.myCoupons,
                      subTitle: TTexts.myCouponsSubTitle,
                      onTap: () {}),
                  TSettingsMenuTiles(
                      icon: Iconsax.notification,
                      title: TTexts.notification,
                      subTitle: TTexts.notificationSubTitle,
                      onTap: () {}),
                  TSettingsMenuTiles(
                      icon: Iconsax.security_card,
                      title: TTexts.accountPrivacy,
                      subTitle: TTexts.accountPrivacySubTitle,
                      onTap: () {}),

                  /// -- App Settings
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const TSectionHeading(
                    title: TTexts.appSettings,
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  TSettingsMenuTiles(
                      icon: Iconsax.document_upload,
                      title: TTexts.loadData,
                      subTitle: TTexts.loadDataSubTitle,
                      onTap: () {}),
                  TSettingsMenuTiles(
                      icon: Iconsax.location,
                      title: TTexts.geolocation,
                      subTitle: TTexts.geolocationSubTitle,
                      trailing: Switch(
                        value: true,
                        onChanged: (value) {},
                      ),
                      onTap: () {}),
                  TSettingsMenuTiles(
                      icon: Iconsax.security_user,
                      title: TTexts.safeMode,
                      subTitle: TTexts.safeModeSubTitle,
                      trailing: Switch(
                        value: false,
                        onChanged: (value) {},
                      ),
                      onTap: () {}),
                  TSettingsMenuTiles(
                      icon: Iconsax.image,
                      title: TTexts.hdImageQuality,
                      subTitle: TTexts.hdImageQualitySubTitle,
                      trailing: Switch(
                        value: false,
                        onChanged: (value) {},
                      ),
                      onTap: () {}),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      child: const Text(TTexts.logout),
                      onPressed: () =>
                          AuthenticationRepository.instance.logout(),
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections * 2.5,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
