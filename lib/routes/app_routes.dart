import 'package:get/get.dart';
import 'package:online_shop/features/authentication/screens/login/login.dart';
import 'package:online_shop/features/authentication/screens/onboarding/onboarding_screen.dart';
import 'package:online_shop/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:online_shop/features/authentication/screens/signup/signup.dart';
import 'package:online_shop/features/authentication/screens/signup/verify_email.dart';
import 'package:online_shop/features/personalization/screens/address/address.dart';
import 'package:online_shop/features/personalization/screens/profile/profile.dart';
import 'package:online_shop/features/personalization/screens/settings/settings.dart';
import 'package:online_shop/features/shop/screens/cart/cart.dart';
import 'package:online_shop/features/shop/screens/checkout/checkout.dart';
import 'package:online_shop/features/shop/screens/home/home.dart';
import 'package:online_shop/features/shop/screens/order/order.dart';
import 'package:online_shop/features/shop/screens/product_reviews/product_revies.dart';
import 'package:online_shop/features/shop/screens/store/store.dart';
import 'package:online_shop/features/shop/screens/wishlist/wishlist.dart';
import 'package:online_shop/routes/routes.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: TRoutes.home, page: () => HomePageScreen()),
    GetPage(name: TRoutes.store, page: () => StoreScreen()),
    GetPage(name: TRoutes.favourites, page: () => FavouriteScreen()),
    GetPage(name: TRoutes.settings, page: () => const SettingsScreen()),
    GetPage(name: TRoutes.productReviews, page: () => const ProductReviews()),
    GetPage(name: TRoutes.order, page: () => const OrderScreen()),
    GetPage(name: TRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: TRoutes.cart, page: () => const CartScreen()),
    GetPage(name: TRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: TRoutes.userAddress, page: () => const Addresses()),
    GetPage(name: TRoutes.signup, page: () => const SignUpScreen()),
    GetPage(name: TRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: TRoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: TRoutes.forgetPassword, page: () => const ForgetPassword()),
    GetPage(name: TRoutes.onBoarding, page: () => const OnBoardingScreen()),
  ];
}
