import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop/common/widgets/image_text/vertical_image_text.dart';
import 'package:online_shop/common/widgets/shimmer_effect/category_shimmer.dart';
import 'package:online_shop/features/shop/controllers/category_controller.dart';
import 'package:online_shop/features/shop/screens/sub_category/sub_categories.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryCtrl = Get.put(CategoryController());
    return Obx(() {
      if (categoryCtrl.isLoading.value) {
        return const TCategoryShimmer();
      }

      if (categoryCtrl.featuredCategories.isEmpty) {
        return Center(
          child: Text(
            'No Data Found!',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: Colors.white),
          ),
        );
      }

      return SizedBox(
        height: 80,
        child: ListView.builder(
          itemCount: categoryCtrl.featuredCategories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final category = categoryCtrl.featuredCategories[index];
            return TVerticalImageText(
              image: category.image,
              title: category.name,
              onTap: () => Get.to(() => SubCategoriesScreen()),
            );
          },
        ),
      );
    });
  }
}
