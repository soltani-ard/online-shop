import 'package:flutter/material.dart';
import 'package:online_shop/common/widgets/image_text/vertical_image_text.dart';
import 'package:online_shop/utils/constants/image_strings.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const TVerticalImageText(image: TImages.jerseyIcon, title: "T-shirt");

        },),
    );
  }
}