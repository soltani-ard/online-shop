import 'package:flutter/material.dart';
import 'package:online_shop/utils/constants/colors.dart';

class TSettingsMenuTiles extends StatelessWidget {
  const TSettingsMenuTiles(
      {super.key,
      required this.icon,
      required this.title,
      required this.subTitle,
      this.trailing,
      required this.onTap});

  final IconData icon;
  final String title, subTitle;
  final Widget? trailing;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        size: 28,
        color: TColors.primary,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Text(
        subTitle,
        style: Theme.of(context).textTheme.labelMedium,
      ),
      trailing: trailing,
    );
  }
}
