import 'package:flutter/material.dart';
import 'package:online_shop/common/widgets/appbar/appbar.dart';
import 'package:online_shop/common/widgets/products/rating/rating_bar_indicator.dart';
import 'package:online_shop/features/shop/screens/product_reviews/widgets/overall_product_rating.dart';
import 'package:online_shop/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:online_shop/utils/constants/sizes.dart';
import 'package:online_shop/utils/constants/text_strings.dart';

class ProductReviews extends StatelessWidget {
  const ProductReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Appbar
      appBar: const TAppBar(
        title: Text(TTexts.reviewsAndRatings),
        showBackArrow: true,
      ),

      /// Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(TTexts.reviewsDescriptionText),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              /// Overall Product Ratings
              const TOverallProductRating(),
              const TRatingBarIndicator(rating: 3.5),
              Text(
                '12,611',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// User Reviews List
              const TUserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
