import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop/common/widgets/image_text/vertical_image_text.dart';
import 'package:online_shop/features/shop/screens/sub_category/sub_categories.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
    this.tmp,
  });

  final List? tmp;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return TVerticalImageText(
            image: tmp![index]['image'],
            title: tmp![index]['title'],
            onTap: () => Get.to(() => SubCategoriesScreen()),
          );
        },
      ),
    );
  }
}
