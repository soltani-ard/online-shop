import 'package:get/get.dart';
import 'package:online_shop/data/repositories/banners/banner_repository.dart';
import 'package:online_shop/features/shop/models/banner_model.dart';
import 'package:online_shop/utils/popups/loaders.dart';

class BannersController extends GetxController {
  static BannersController get instance => Get.find();

  final isLoading = false.obs;
  final carousalCurrentIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;
  final _bannerRepository = Get.put(BannerRepository());

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  /// -- update slider
  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }

  /// -- load banner data
  Future<void> fetchBanners() async {
    try {
      // show loader while loading banners
      isLoading.value = true;

      // fetch banners from data source (firebase, api, etc.)
      final banners = await _bannerRepository.getAllBanners();

      // update the banners list
      this.banners.assignAll(banners);
    } catch (e) {
      TLoader.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // remove loader
      isLoading.value = false;
    }
  }
}
