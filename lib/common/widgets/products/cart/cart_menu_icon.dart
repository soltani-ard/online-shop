import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TCartCounterIcon extends StatelessWidget {
  const TCartCounterIcon(
      {super.key,
      required this.count,
      required this.iconColor,
      required this.bgBadge,
      required this.fgBadge,
      required this.onPressed});

  final String count;
  final Color iconColor;
  final Color bgBadge;
  final Color fgBadge;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Iconsax.shopping_bag,
              color: iconColor,
            )),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: bgBadge,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
                child: Text(
              count,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .apply(color: fgBadge, fontSizeFactor: 0.8),
            )),
          ),
        )
      ],
    );
  }
}
