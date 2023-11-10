import 'package:flutter/material.dart';
import 'package:online_shop/utils/constants/colors.dart';
import 'package:online_shop/utils/device/device_utility.dart';
import 'package:online_shop/utils/helpers/helper_functions.dart';

class TTabBar extends StatelessWidget implements PreferredSizeWidget {
  const TTabBar({super.key, required this.tabs});
  
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white,
      child: TabBar(
        isScrollable: true,
        indicatorColor: TColors.primary,
        unselectedLabelColor: TColors.darkerGrey,
        labelColor: THelperFunctions.isDarkMode(context) ? TColors.white : TColors.black,
        tabs: tabs,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
